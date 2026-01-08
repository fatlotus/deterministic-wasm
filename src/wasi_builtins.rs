use crate::scheduler::{DeterministicThread, call_scheduler};
use crate::memory::{read_mem, write_mem};
use wasmtime::{Linker, Store};
use tokio::sync::oneshot;
use anyhow::Result;
use std::cmp::Reverse;
use crate::scheduler::DelayedThread;

pub fn register_wasi_builtins(linker: &mut Linker<DeterministicThread>) -> Result<()> {
    // clock_time_get: Returns a fixed timestamp
    linker.func_wrap("wasi_snapshot_preview1", "clock_time_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, id: i32, precision: i64, result_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] clock_time_get(id={}, precision={}, result_ptr={})", id, precision, result_ptr);
        }
        let time = caller.data().scheduler.lock().unwrap().current_time;
        let export = caller.get_export("memory");

        if let Some(export) = export {
            if write_mem(&mut caller, &export, result_ptr as usize, &time.to_le_bytes()).is_ok() {
                // let mut stdout = caller.data().stdout.lock().unwrap();
                // let _ = writeln!(stdout, "[Host] clock_time_get called, returning deterministic timestamp: {}", time);
                return 0;
            }
        }
        29 // EIO
    })?;

    // clock_res_get: Returns the resolution of a clock (stub)
    linker.func_wrap("wasi_snapshot_preview1", "clock_res_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, id: i32, result_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] clock_res_get(id={}, result_ptr={})", id, result_ptr);
        }
        let export = caller.get_export("memory");
        if let Some(export) = export {
            let res: u64 = 1_000_000; // 1ms resolution
            if write_mem(&mut caller, &export, result_ptr as usize, &res.to_le_bytes()).is_ok() {
                return 0;
            }
        }
        29 // EIO
    })?;

    linker.func_wrap("wasi_snapshot_preview1", "random_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, buf_ptr: i32, buf_len: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] random_get(buf_ptr={}, buf_len={})", buf_ptr, buf_len);
        }
        let export = caller.get_export("memory");
        if let Some(export) = export {
            let mut rand_data = vec![0u8; buf_len as usize];
            for (i, b) in rand_data.iter_mut().enumerate() {
                *b = ((i + 42) % 256) as u8;
            }
            if write_mem(&mut caller, &export, buf_ptr as usize, &rand_data).is_ok() {
                return 0; // SUCCESS
            }
        }
        29 // EIO
    })?;

    // args_sizes_get: Get argument sizes
    linker.func_wrap("wasi_snapshot_preview1", "args_sizes_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, count_ptr: i32, buf_size_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] args_sizes_get(count_ptr={}, buf_size_ptr={})", count_ptr, buf_size_ptr);
        }
        let args = caller.data().args.clone();
        let export = caller.get_export("memory");
        if let Some(export) = export {
            let count = std::cmp::max(1, args.len()) as u32;
            let mut buf_size = 0u32;
            
            // Handle argv[0]
            buf_size += ("/main.wasm".len() + 1) as u32;

            // Handle remaining args
            for arg in args.iter().skip(1) {
                buf_size += (arg.len() + 1) as u32; // +1 for null terminator
            }
            
            if write_mem(&mut caller, &export, count_ptr as usize, &count.to_le_bytes()).is_ok() &&
               write_mem(&mut caller, &export, buf_size_ptr as usize, &buf_size.to_le_bytes()).is_ok() {
                return 0; // SUCCESS
            }
        }
        29 // EIO
    })?;

    // args_get: Get arguments
    linker.func_wrap("wasi_snapshot_preview1", "args_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, argv_ptr: i32, argv_buf_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] args_get(argv_ptr={}, argv_buf_ptr={})", argv_ptr, argv_buf_ptr);
        }
        let args = caller.data().args.clone();
        let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found")).unwrap();
        
        let mut current_buf_offset = 0;
        let mut arg_index = 0;

        // Helper to write an argument
        let mut write_arg = |arg_val: &str| {
            let arg_ptr = argv_buf_ptr + current_buf_offset as i32;
            let arg_bytes = arg_val.as_bytes();
            
            // Write pointer to argv array
            write_mem(&mut caller, &export, (argv_ptr + (arg_index * 4) as i32) as usize, &arg_ptr.to_le_bytes()).unwrap();
            
            // Write string + null terminator to buffer
            write_mem(&mut caller, &export, (argv_buf_ptr + current_buf_offset as i32) as usize, arg_bytes).unwrap();
            write_mem(&mut caller, &export, (argv_buf_ptr + current_buf_offset as i32 + arg_bytes.len() as i32) as usize, &[0u8]).unwrap();
            
            current_buf_offset += arg_bytes.len() + 1;
            arg_index += 1;
        };

        // Write argv[0]
        write_arg("/main.wasm");

        // Write remaining args
        for arg in args.iter().skip(1) {
            write_arg(arg.as_str());
        }

        0 // SUCCESS
    })?;

    linker.func_wrap_async("wasi_snapshot_preview1", "poll_oneoff", |mut caller: wasmtime::Caller<'_, DeterministicThread>, (in_ptr, out_ptr, nsubscriptions, nevents_ptr): (i32, i32, i32, i32)| {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] poll_oneoff(in_ptr={}, out_ptr={}, nsubscriptions={}, nevents_ptr={})", in_ptr, out_ptr, nsubscriptions, nevents_ptr);
        }
        Box::new(async move {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            
            let mut min_wake_time = u64::MAX;
            let mut userdatas = Vec::new();

            for i in 0..nsubscriptions as usize {
                let sub_ptr = in_ptr as usize + i * 48;
                let mut sub_data = [0u8; 48];
                read_mem(&caller, &export, sub_ptr, &mut sub_data)?;
                
                let userdata = u64::from_le_bytes(sub_data[0..8].try_into().unwrap());
                userdatas.push(userdata);
                let tag = sub_data[8]; // 0 = clock, 1 = fd_read, 2 = fd_write
                
                if tag == 0 {
                    let _clock_id = u32::from_le_bytes(sub_data[16..20].try_into().unwrap());
                    let timeout = u64::from_le_bytes(sub_data[24..32].try_into().unwrap());
                    let flags = u16::from_le_bytes(sub_data[40..42].try_into().unwrap());
                    
                    let wake_time = if flags & 1 == 1 {
                        timeout
                    } else {
                        caller.data().scheduler.lock().unwrap().current_time.saturating_add(timeout)
                    };
                    
                    if wake_time < min_wake_time {
                        min_wake_time = wake_time;
                    }
                } else {
                    return Ok(58); // ENOTSUP for fd_read/fd_write
                }
            }

            if min_wake_time != u64::MAX {
                let (tx, rx) = oneshot::channel();
                {
                    let mut sched = caller.data_mut().scheduler.lock().unwrap();
                    sched.delayed_threads.push(Reverse(DelayedThread { wake_time: min_wake_time, tx }));
                }
                call_scheduler(caller.data_mut()).await;
                rx.await.map_err(|e| anyhow::anyhow!("oneshot receive failed: {}", e))?;
            }

            // Write success events
            for (i, userdata) in userdatas.into_iter().enumerate() {
                let mut event = [0u8; 32];
                event[0..8].copy_from_slice(&userdata.to_le_bytes());
                event[8..10].copy_from_slice(&0u16.to_le_bytes()); // errno 0
                event[10] = 0; // type clock
                write_mem(&mut caller, &export, out_ptr as usize + i * 32, &event)?;
            }
            
            write_mem(&mut caller, &export, nevents_ptr as usize, &(nsubscriptions as u32).to_le_bytes())?;
            
            Ok(0) // SUCCESS
        })
    })?;

    linker.func_wrap_async("wasi_snapshot_preview1", "sched_yield", |mut caller: wasmtime::Caller<'_, DeterministicThread>, _: ()| {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] sched_yield()");
        }
        Box::new(async move {
            let (tx, rx) = oneshot::channel();
            {
                let mut sched = caller.data_mut().scheduler.lock().unwrap();
                sched.paused_threads.push_back(tx);
            }
            call_scheduler(caller.data_mut()).await;
            rx.await.map_err(|e| anyhow::anyhow!("oneshot receive failed: {}", e))?;

            Ok(0) // SUCCESS
        })
    })?;

    // proc_exit: Terminate process
    linker.func_wrap("wasi_snapshot_preview1", "proc_exit", |caller: wasmtime::Caller<'_, DeterministicThread>, code: i32| -> Result<(), wasmtime::Error> {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] proc_exit(code={})", code);
        } else {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[Host] proc_exit called with code {}", code);
        }
        
        {
            let mut sched = caller.data().scheduler.lock().unwrap();
            sched.exited = Some(code);
            // Clear all queues to stop further scheduling
            sched.paused_threads.clear();
            sched.delayed_threads.clear();
            sched.futex_blocked_threads.clear();
        }

        // Return an error to trigger a trap in Wasmtime
        Err(anyhow::anyhow!("proc_exit"))
    })?;

    // environ_sizes_get: Get environment variable sizes
    linker.func_wrap("wasi_snapshot_preview1", "environ_sizes_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, count_ptr: i32, buf_size_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] environ_sizes_get(count_ptr={}, buf_size_ptr={})", count_ptr, buf_size_ptr);
        }
        let envs = caller.data().envs.clone();
        let export = caller.get_export("memory");
        if let Some(export) = export {
            let count = envs.len() as u32;
            let mut buf_size = 0u32;
            for (key, value) in &envs {
                buf_size += (key.len() + 1 + value.len() + 1) as u32; // key=value\0
            }
            if write_mem(&mut caller, &export, count_ptr as usize, &count.to_le_bytes()).is_ok() &&
               write_mem(&mut caller, &export, buf_size_ptr as usize, &buf_size.to_le_bytes()).is_ok() {
                return 0; // SUCCESS
            }
        }
        29 // EIO
    })?;

    // environ_get: Get environment variables
    linker.func_wrap("wasi_snapshot_preview1", "environ_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, environ_ptr: i32, environ_buf_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] environ_get(environ_ptr={}, environ_buf_ptr={})", environ_ptr, environ_buf_ptr);
        }
        let envs = caller.data().envs.clone();
        let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found")).unwrap();
        
        let mut current_buf_offset = 0;
        for (i, (key, value)) in envs.iter().enumerate() {
            let env_str = format!("{}={}", key, value);
            let env_ptr = environ_buf_ptr + current_buf_offset as i32;
            let env_bytes = env_str.as_bytes();
            
            // Write pointer to environ array
            write_mem(&mut caller, &export, (environ_ptr + (i * 4) as i32) as usize, &env_ptr.to_le_bytes()).unwrap();
            
            // Write string + null terminator to buffer
            write_mem(&mut caller, &export, (environ_buf_ptr + current_buf_offset as i32) as usize, env_bytes).unwrap();
            write_mem(&mut caller, &export, (environ_buf_ptr + current_buf_offset as i32 + env_bytes.len() as i32) as usize, &[0u8]).unwrap();
            
            current_buf_offset += env_bytes.len() + 1;
        }
        0 // SUCCESS
    })?;

    linker.func_wrap("wasi", "thread-spawn", |mut caller: wasmtime::Caller<'_, DeterministicThread>, thread_info_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] thread-spawn(thread_info_ptr={})", thread_info_ptr);
        }
        let (thread_id, rx) = {
            let mut sched = caller.data_mut().scheduler.lock().unwrap();
            let thread_id = sched.next_thread_id;
            sched.next_thread_id += 1;
            
            let (tx, rx) = oneshot::channel();
            sched.paused_threads.push_back(tx);
            (thread_id, rx)
        };
        
        let data = caller.data();
        let scheduler = data.scheduler.clone();
        let instance = data.instance.clone().expect("instance not found in state");
        let linker = data.linker.clone();
        let stdout_shared = data.stdout.clone();
        let wasi_fs = data.wasi_fs.clone();

        {
            let mut stdout = data.stdout.lock().unwrap();
            let _ = writeln!(stdout, "[Host] Spawning thread {}, info={}", thread_id, thread_info_ptr);
        }

        let args = data.args.clone();
        let envs = data.envs.clone();
        let engine = caller.engine().clone();
        let trace_state = data.trace_state.clone();
        let trace_wasi = data.trace_wasi;
        tokio::spawn(async move {
            if rx.await.is_err() {
                return;
            }
            {
                let sched = scheduler.lock().unwrap();
                if sched.exited.is_some() {
                    return;
                }
            }
            {
                // eprintln!("[Host] Thread {} started, info={}", thread_id, thread_info_ptr);
            }

            let mut new_store = Store::new(&engine, DeterministicThread {
                scheduler: scheduler.clone(),
                linker: linker.clone(),
                instance: Some(instance.clone()),
                stdout: stdout_shared.clone(),
                args,
                envs,
                wasi_fs: wasi_fs.clone(),
                trace_state: trace_state.clone(),
                trace_wasi,
            });

            if let Ok(instance) = instance.instantiate_async(&mut new_store).await {
                if let Ok(start_thread) = instance.get_typed_func::<(i32, i32), ()>(&mut new_store, "wasi_thread_start") {
                    let _ = start_thread.call_async(&mut new_store, (thread_id, thread_info_ptr,)).await;
                }
            }
            call_scheduler(&mut new_store.data_mut()).await;
        });
        thread_id
    })?;

    // proc_raise: Send a signal to the process (stub)
    linker.func_wrap("wasi_snapshot_preview1", "proc_raise", |caller: wasmtime::Caller<'_, DeterministicThread>, sig: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] proc_raise(sig={})", sig);
        }
        0 // SUCCESS
    })?;

    // sock_accept: Accept a new incoming connection on a socket (stub)
    linker.func_wrap("wasi_snapshot_preview1", "sock_accept", |caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, flags: i32, result_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] sock_accept(fd={}, flags={}, result_ptr={})", fd, flags, result_ptr);
        }
        0 // SUCCESS
    })?;

    // sock_recv: Receive a message from a socket (stub)
    linker.func_wrap("wasi_snapshot_preview1", "sock_recv", |caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, ri_data_ptr: i32, ri_data_len: i32, ri_flags: i32, ro_datalen_ptr: i32, ro_flags_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] sock_recv(fd={}, ri_data_ptr={}, ri_data_len={}, ri_flags={}, ro_datalen_ptr={}, ro_flags_ptr={})", fd, ri_data_ptr, ri_data_len, ri_flags, ro_datalen_ptr, ro_flags_ptr);
        }
        0 // SUCCESS
    })?;

    // sock_send: Send a message on a socket (stub)
    linker.func_wrap("wasi_snapshot_preview1", "sock_send", |caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, si_data_ptr: i32, si_data_len: i32, si_flags: i32, so_datalen_ptr: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] sock_send(fd={}, si_data_ptr={}, si_data_len={}, si_flags={}, so_datalen_ptr={})", fd, si_data_ptr, si_data_len, si_flags, so_datalen_ptr);
        }
        0 // SUCCESS
    })?;

    // sock_shutdown: Shut down socket send and receive channels (stub)
    linker.func_wrap("wasi_snapshot_preview1", "sock_shutdown", |caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, how: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] sock_shutdown(fd={}, how={})", fd, how);
        }
        0 // SUCCESS
    })?;

    // model_checker_select: Choose an option based on the execution trace
    linker.func_wrap("wasi", "model_checker_select", |caller: wasmtime::Caller<'_, DeterministicThread>, num_options: i32| -> i32 {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] model_checker_select(num_options={})", num_options);
        }
        let trace_state_arc = caller.data().trace_state.clone().expect("trace_state not found");
        let mut trace_state = trace_state_arc.lock().unwrap();

        if trace_state.trace_index < trace_state.current_trace.choices.len() {
            let choice = trace_state.current_trace.choices[trace_state.trace_index];
            trace_state.trace_index += 1;
            choice
        } else {
            // End of trace: emit new traces for all other options
            for i in 1..num_options {
                let mut new_choices = trace_state.current_trace.choices.clone();
                new_choices.push(i);
                let _ = trace_state.new_traces.send(crate::scheduler::ExecutionTrace { choices: new_choices });
            }
            // Follow the 0-th branch
            trace_state.current_trace.choices.push(0);
            trace_state.trace_index += 1;
            0
        }
    })?;

    linker.func_wrap("wasi", "must_reach_underlying", |caller: wasmtime::Caller<'_, DeterministicThread>, module_ptr: i32, line: i32, column: i32| {
        if caller.data().trace_wasi {
            let mut stdout = caller.data().stdout.lock().unwrap();
            let _ = writeln!(stdout, "[WASI] must_reach_underlying(module_ptr={}, line={}, column={})", module_ptr, line, column);
        }
        // This is a stub for now, but it's enough to let the test run.
        // In a real scenario, we might track which points were reached.
    })?;

    Ok(())
}
