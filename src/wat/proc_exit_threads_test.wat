(module
  (import "wasi_snapshot_preview1" "proc_exit" (func $proc_exit (param i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "sched_yield" (func $sched_yield (result i32)))
  (import "wasi" "thread-spawn" (func $thread_spawn (param i32) (result i32)))
  (memory 1 1 shared)
  (export "memory" (memory 0))

  (data (i32.const 0) "Main thread started\n")
  (data (i32.const 100) "Thread 1 started\n")
  (data (i32.const 200) "Thread 1 loop...\n")
  (data (i32.const 300) "Main thread calling proc_exit\n")
  (data (i32.const 400) "Thread 1 should NOT print this after proc_exit\n")

  ;; Thread 1 entry point
  (func $thread1 (export "wasi_thread_start") (param $id i32) (param $info i32)
    (local $i i32)
    ;; Print "Thread 1 started"
    (i32.store (i32.const 500) (i32.const 100))
    (i32.store (i32.const 504) (i32.const 17))
    (call $fd_write (i32.const 1) (i32.const 500) (i32.const 1) (i32.const 508))
    drop

    (local.set $i (i32.const 0))
    (loop $loop
      ;; Print "Thread 1 loop..."
      (i32.store (i32.const 500) (i32.const 200))
      (i32.store (i32.const 504) (i32.const 17))
      (call $fd_write (i32.const 1) (i32.const 500) (i32.const 1) (i32.const 508))
      drop

      (call $sched_yield)
      drop

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.lt_s (local.get $i) (i32.const 10)))
    )

    ;; This should NOT be printed if proc_exit is called while in the loop
    (i32.store (i32.const 500) (i32.const 400))
    (i32.store (i32.const 504) (i32.const 46))
    (call $fd_write (i32.const 1) (i32.const 500) (i32.const 1) (i32.const 508))
    drop
  )

  (func $main (export "_start")
    ;; Print "Main thread started"
    (i32.store (i32.const 600) (i32.const 0))
    (i32.store (i32.const 604) (i32.const 20))
    (call $fd_write (i32.const 1) (i32.const 600) (i32.const 1) (i32.const 608))
    drop

    ;; Spawn thread 1
    (call $thread_spawn (i32.const 0))
    drop

    ;; Yield a few times to let thread 1 run
    (call $sched_yield) drop
    (call $sched_yield) drop

    ;; Print "Main thread calling proc_exit"
    (i32.store (i32.const 600) (i32.const 300))
    (i32.store (i32.const 604) (i32.const 30))
    (call $fd_write (i32.const 1) (i32.const 600) (i32.const 1) (i32.const 608))
    drop

    ;; Call proc_exit
    (call $proc_exit (i32.const 0))
  )
)
