(module
  (import "wasi_snapshot_preview1" "proc_exit" (func $proc_exit (param i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))
  (memory 1)
  (export "memory" (memory 0))

  (data (i32.const 0) "This should be printed\n")
  (data (i32.const 100) "This should NOT be printed\n")

  (func $main (export "_start")
    (local $iovs i32)
    (local $nwritten i32)

    ;; 1. Print first message
    (i32.store (i32.const 200) (i32.const 0))    ;; iov_base
    (i32.store (i32.const 204) (i32.const 23))   ;; iov_len
    (call $fd_write
      (i32.const 1) ;; stdout
      (i32.const 200) ;; iovs
      (i32.const 1) ;; iovs_len
      (i32.const 208) ;; nwritten_ptr
    )
    drop

    ;; 2. Call proc_exit
    (call $proc_exit (i32.const 0))

    ;; 3. Try to print second message (should NOT happen)
    (i32.store (i32.const 200) (i32.const 100))  ;; iov_base
    (i32.store (i32.const 204) (i32.const 27))   ;; iov_len
    (call $fd_write
      (i32.const 1) ;; stdout
      (i32.const 200) ;; iovs
      (i32.const 1) ;; iovs_len
      (i32.const 208) ;; nwritten_ptr
    )
    drop
  )
)
