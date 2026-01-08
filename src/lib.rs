pub mod scheduler;
pub mod wasm_transform;

pub mod memory;
pub mod vfs;
pub mod wasi_builtins;
pub mod wasi_fs_builtins;
pub mod threading_builtins;

use anyhow::Result;
use wasmtime::{Config, Engine, Linker, Module, Store, SharedMemory};
use std::sync::{Arc, Mutex};
use std::collections::{VecDeque, BinaryHeap, HashMap};
use std::io::Write;
use std::path::Path;

pub use crate::scheduler::{Scheduler, DeterministicThread, ExecutionTrace};
pub use crate::wasi_builtins::register_wasi_builtins;
pub use crate::wasi_fs_builtins::register_wasi_fs_builtins;
pub use crate::threading_builtins::register_threading_builtins;

#[derive(Debug, Default, Clone)]
pub struct WasmTimings {
    pub compile_wall: std::time::Duration,
    pub compile_cpu: std::time::Duration,
    pub execute_wall: std::time::Duration,
    pub execute_cpu: std::time::Duration,
    pub scheduler_calls: u64,
}

pub struct WasmModule {
    pub engine: Engine,
    pub module: Module,
}

pub fn compile_module(path: &Path) -> Result<Arc<WasmModule>> {
    let mut config = Config::new();
    config.async_support(true);
    config.shared_memory(true);
    config.enable_compiler(true);
    
    let engine = Engine::new(&config)?;

    let module = if path.extension().and_then(|s| s.to_str()) == Some("wat") {
        let wat = std::fs::read_to_string(path)?;
        Module::new(&engine, &wat)?
    } else {
        Module::from_file(&engine, path)?
    };

    Ok(Arc::new(WasmModule { engine, module }))
}

pub fn compile_module_from_bytes(bytes: &[u8]) -> Result<Arc<WasmModule>> {
    let mut config = Config::new();
    config.async_support(true);
    config.shared_memory(true);
    config.enable_compiler(true);
    
    let engine = Engine::new(&config)?;
    let module = Module::new(&engine, bytes)?;

    Ok(Arc::new(WasmModule { engine, module }))
}

pub async fn run_wasm(
    wasm_module: Arc<WasmModule>,
    stdout: Arc<Mutex<Box<dyn Write + Send>>>,
    args: Vec<String>,
    envs: Vec<(String, String)>,
    vfs_host_path: Option<&Path>,
    trace: Option<ExecutionTrace>,
    new_traces: tokio::sync::mpsc::UnboundedSender<ExecutionTrace>,
    trace_wasi: bool,
) -> Result<WasmTimings> {
    let mut timings = WasmTimings::default();
    let vfs = if let Some(host_path) = vfs_host_path {
        crate::vfs::VirtualFileSystem::from_host_path(host_path)?
    } else {
        crate::vfs::VirtualFileSystem::new()
    };
    let wasi_fs = Arc::new(crate::vfs::WasiFs::new(Arc::new(vfs)));

    let trace_state = Arc::new(Mutex::new(crate::scheduler::ExecutionTraceState {
        current_trace: trace.unwrap_or_default(),
        trace_index: 0,
        new_traces,
    }));

    let engine = &wasm_module.engine;
    let module = &wasm_module.module;

    // 3. Create a Linker (Core WASM)
    let mut linker = Linker::<DeterministicThread>::new(&engine);
    
    // Register custom WASI/WASM builtins
    register_wasi_builtins(&mut linker)?;
    register_wasi_fs_builtins(&mut linker)?;
    register_threading_builtins(&mut linker)?;

    let initial_scheduler = Arc::new(Mutex::new(Scheduler {
        paused_threads: VecDeque::new(),
        delayed_threads: BinaryHeap::new(),
        futex_blocked_threads: HashMap::new(),
        next_thread_id: 1,
        current_time: 1704067200000000000, // Fixed: 2024-01-01 00:00:00 UTC in nanoseconds
        call_count: 0,
        exited: None,
    }));

    let shared_stdout = stdout;

    // Setup shared memory if required by the module
    let mut bogus_store = Store::new(&engine, DeterministicThread {
        scheduler: initial_scheduler.clone(),
        linker: None,
        instance: None,
        stdout: shared_stdout.clone(),
        args: args.clone(),
        envs: envs.clone(),
        wasi_fs: Some(wasi_fs.clone()),
        trace_state: Some(trace_state.clone()),
        trace_wasi,
    });

    for import in module.imports() {
        if let Some(m) = import.ty().memory() {
            if m.is_shared() {
                let mem = SharedMemory::new(module.engine(), m.clone())?;
                linker.define(&mut bogus_store, import.module(), import.name(), mem.clone())?;
                break;
            }
        }
    }

    let instance_pre = linker.instantiate_pre(&module)?;

    // 4. Create the Store
    let mut store = Store::new(&engine, DeterministicThread {
        scheduler: initial_scheduler.clone(),
        linker: Some(Arc::new(linker)),
        instance: Some(instance_pre.clone()),
        stdout: shared_stdout.clone(),
        args,
        envs,
        wasi_fs: Some(wasi_fs),
        trace_state: Some(trace_state),
        trace_wasi,
    });

    let execute_wall_start = std::time::Instant::now();
    let execute_cpu_start = cpu_time::ProcessTime::now();

    // 6. Instantiate and Run
    let instance = instance_pre.instantiate_async(&mut store).await?;
    let main = instance.get_typed_func::<(), ()>(&mut store, "_start")?;

    match main.call_async(&mut store, ()).await {
        Ok(_) => {},
        Err(e) => {
            let mut is_proc_exit = false;
            for cause in e.chain() {
                if cause.to_string().contains("proc_exit") {
                    is_proc_exit = true;
                    break;
                }
            }

            if is_proc_exit {
                // This is expected when proc_exit is called
                // eprintln!("[Host] Caught proc_exit trap");
            } else {
                return Err(e);
            }
        }
    }

    timings.execute_wall = execute_wall_start.elapsed();
    timings.execute_cpu = execute_cpu_start.elapsed();
    timings.scheduler_calls = initial_scheduler.lock().unwrap().call_count;

    Ok(timings)
}
