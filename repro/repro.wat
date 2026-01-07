(module
  (import "spectest" "print" (func $print (param i32)))
  (import "wasi" "spawn-thread" (func $spawn_thread (param i32)))
  (start $main)
  (func $main
    (call $print (i32.const 1))
  )
  (memory 1 1)
)
