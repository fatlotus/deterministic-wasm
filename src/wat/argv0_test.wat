(module
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $args_sizes_get (param i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "args_get" (func $args_get (param i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))
  (memory (export "memory") 1)

  (data (i32.const 0) "Success: argv[0] is \"/main.wasm\"\n") ;; Success message
  (data (i32.const 100) "/main.wasm\00") ;; Expected argv[0] content

  (func $main (export "_start")
    (local $argc i32)
    (local $argv_buf_size i32)
    (local $argv_ptr i32)
    (local $argv_buf_ptr i32)
    (local $first_arg_ptr i32)
    (local $expected_ptr i32)
    (local $len i32)

    ;; 1. Get args sizes
    (call $args_sizes_get (i32.const 1024) (i32.const 1028))
    drop

    ;; 2. Get args
    (local.set $argv_ptr (i32.const 2048))
    (local.set $argv_buf_ptr (i32.const 4096))
    (call $args_get (local.get $argv_ptr) (local.get $argv_buf_ptr))
    drop

    ;; 3. Check argv[0]
    ;; argv_ptr points to an array of pointers. The first one is argv[0].
    (local.set $first_arg_ptr (i32.load (local.get $argv_ptr)))
    
    ;; Compare content at $first_arg_ptr with "/main.wasm"
    (local.set $expected_ptr (i32.const 100))
    (local.set $len (i32.const 11)) ;; Length of "/main.wasm" + null terminator

    (block $fail
        (loop $compare
            (if (i32.eqz (local.get $len))
                (then
                   ;; Success! Print message.
                   (i32.store (i32.const 1032) (i32.const 0)) ;; iov_base
                   (i32.store (i32.const 1036) (i32.const 33)) ;; iov_len
                   (call $fd_write (i32.const 1) (i32.const 1032) (i32.const 1) (i32.const 1040))
                   drop
                   return
                )
            )
            
            (if (i32.ne (i32.load8_u (local.get $first_arg_ptr)) (i32.load8_u (local.get $expected_ptr)))
                (then
                    (br $fail)
                )
            )
            
            (local.set $first_arg_ptr (i32.add (local.get $first_arg_ptr) (i32.const 1)))
            (local.set $expected_ptr (i32.add (local.get $expected_ptr) (i32.const 1)))
            (local.set $len (i32.sub (local.get $len) (i32.const 1)))
            (br $compare)
        )
    )
    
    ;; Fail (unreachable in this simple test, or could print error)
    unreachable
  )
)
