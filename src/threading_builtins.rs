use crate::scheduler::{DeterministicThread, call_scheduler};
use crate::memory::read_mem;
use wasmtime::Linker;
use tokio::sync::oneshot;
use anyhow::Result;

pub fn register_threading_builtins(linker: &mut Linker<DeterministicThread>) -> Result<()> {
    linker.func_wrap_async("model-checker", "futex_wait", |mut caller: wasmtime::Caller<'_, DeterministicThread>, (ptr, expr, _timeout_ns): (i32, i32, i64)| {
        {
            eprintln!("[Host] futex wait called");
        }
        Box::new(async move {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            let mut val_buffer = [0u8; 4];
            read_mem(&caller, &export, ptr as usize, &mut val_buffer)?;
            let val = i32::from_le_bytes(val_buffer);

            if val != expr {
                return Ok(1);
            }

            let (tx, rx) = oneshot::channel();
            {
                let mut sched = caller.data_mut().scheduler.lock().unwrap();
                let threads = sched.futex_blocked_threads.entry(ptr).or_insert(Vec::new());
                threads.push(tx);
            }
            call_scheduler(caller.data_mut()).await;
            rx.await.map_err(|e| anyhow::anyhow!("oneshot receive failed: {}", e))?;

            Ok(0) // SUCCESS
        })
    })?;

    linker.func_wrap_async("model-checker", "futex_wait64", |mut caller: wasmtime::Caller<'_, DeterministicThread>, (ptr, expr, _timeout_ns): (i32, i64, i64)| {
        {
            eprintln!("[Host] futex wait64 called");
        }
        Box::new(async move {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            let mut val_buffer = [0u8; 8];
            read_mem(&caller, &export, ptr as usize, &mut val_buffer)?;
            let val = i64::from_le_bytes(val_buffer);

            if val != expr {
                return Ok(1);
            }

            let (tx, rx) = oneshot::channel();
            {
                let mut sched = caller.data_mut().scheduler.lock().unwrap();
                let threads = sched.futex_blocked_threads.entry(ptr).or_insert(Vec::new());
                threads.push(tx);
            }
            call_scheduler(caller.data_mut()).await;
            rx.await.map_err(|e| anyhow::anyhow!("oneshot receive failed: {}", e))?;

            Ok(0) // SUCCESS
        })
    })?;

    linker.func_wrap_async("model-checker", "futex_notify", |mut caller: wasmtime::Caller<'_, DeterministicThread>, (ptr, waiters): (i32, i32)| {
        {
            eprintln!("[Host] futex notify called");
        }
        Box::new(async move {
            let mut woken_up = 0;
            {
                let mut sched = caller.data_mut().scheduler.lock().unwrap();
                while woken_up < waiters {
                    let to_wake_up = {
                        if let Some(threads) = sched.futex_blocked_threads.get_mut(&ptr) {
                            threads.pop()
                        } else {
                            None
                        }
                    };
                    if let Some(to_wake_up) = to_wake_up {
                        sched.paused_threads.push_back(to_wake_up);
                        woken_up += 1
                    } else {
                        break
                    }
                }
            }

            Ok(woken_up)
        })
    })?;

    Ok(())
}
