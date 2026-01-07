use anyhow::Result;
use deterministic_wasm::{run_wasm, compile_module_from_bytes};
use deterministic_wasm::wasm_transform::transform_wasm;
use std::path::Path;
use std::io;
use std::fs;

#[tokio::main]
async fn main() -> Result<()> {
    let args: Vec<String> = std::env::args().collect();
    let mut mapdir = None;
    let mut path_str = None;
    let mut wasm_args = Vec::new();

    let mut model_check = false;
    let mut trace_arg = None;
    let mut i = 1;
    while i < args.len() {
        if args[i] == "--mapdir" && i + 1 < args.len() {
            mapdir = Some(&args[i+1]);
            i += 2;
        } else if args[i] == "--model-check" {
            model_check = true;
            i += 1;
        } else if args[i] == "--trace" && i + 1 < args.len() {
            trace_arg = Some(args[i+1].clone());
            i += 2;
        } else if path_str.is_none() {
            path_str = Some(&args[i]);
            wasm_args.push(args[i].clone());
            i += 1;
        } else {
            wasm_args.push(args[i].clone());
            i += 1;
        }
    }

    let initial_trace = if let Some(t) = trace_arg {
        let choices: Result<Vec<i32>, _> = t.split(',').map(|s| s.trim().parse::<i32>()).collect();
        Some(deterministic_wasm::scheduler::ExecutionTrace { choices: choices.map_err(|e| anyhow::anyhow!("Invalid trace format: {}", e))? })
    } else {
        None
    };

    let default_path = "example.wat".to_string();
    let path_str = path_str.unwrap_or(&default_path);
    let path = Path::new(path_str);

    if !path.exists() {
        anyhow::bail!("Error: File '{}' not found.", path_str);
    }

    println!("[Host] Starting execution of {}...", path_str);
    if let Some(dir) = mapdir {
        println!("[Host] Mapping VFS to host directory: {}", dir);
    }
    let stdout = std::sync::Arc::new(std::sync::Mutex::new(Box::new(io::stdout()) as Box<dyn io::Write + Send>));
    
    let wall_start = std::time::Instant::now();
    let cpu_start = cpu_time::ProcessTime::now();

    let compile_wall_start = std::time::Instant::now();
    let compile_cpu_start = cpu_time::ProcessTime::now();

    // Read and transform
    let input_bytes = fs::read(path)?;
    // Validate/convert to WASM if it's WAT, or just ensure it's valid WASM
    // wat::parse_bytes handles both binary WASM and WAT text format transparently
    let wasm_bytes = wat::parse_bytes(&input_bytes)?;
    
    // transform
    let transformed_wasm = transform_wasm(&wasm_bytes)?;
    let wasm_module = compile_module_from_bytes(&transformed_wasm)?;
    let compile_wall = compile_wall_start.elapsed();
    let compile_cpu = compile_cpu_start.elapsed();

    let (tx, mut rx) = tokio::sync::mpsc::unbounded_channel();
    let mut traces_to_run = std::collections::VecDeque::new();
    traces_to_run.push_back(initial_trace.unwrap_or_default());

    let mut execution_count = 0;
    while let Some(trace) = traces_to_run.pop_front() {
        execution_count += 1;
        let trace_str = trace.choices.iter().map(|c| c.to_string()).collect::<Vec<_>>().join(",");
        
        let mut repro_cmd = format!("cargo run -- {}", path_str);
        if let Some(dir) = mapdir {
            repro_cmd.push_str(&format!(" --mapdir {}", dir));
        }
        for (idx, arg) in wasm_args.iter().enumerate() {
            if idx == 0 { continue; } // skip path
            repro_cmd.push_str(&format!(" {}", arg));
        }
        if !trace_str.is_empty() {
            repro_cmd.push_str(&format!(" --trace {}", trace_str));
        }

        println!("[Host] Execution #{} with trace [{}]", execution_count, trace_str);
        println!("[Host] Reproduction: {}", repro_cmd);
        
        let mut timings = run_wasm(
            wasm_module.clone(),
            stdout.clone(),
            wasm_args.clone(),
            mapdir.map(Path::new),
            Some(trace),
            tx.clone()
        ).await?;

        timings.compile_wall = compile_wall;
        timings.compile_cpu = compile_cpu;

        if !model_check {
            println!("[Host] Execution finished.");
            println!("[Host] Compilation: wall {:?}, cpu {:?}", timings.compile_wall, timings.compile_cpu);
            println!("[Host] Execution:   wall {:?}, cpu {:?}", timings.execute_wall, timings.execute_cpu);
            println!("[Host] Scheduler:   {} calls", timings.scheduler_calls);
            break;
        }

        // Collect any new traces emitted during this run
        while let Ok(new_trace) = rx.try_recv() {
            traces_to_run.push_back(new_trace);
        }
    }

    let wall_elapsed = wall_start.elapsed();
    let cpu_elapsed = cpu_start.elapsed();
    println!("[Host] Total Host:  wall {:?}, cpu {:?}", wall_elapsed, cpu_elapsed);
    if model_check {
        println!("[Host] Model checking finished after {} executions.", execution_count);
    }

    Ok(())
}
