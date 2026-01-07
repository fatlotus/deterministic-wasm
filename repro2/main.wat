(module $main.wasm
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i64 i32) (result i64)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i64 i32) (result i32)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (result i32)))
  (type (;10;) (func (param i32 i32 i32 i64) (result i32)))
  (type (;11;) (func (param i32 i32)))
  (type (;12;) (func (param f64 i32) (result f64)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i32 i32 i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i32 i32 i32)))
  (import "env" "memory" (memory (;0;) 2 65536 shared))
  (import "wasi_snapshot_preview1" "clock_time_get" (func $__imported_wasi_snapshot_preview1_clock_time_get (type 5)))
  (import "wasi_snapshot_preview1" "fd_close" (func $__imported_wasi_snapshot_preview1_fd_close (type 4)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $__imported_wasi_snapshot_preview1_fd_fdstat_get (type 6)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $__imported_wasi_snapshot_preview1_fd_seek (type 7)))
  (import "wasi_snapshot_preview1" "fd_write" (func $__imported_wasi_snapshot_preview1_fd_write (type 8)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__imported_wasi_snapshot_preview1_proc_exit (type 0)))
  (import "wasi_snapshot_preview1" "sched_yield" (func $__imported_wasi_snapshot_preview1_sched_yield (type 9)))
  (import "wasi" "thread-spawn" (func $__imported_wasi_thread_spawn (type 4)))
  (func $__wasm_call_ctors (type 1))
  (func $__wasm_init_tls (type 0) (param i32)
    local.get 0
    global.set $__tls_base
    local.get 0
    i32.const 0
    i32.const 112
    memory.init $.tdata)
  (func $undefined_weak:__wasilibc_futex_wait_maybe_busy (type 10) (param i32 i32 i32 i64) (result i32)
    unreachable)
  (func $__wasm_init_memory (type 1)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 7024
          i32.const 0
          i32.const 1
          i32.atomic.rmw.cmpxchg
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 1024
        i32.const 1024
        global.set $__tls_base
        i32.const 0
        i32.const 112
        memory.init $.tdata
        i32.const 1136
        i32.const 0
        i32.const 2816
        memory.init $.rodata
        i32.const 3952
        i32.const 0
        i32.const 284
        memory.init $.data
        i32.const 4240
        i32.const 0
        i32.const 2784
        memory.fill
        i32.const 7024
        i32.const 2
        i32.atomic.store
        i32.const 7024
        i32.const -1
        memory.atomic.notify
        drop
        br 1 (;@1;)
      end
      i32.const 7024
      i32.const 1
      i64.const -1
      memory.atomic.wait32
      drop
    end
    data.drop $.rodata
    data.drop $.data)
  (func $_start (type 1)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        global.get $GOT.data.internal.__memory_base
        i32.const 4240
        i32.add
        i32.const 0
        i32.const 1
        i32.atomic.rmw.cmpxchg
        br_if 0 (;@2;)
        call $__wasi_init_tp
        call $__wasm_call_ctors
        call $__original_main
        local.set 0
        call $__wasm_call_dtors
        local.get 0
        br_if 1 (;@1;)
        return
      end
      unreachable
    end
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $__original_main (type 9) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    local.get 0
    i32.const 0
    i32.store offset=28
    i32.const 1589
    i32.const 0
    call $printf
    drop
    local.get 0
    i32.const 24
    i32.add
    local.get 0
    i32.const 23
    i32.add
    call $std::__2::thread::thread_abi:ne210104_<main::$_0__0>_main::$_0&&_
    drop
    local.get 0
    i32.const 24
    i32.add
    call $std::__2::thread::join__
    i32.const 1599
    i32.const 0
    call $printf
    drop
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i32.const 24
    i32.add
    call $std::__2::thread::~thread__
    drop
    local.get 0
    i32.load offset=28
    local.set 1
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 1
    return)
  (func $std::__2::thread::thread_abi:ne210104_<main::$_0__0>_main::$_0&&_ (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    i32.load offset=28
    local.set 3
    i32.const 4
    call $operator_new_unsigned_long_
    local.set 4
    local.get 4
    call $std::__2::__thread_struct::__thread_struct__
    drop
    local.get 2
    i32.const 20
    i32.add
    local.get 4
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::unique_ptr_abi:ne210104_<true__void>_std::__2::__thread_struct*_
    drop
    i32.const 4
    call $operator_new_unsigned_long_
    local.set 5
    local.get 2
    i32.load offset=24
    local.set 6
    local.get 5
    local.get 2
    i32.const 20
    i32.add
    local.get 6
    call $std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::tuple_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0__0>_std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&__main::$_0&&_
    drop
    local.get 2
    i32.const 8
    i32.add
    local.get 5
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::unique_ptr_abi:ne210104_<true__void>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*_
    drop
    local.get 2
    i32.const 8
    i32.add
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::get_abi:ne210104____const
    local.set 7
    local.get 3
    i32.const 1
    local.get 7
    call $std::__2::__libcpp_thread_create_abi:ne210104__unsigned_long*__void*__*__void*___void*_
    local.set 8
    local.get 2
    local.get 8
    i32.store offset=4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=4
        br_if 0 (;@2;)
        local.get 2
        i32.const 8
        i32.add
        call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::release_abi:ne210104___
        drop
        br 1 (;@1;)
      end
      local.get 2
      i32.load offset=4
      i32.const 1375
      call $std::__2::__throw_system_error_int__char_const*_
      unreachable
    end
    local.get 2
    i32.const 8
    i32.add
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::~unique_ptr_abi:ne210104___
    drop
    local.get 2
    i32.const 20
    i32.add
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::~unique_ptr_abi:ne210104___
    drop
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 3
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::unique_ptr_abi:ne210104_<true__void>_std::__2::__thread_struct*_ (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 3
    local.get 2
    i32.load offset=8
    i32.store
    local.get 3
    return)
  (func $std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::tuple_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0__0>_std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&__main::$_0&&_ (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 2
    i32.store offset=4
    local.get 3
    i32.load offset=12
    local.set 4
    local.get 4
    local.get 3
    i32.load offset=8
    local.get 3
    i32.load offset=4
    call $std::__2::__tuple_impl<std::__2::__tuple_indices<0ul__1ul>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::__tuple_impl_abi:ne210104_<0ul__1ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::__tuple_indices<0ul__1ul>__std::__2::__tuple_types<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::__tuple_indices<...>__std::__2::__tuple_types<>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&__main::$_0&&_
    drop
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
    return)
  (func $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::unique_ptr_abi:ne210104_<true__void>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*_ (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 3
    local.get 2
    i32.load offset=8
    i32.store
    local.get 3
    return)
  (func $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::get_abi:ne210104____const (type 4) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    i32.load
    return)
  (func $void*_std::__2::__thread_proxy_abi:ne210104_<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>_void*_ (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=28
    local.get 1
    i32.load offset=28
    local.set 2
    local.get 1
    i32.const 24
    i32.add
    local.get 2
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::unique_ptr_abi:ne210104_<true__void>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*_
    drop
    call $std::__2::__thread_local_data__
    local.set 3
    local.get 3
    local.get 1
    i32.const 24
    i32.add
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::get_abi:ne210104____const
    call $std::__2::tuple_element<0ul__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::type&_std::__2::get_abi:ne210104_<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&_
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::release_abi:ne210104___
    call $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::set_pointer_std::__2::__thread_struct*_
    local.get 1
    i32.const 24
    i32.add
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::get_abi:ne210104____const
    call $void_std::__2::__thread_execute_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&__std::__2::__tuple_indices<...>_
    local.get 1
    i32.const 24
    i32.add
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::~unique_ptr_abi:ne210104___
    drop
    i32.const 0
    local.set 4
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4
    return)
  (func $std::__2::__libcpp_thread_create_abi:ne210104__unsigned_long*__void*__*__void*___void*_ (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 2
    i32.store offset=4
    local.get 3
    i32.load offset=12
    local.set 4
    local.get 3
    i32.load offset=8
    local.set 5
    local.get 3
    i32.load offset=4
    local.set 6
    local.get 4
    i32.const 0
    local.get 5
    local.get 6
    call $__pthread_create
    local.set 7
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 7
    return)
  (func $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::release_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 1
    local.get 2
    i32.load
    i32.store offset=8
    local.get 2
    i32.const 0
    i32.store
    local.get 1
    i32.load offset=8
    return)
  (func $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::~unique_ptr_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 2
    i32.const 0
    call $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::reset_abi:ne210104__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*_
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::~unique_ptr_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 2
    i32.const 0
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::reset_abi:ne210104__std::__2::__thread_struct*_
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::__tuple_impl<std::__2::__tuple_indices<0ul__1ul>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::__tuple_impl_abi:ne210104_<0ul__1ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::__tuple_indices<0ul__1ul>__std::__2::__tuple_types<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::__tuple_indices<...>__std::__2::__tuple_types<>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&__main::$_0&&_ (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 2
    i32.store
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    local.get 3
    i32.load offset=4
    call $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::__tuple_leaf_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__0>_std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&_
    drop
    local.get 4
    local.get 3
    i32.load
    call $std::__2::__tuple_leaf<1ul__main::$_0__true>::__tuple_leaf_abi:ne210104_<main::$_0__0>_main::$_0&&_
    drop
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
    return)
  (func $std::__2::tuple_element<0ul__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::type&_std::__2::get_abi:ne210104_<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&_ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    call $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::get_abi:ne210104___
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::release_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 1
    local.get 2
    i32.load
    i32.store offset=8
    local.get 2
    i32.const 0
    i32.store
    local.get 1
    i32.load offset=8
    return)
  (func $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::set_pointer_std::__2::__thread_struct*_ (type 11) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    i32.load
    local.get 2
    i32.load offset=8
    call $std::__2::__libcpp_tls_set_abi:ne210104__unsigned_int__void*_
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $void_std::__2::__thread_execute_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&__std::__2::__tuple_indices<...>_ (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    i32.load offset=8
    call $std::__2::tuple_element<1ul__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::type&_std::__2::get_abi:ne210104_<1ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&_
    call $std::__2::__invoke_result_impl<void__main::$_0>::type_std::__2::__invoke_abi:ne210104_<main::$_0>_main::$_0&&_
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::unique_ptr<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>__std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>>::reset_abi:ne210104__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*_ (type 11) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 2
    local.get 3
    i32.load
    i32.store offset=4
    local.get 3
    local.get 2
    i32.load offset=8
    i32.store
    block  ;; label = @1
      local.get 2
      i32.load offset=4
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.load offset=4
      call $std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::operator___abi:ne210104__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*__const
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::reset_abi:ne210104__std::__2::__thread_struct*_ (type 11) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 2
    local.get 3
    i32.load
    i32.store offset=4
    local.get 3
    local.get 2
    i32.load offset=8
    i32.store
    block  ;; label = @1
      local.get 2
      i32.load offset=4
      i32.const 0
      i32.ne
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.load offset=4
      call $std::__2::default_delete<std::__2::__thread_struct>::operator___abi:ne210104__std::__2::__thread_struct*__const
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::__tuple_leaf_abi:ne210104_<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__0>_std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&_ (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 3
    local.get 2
    i32.load offset=8
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::unique_ptr_abi:ne210104__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&_
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
    return)
  (func $std::__2::__tuple_leaf<1ul__main::$_0__true>::__tuple_leaf_abi:ne210104_<main::$_0__0>_main::$_0&&_ (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::unique_ptr_abi:ne210104__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>&&_ (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.set 3
    local.get 3
    local.get 2
    i32.load offset=8
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::release_abi:ne210104___
    i32.store
    local.get 2
    i32.load offset=8
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::get_deleter_abi:ne210104___
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
    return)
  (func $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::get_deleter_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    return)
  (func $std::__2::__libcpp_tls_set_abi:ne210104__unsigned_int__void*_ (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=12
    local.get 2
    i32.load offset=8
    call $pthread_setspecific
    local.set 3
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3
    return)
  (func $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::get_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    return)
  (func $std::__2::tuple_element<1ul__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::type&_std::__2::get_abi:ne210104_<1ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>_std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>&_ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    call $std::__2::__tuple_leaf<1ul__main::$_0__true>::get_abi:ne210104___
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::__invoke_result_impl<void__main::$_0>::type_std::__2::__invoke_abi:ne210104_<main::$_0>_main::$_0&&_ (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    call $main::$_0::operator_____const
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $main::$_0::operator_____const (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    i32.const 1605
    i32.const 0
    call $printf
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::__tuple_leaf<1ul__main::$_0__true>::get_abi:ne210104___ (type 4) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    return)
  (func $std::__2::default_delete<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>::operator___abi:ne210104__std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>*__const (type 11) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=8
    local.set 3
    block  ;; label = @1
      local.get 3
      i32.const 0
      i32.eq
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::~tuple__
      drop
      local.get 3
      i32.const 4
      call $operator_delete_void*__unsigned_long_
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::~tuple__ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 2
    call $std::__2::__tuple_impl<std::__2::__tuple_indices<0ul__1ul>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::~__tuple_impl__
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::__tuple_impl<std::__2::__tuple_indices<0ul__1ul>__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>::~__tuple_impl__ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 2
    call $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::~__tuple_leaf__
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::__tuple_leaf<0ul__std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__false>::~__tuple_leaf__ (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    global.set $__stack_pointer
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 2
    call $std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>::~unique_ptr_abi:ne210104___
    drop
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    return)
  (func $std::__2::default_delete<std::__2::__thread_struct>::operator___abi:ne210104__std::__2::__thread_struct*__const (type 11) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.load offset=8
    local.set 3
    block  ;; label = @1
      local.get 3
      i32.const 0
      i32.eq
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 3
      call $std::__2::__thread_struct::~__thread_struct__
      drop
      local.get 3
      i32.const 4
      call $operator_delete_void*__unsigned_long_
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    return)
  (func $std::__2::__throw_system_error_int__char_const*_ (type 11) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    i32.const 1498
    local.get 2
    call $std::__2::__libcpp_verbose_abort_char_const*__..._
    unreachable)
  (func $std::__2::__libcpp_verbose_abort_char_const*__..._ (type 11) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 0
    i32.load offset=1756
    local.get 0
    local.get 1
    call $vfprintf
    drop
    call $abort
    unreachable)
  (func $std::__2::condition_variable::notify_all__ (type 0) (param i32)
    local.get 0
    call $pthread_cond_broadcast
    drop)
  (func $std::__2::mutex::lock__ (type 0) (param i32)
    block  ;; label = @1
      local.get 0
      call $__pthread_mutex_lock
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1463
      call $std::__2::__throw_system_error_int__char_const*_
      unreachable
    end)
  (func $std::__2::mutex::unlock__ (type 0) (param i32)
    local.get 0
    call $__pthread_mutex_unlock
    drop)
  (func $std::__2::__assoc_sub_state::__make_ready__ (type 0) (param i32)
    (local i32)
    local.get 0
    i32.const 12
    i32.add
    local.tee 1
    call $std::__2::mutex::lock__
    local.get 0
    local.get 0
    i32.load offset=84
    i32.const 4
    i32.or
    i32.store offset=84
    local.get 0
    i32.const 36
    i32.add
    call $std::__2::condition_variable::notify_all__
    local.get 1
    call $std::__2::mutex::unlock__)
  (func $std::__2::thread::~thread__ (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      call $std::terminate__
      unreachable
    end
    local.get 0)
  (func $std::__2::thread::join__ (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 1
          br_if 0 (;@3;)
          i32.const 28
          local.set 1
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        call $__pthread_join
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 1443
      call $std::__2::__throw_system_error_int__char_const*_
      unreachable
    end
    local.get 0
    i32.const 0
    i32.store)
  (func $std::__2::__thread_local_data__ (type 9) (result i32)
    block  ;; label = @1
      i32.const 0
      i32.atomic.load8_u offset=4252
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      i32.const 4252
      call $__cxa_guard_acquire
      i32.eqz
      br_if 0 (;@1;)
      i32.const 4244
      call $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::__thread_specific_ptr__
      drop
      i32.const 0
      i32.const 4244
      i32.store offset=4248
      i32.const 4252
      call $__cxa_guard_release
    end
    i32.const 0
    i32.load offset=4248)
  (func $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::__thread_specific_ptr__ (type 4) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      call $__pthread_key_create
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 1401
      call $std::__2::__throw_system_error_int__char_const*_
      unreachable
    end
    local.get 0)
  (func $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::__at_thread_exit_void*_ (type 0) (param i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      call $std::__2::__thread_struct::~__thread_struct__
      drop
      local.get 0
      i32.const 4
      call $operator_delete_void*__unsigned_long_
    end)
  (func $std::__2::__thread_struct_imp::~__thread_struct_imp__ (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=12
      local.tee 1
      local.get 0
      i32.load offset=16
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.load
        call $std::__2::condition_variable::notify_all__
        local.get 1
        i32.const 4
        i32.add
        i32.load
        call $std::__2::mutex::unlock__
        local.get 1
        i32.const 8
        i32.add
        local.tee 1
        local.get 2
        i32.ne
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.eq
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.load
        call $std::__2::__assoc_sub_state::__make_ready__
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 2
          i32.const -1
          i32.atomic.rmw.add offset=4
          br_if 0 (;@3;)
          local.get 2
          local.get 2
          i32.load
          i32.load offset=8
          call_indirect (type 0)
        end
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        local.get 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=12
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store offset=16
      local.get 1
      call $operator_delete_void*_
    end
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 1
      call $operator_delete_void*_
    end
    local.get 0)
  (func $std::__2::__thread_struct::__thread_struct__ (type 4) (param i32) (result i32)
    (local i32)
    i32.const 24
    call $operator_new_unsigned_long_
    local.tee 1
    i64.const 0
    i64.store align=4
    local.get 0
    local.get 1
    i32.store
    local.get 1
    i32.const 16
    i32.add
    i64.const 0
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    i64.const 0
    i64.store align=4
    local.get 0)
  (func $std::__2::__thread_struct::~__thread_struct__ (type 4) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $std::__2::__thread_struct_imp::~__thread_struct_imp__
      i32.const 24
      call $operator_delete_void*__unsigned_long_
    end
    local.get 0)
  (func $__cxa_guard_acquire (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.atomic.load8_u
          br_if 0 (;@3;)
          i32.const 4256
          call $__pthread_mutex_lock
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=1
            local.tee 2
            i32.const 2
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 0
              local.get 2
              i32.const 4
              i32.or
              i32.store8 offset=1
              i32.const 4280
              i32.const 4256
              call $pthread_cond_wait
              drop
              local.get 0
              i32.load8_u offset=1
              local.tee 2
              i32.const 2
              i32.and
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            i32.const 2
            i32.store8 offset=1
          end
          i32.const 4256
          call $__pthread_mutex_unlock
          br_if 2 (;@1;)
          local.get 2
          i32.const 1
          i32.ne
          local.set 2
        end
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        local.get 2
        return
      end
      local.get 1
      i32.const 1270
      i32.store offset=16
      i32.const 1163
      local.get 1
      i32.const 16
      i32.add
      call $__abort_message
      unreachable
    end
    local.get 1
    i32.const 1270
    i32.store
    i32.const 1136
    local.get 1
    call $__abort_message
    unreachable)
  (func $__cxa_guard_release (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.atomic.store8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 4256
          call $__pthread_mutex_lock
          br_if 0 (;@3;)
          local.get 0
          i32.load8_u offset=1
          local.set 2
          local.get 0
          i32.const 1
          i32.store8 offset=1
          i32.const 4256
          call $__pthread_mutex_unlock
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            i32.const 4280
            call $pthread_cond_broadcast
            br_if 3 (;@1;)
          end
          local.get 1
          i32.const 48
          i32.add
          global.set $__stack_pointer
          return
        end
        local.get 1
        i32.const 1250
        i32.store offset=32
        i32.const 1163
        local.get 1
        i32.const 32
        i32.add
        call $__abort_message
        unreachable
      end
      local.get 1
      i32.const 1250
      i32.store offset=16
      i32.const 1136
      local.get 1
      i32.const 16
      i32.add
      call $__abort_message
      unreachable
    end
    local.get 1
    i32.const 1250
    i32.store
    i32.const 1219
    local.get 1
    call $__abort_message
    unreachable)
  (func $std::__terminate_void__*____ (type 0) (param i32)
    local.get 0
    call_indirect (type 1)
    i32.const 1335
    i32.const 0
    call $__abort_message
    unreachable)
  (func $std::terminate__ (type 1)
    i32.const 0
    i32.atomic.load offset=3952
    call $std::__terminate_void__*____
    unreachable)
  (func $std::get_new_handler__ (type 9) (result i32)
    i32.const 0
    i32.atomic.load offset=4328)
  (func $__abort_message (type 11) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1577
    i32.const 11
    i32.const 1
    i32.const 0
    i32.load offset=1756
    local.tee 3
    call $fwrite
    drop
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    local.get 1
    call $vfprintf
    drop
    i32.const 10
    local.get 3
    call $fputc
    drop
    call $abort
    unreachable)
  (func $operator_new_unsigned_long_ (type 4) (param i32) (result i32)
    (local i32)
    local.get 0
    i32.const 1
    local.get 0
    i32.const 1
    i32.gt_u
    select
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          call $malloc
          local.tee 0
          br_if 1 (;@2;)
          call $std::get_new_handler__
          local.tee 0
          i32.eqz
          br_if 2 (;@1;)
          local.get 0
          call_indirect (type 1)
          br 0 (;@3;)
        end
      end
      local.get 0
      return
    end
    i32.const 1290
    i32.const 0
    call $__abort_message
    unreachable)
  (func $operator_delete_void*_ (type 0) (param i32)
    local.get 0
    call $free)
  (func $operator_delete_void*__unsigned_long_ (type 11) (param i32 i32)
    local.get 0
    call $operator_delete_void*_)
  (func $malloc (type 4) (param i32) (result i32)
    local.get 0
    call $dlmalloc)
  (func $dlmalloc (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load offset=4332
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.const 1
        i32.atomic.rmw.xchg offset=4832
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4832
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.atomic.rmw.xchg offset=4832
            i32.eqz
            br_if 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            i32.const 63
            i32.and
            br_if 0 (;@4;)
            call $sched_yield
            drop
          end
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          br 0 (;@3;)
        end
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=4332
        br_if 0 (;@2;)
        i32.const 0
        i32.const 2
        i32.store offset=4352
        i32.const 0
        i64.const -1
        i64.store offset=4344 align=4
        i32.const 0
        i64.const 281474976776192
        i64.store offset=4336 align=4
        i32.const 0
        i64.const 2
        i64.store offset=4800 align=4
        i32.const 0
        local.get 1
        i32.const 4
        i32.add
        i32.const -16
        i32.and
        i32.const 1431655768
        i32.xor
        i32.store offset=4332
      end
      i32.const 0
      i32.const 0
      i32.atomic.store offset=4832
    end
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=4800
      i32.const 2
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=4804
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=4804
          br_if 0 (;@3;)
          i32.const 0
          i32.const 1
          i32.atomic.rmw.xchg offset=4804
          i32.eqz
          br_if 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          i32.const 63
          i32.and
          br_if 0 (;@3;)
          call $sched_yield
          drop
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4380
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=4332
                            local.tee 3
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.const 1
                              i32.atomic.rmw.xchg offset=4832
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 1
                              local.set 2
                              loop  ;; label = @14
                                block  ;; label = @15
                                  i32.const 0
                                  i32.load offset=4832
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  i32.const 1
                                  i32.atomic.rmw.xchg offset=4832
                                  i32.eqz
                                  br_if 2 (;@13;)
                                end
                                block  ;; label = @15
                                  local.get 2
                                  i32.const 63
                                  i32.and
                                  br_if 0 (;@15;)
                                  call $sched_yield
                                  drop
                                end
                                local.get 2
                                i32.const 1
                                i32.add
                                local.set 2
                                br 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4332
                              local.tee 3
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 2
                              i32.store offset=4352
                              i32.const 0
                              i64.const -1
                              i64.store offset=4344 align=4
                              i32.const 0
                              i64.const 281474976776192
                              i64.store offset=4336 align=4
                              i32.const 0
                              i64.const 2
                              i64.store offset=4800 align=4
                              i32.const 0
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const -16
                              i32.and
                              i32.const 1431655768
                              i32.xor
                              local.tee 3
                              i32.store offset=4332
                            end
                            i32.const 0
                            i32.const 0
                            i32.atomic.store offset=4832
                          end
                          i32.const 131072
                          i32.const 72576
                          i32.lt_u
                          br_if 1 (;@10;)
                          i32.const 131072
                          i32.const 72576
                          i32.sub
                          i32.const 89
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 2
                          i32.const 0
                          i32.const 72576
                          i32.store offset=4808
                          i32.const 0
                          i32.const 72576
                          i32.store offset=4372
                          i32.const 0
                          local.get 3
                          i32.store offset=4392
                          i32.const 0
                          i32.const -1
                          i32.store offset=4388
                          i32.const 0
                          i32.const 131072
                          i32.const 72576
                          i32.sub
                          local.tee 3
                          i32.store offset=4812
                          i32.const 0
                          local.get 3
                          i32.store offset=4792
                          i32.const 0
                          local.get 3
                          i32.store offset=4788
                          loop  ;; label = @12
                            local.get 2
                            i32.const 4416
                            i32.add
                            local.get 2
                            i32.const 4404
                            i32.add
                            local.tee 3
                            i32.store
                            local.get 3
                            local.get 2
                            i32.const 4396
                            i32.add
                            local.tee 4
                            i32.store
                            local.get 2
                            i32.const 4408
                            i32.add
                            local.get 4
                            i32.store
                            local.get 2
                            i32.const 4424
                            i32.add
                            local.get 2
                            i32.const 4412
                            i32.add
                            local.tee 4
                            i32.store
                            local.get 4
                            local.get 3
                            i32.store
                            local.get 2
                            i32.const 4432
                            i32.add
                            local.get 2
                            i32.const 4420
                            i32.add
                            local.tee 3
                            i32.store
                            local.get 3
                            local.get 4
                            i32.store
                            local.get 2
                            i32.const 4428
                            i32.add
                            local.get 3
                            i32.store
                            local.get 2
                            i32.const 32
                            i32.add
                            local.tee 2
                            i32.const 256
                            i32.ne
                            br_if 0 (;@12;)
                          end
                          i32.const 131072
                          i32.const -52
                          i32.add
                          i32.const 56
                          i32.store
                          i32.const 0
                          i32.const 0
                          i32.load offset=4348
                          i32.store offset=4384
                          i32.const 0
                          i32.const 72576
                          i32.const -8
                          i32.const 72576
                          i32.sub
                          i32.const 15
                          i32.and
                          local.tee 2
                          i32.add
                          local.tee 3
                          i32.store offset=4380
                          i32.const 0
                          i32.const 131072
                          i32.const 72576
                          i32.sub
                          local.get 2
                          i32.sub
                          i32.const -56
                          i32.add
                          local.tee 2
                          i32.store offset=4368
                          local.get 3
                          local.get 2
                          i32.const 1
                          i32.or
                          i32.store offset=4
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 236
                            i32.gt_u
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4356
                              local.tee 5
                              i32.const 16
                              local.get 0
                              i32.const 19
                              i32.add
                              i32.const 496
                              i32.and
                              local.get 0
                              i32.const 11
                              i32.lt_u
                              select
                              local.tee 4
                              i32.const 3
                              i32.shr_u
                              local.tee 3
                              i32.shr_u
                              local.tee 2
                              i32.const 3
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  i32.const 1
                                  i32.and
                                  local.get 3
                                  i32.or
                                  i32.const 1
                                  i32.xor
                                  local.tee 4
                                  i32.const 3
                                  i32.shl
                                  local.tee 3
                                  i32.const 4396
                                  i32.add
                                  local.tee 2
                                  local.get 3
                                  i32.load offset=4404
                                  local.tee 3
                                  i32.load offset=8
                                  local.tee 0
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 5
                                  i32.const -2
                                  local.get 4
                                  i32.rotl
                                  i32.and
                                  i32.store offset=4356
                                  br 1 (;@14;)
                                end
                                local.get 2
                                local.get 0
                                i32.store offset=8
                                local.get 0
                                local.get 2
                                i32.store offset=12
                              end
                              local.get 3
                              i32.const 8
                              i32.add
                              local.set 2
                              local.get 3
                              local.get 4
                              i32.const 3
                              i32.shl
                              local.tee 4
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 3
                              local.get 4
                              i32.add
                              local.tee 3
                              local.get 3
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              br 12 (;@1;)
                            end
                            local.get 4
                            i32.const 0
                            i32.load offset=4364
                            local.tee 6
                            i32.le_u
                            br_if 1 (;@11;)
                            block  ;; label = @13
                              local.get 2
                              i32.eqz
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  local.get 3
                                  i32.shl
                                  i32.const 2
                                  local.get 3
                                  i32.shl
                                  local.tee 2
                                  i32.const 0
                                  local.get 2
                                  i32.sub
                                  i32.or
                                  i32.and
                                  i32.ctz
                                  local.tee 3
                                  i32.const 3
                                  i32.shl
                                  local.tee 2
                                  i32.const 4396
                                  i32.add
                                  local.tee 0
                                  local.get 2
                                  i32.load offset=4404
                                  local.tee 2
                                  i32.load offset=8
                                  local.tee 7
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 5
                                  i32.const -2
                                  local.get 3
                                  i32.rotl
                                  i32.and
                                  local.tee 5
                                  i32.store offset=4356
                                  br 1 (;@14;)
                                end
                                local.get 0
                                local.get 7
                                i32.store offset=8
                                local.get 7
                                local.get 0
                                i32.store offset=12
                              end
                              local.get 2
                              local.get 4
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 2
                              local.get 3
                              i32.const 3
                              i32.shl
                              local.tee 3
                              i32.add
                              local.get 3
                              local.get 4
                              i32.sub
                              local.tee 0
                              i32.store
                              local.get 2
                              local.get 4
                              i32.add
                              local.tee 7
                              local.get 0
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              block  ;; label = @14
                                local.get 6
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 6
                                i32.const -8
                                i32.and
                                i32.const 4396
                                i32.add
                                local.set 4
                                i32.const 0
                                i32.load offset=4376
                                local.set 3
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 5
                                    i32.const 1
                                    local.get 6
                                    i32.const 3
                                    i32.shr_u
                                    i32.shl
                                    local.tee 8
                                    i32.and
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 5
                                    local.get 8
                                    i32.or
                                    i32.store offset=4356
                                    local.get 4
                                    local.set 8
                                    br 1 (;@15;)
                                  end
                                  local.get 4
                                  i32.load offset=8
                                  local.set 8
                                end
                                local.get 8
                                local.get 3
                                i32.store offset=12
                                local.get 4
                                local.get 3
                                i32.store offset=8
                                local.get 3
                                local.get 4
                                i32.store offset=12
                                local.get 3
                                local.get 8
                                i32.store offset=8
                              end
                              local.get 2
                              i32.const 8
                              i32.add
                              local.set 2
                              i32.const 0
                              local.get 7
                              i32.store offset=4376
                              i32.const 0
                              local.get 0
                              i32.store offset=4364
                              br 12 (;@1;)
                            end
                            i32.const 0
                            i32.load offset=4360
                            local.tee 9
                            i32.eqz
                            br_if 1 (;@11;)
                            local.get 9
                            i32.ctz
                            i32.const 2
                            i32.shl
                            i32.load offset=4660
                            local.tee 7
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 4
                            i32.sub
                            local.set 3
                            local.get 7
                            local.set 0
                            block  ;; label = @13
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  i32.load offset=16
                                  local.tee 2
                                  br_if 0 (;@15;)
                                  local.get 0
                                  i32.load offset=20
                                  local.tee 2
                                  i32.eqz
                                  br_if 2 (;@13;)
                                end
                                local.get 2
                                i32.load offset=4
                                i32.const -8
                                i32.and
                                local.get 4
                                i32.sub
                                local.tee 0
                                local.get 3
                                local.get 0
                                local.get 3
                                i32.lt_u
                                local.tee 0
                                select
                                local.set 3
                                local.get 2
                                local.get 7
                                local.get 0
                                select
                                local.set 7
                                local.get 2
                                local.set 0
                                br 0 (;@14;)
                              end
                            end
                            local.get 7
                            i32.load offset=24
                            local.set 10
                            block  ;; label = @13
                              local.get 7
                              i32.load offset=12
                              local.tee 2
                              local.get 7
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 7
                              i32.load offset=8
                              local.tee 0
                              local.get 2
                              i32.store offset=12
                              local.get 2
                              local.get 0
                              i32.store offset=8
                              br 11 (;@2;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 7
                                i32.load offset=20
                                local.tee 0
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 7
                                i32.const 20
                                i32.add
                                local.set 8
                                br 1 (;@13;)
                              end
                              local.get 7
                              i32.load offset=16
                              local.tee 0
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 7
                              i32.const 16
                              i32.add
                              local.set 8
                            end
                            loop  ;; label = @13
                              local.get 8
                              local.set 11
                              local.get 0
                              local.tee 2
                              i32.const 20
                              i32.add
                              local.set 8
                              local.get 2
                              i32.load offset=20
                              local.tee 0
                              br_if 0 (;@13;)
                              local.get 2
                              i32.const 16
                              i32.add
                              local.set 8
                              local.get 2
                              i32.load offset=16
                              local.tee 0
                              br_if 0 (;@13;)
                            end
                            local.get 11
                            i32.const 0
                            i32.store
                            br 10 (;@2;)
                          end
                          i32.const -1
                          local.set 4
                          local.get 0
                          i32.const -65
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 19
                          i32.add
                          local.tee 2
                          i32.const -16
                          i32.and
                          local.set 4
                          i32.const 0
                          i32.load offset=4360
                          local.tee 10
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 31
                          local.set 6
                          block  ;; label = @12
                            local.get 0
                            i32.const 16777196
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 4
                            i32.const 38
                            local.get 2
                            i32.const 8
                            i32.shr_u
                            i32.clz
                            local.tee 2
                            i32.sub
                            i32.shr_u
                            i32.const 1
                            i32.and
                            local.get 2
                            i32.const 1
                            i32.shl
                            i32.sub
                            i32.const 62
                            i32.add
                            local.set 6
                          end
                          i32.const 0
                          local.get 4
                          i32.sub
                          local.set 3
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.const 2
                                  i32.shl
                                  i32.load offset=4660
                                  local.tee 0
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 2
                                  i32.const 0
                                  local.set 8
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                local.set 2
                                local.get 4
                                i32.const 0
                                i32.const 25
                                local.get 6
                                i32.const 1
                                i32.shr_u
                                i32.sub
                                local.get 6
                                i32.const 31
                                i32.eq
                                select
                                i32.shl
                                local.set 7
                                i32.const 0
                                local.set 8
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load offset=4
                                    i32.const -8
                                    i32.and
                                    local.get 4
                                    i32.sub
                                    local.tee 5
                                    local.get 3
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                    local.get 5
                                    local.set 3
                                    local.get 0
                                    local.set 8
                                    local.get 5
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 3
                                    local.get 0
                                    local.set 8
                                    local.get 0
                                    local.set 2
                                    br 3 (;@13;)
                                  end
                                  local.get 2
                                  local.get 0
                                  i32.load offset=20
                                  local.tee 5
                                  local.get 5
                                  local.get 0
                                  local.get 7
                                  i32.const 29
                                  i32.shr_u
                                  i32.const 4
                                  i32.and
                                  i32.add
                                  i32.load offset=16
                                  local.tee 11
                                  i32.eq
                                  select
                                  local.get 2
                                  local.get 5
                                  select
                                  local.set 2
                                  local.get 7
                                  i32.const 1
                                  i32.shl
                                  local.set 7
                                  local.get 11
                                  local.set 0
                                  local.get 11
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 2
                                local.get 8
                                i32.or
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 8
                                i32.const 2
                                local.get 6
                                i32.shl
                                local.tee 2
                                i32.const 0
                                local.get 2
                                i32.sub
                                i32.or
                                local.get 10
                                i32.and
                                local.tee 2
                                i32.eqz
                                br_if 3 (;@11;)
                                local.get 2
                                i32.ctz
                                i32.const 2
                                i32.shl
                                i32.load offset=4660
                                local.set 2
                              end
                              local.get 2
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            loop  ;; label = @13
                              local.get 2
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 4
                              i32.sub
                              local.tee 5
                              local.get 3
                              i32.lt_u
                              local.set 7
                              block  ;; label = @14
                                local.get 2
                                i32.load offset=16
                                local.tee 0
                                br_if 0 (;@14;)
                                local.get 2
                                i32.load offset=20
                                local.set 0
                              end
                              local.get 5
                              local.get 3
                              local.get 7
                              select
                              local.set 3
                              local.get 2
                              local.get 8
                              local.get 7
                              select
                              local.set 8
                              local.get 0
                              local.set 2
                              local.get 0
                              br_if 0 (;@13;)
                            end
                          end
                          local.get 8
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const 0
                          i32.load offset=4364
                          local.get 4
                          i32.sub
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load offset=24
                          local.set 11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=12
                            local.tee 2
                            local.get 8
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 8
                            i32.load offset=8
                            local.tee 0
                            local.get 2
                            i32.store offset=12
                            local.get 2
                            local.get 0
                            i32.store offset=8
                            br 9 (;@3;)
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 8
                              i32.load offset=20
                              local.tee 0
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              i32.const 20
                              i32.add
                              local.set 7
                              br 1 (;@12;)
                            end
                            local.get 8
                            i32.load offset=16
                            local.tee 0
                            i32.eqz
                            br_if 4 (;@8;)
                            local.get 8
                            i32.const 16
                            i32.add
                            local.set 7
                          end
                          loop  ;; label = @12
                            local.get 7
                            local.set 5
                            local.get 0
                            local.tee 2
                            i32.const 20
                            i32.add
                            local.set 7
                            local.get 2
                            i32.load offset=20
                            local.tee 0
                            br_if 0 (;@12;)
                            local.get 2
                            i32.const 16
                            i32.add
                            local.set 7
                            local.get 2
                            i32.load offset=16
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                          local.get 5
                          i32.const 0
                          i32.store
                          br 8 (;@3;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4364
                          local.tee 2
                          local.get 4
                          i32.lt_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=4376
                          local.set 3
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 2
                              local.get 4
                              i32.sub
                              local.tee 0
                              i32.const 16
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 4
                              i32.add
                              local.tee 7
                              local.get 0
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              local.get 3
                              local.get 2
                              i32.add
                              local.get 0
                              i32.store
                              local.get 3
                              local.get 4
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              br 1 (;@12;)
                            end
                            local.get 3
                            local.get 2
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 3
                            local.get 2
                            i32.add
                            local.tee 2
                            local.get 2
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.set 7
                            i32.const 0
                            local.set 0
                          end
                          i32.const 0
                          local.get 0
                          i32.store offset=4364
                          i32.const 0
                          local.get 7
                          i32.store offset=4376
                          local.get 3
                          i32.const 8
                          i32.add
                          local.set 2
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4368
                          local.tee 2
                          local.get 4
                          i32.le_u
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=4380
                          local.tee 3
                          local.get 4
                          i32.add
                          local.tee 0
                          local.get 2
                          local.get 4
                          i32.sub
                          local.tee 2
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.get 2
                          i32.store offset=4368
                          i32.const 0
                          local.get 0
                          i32.store offset=4380
                          local.get 3
                          local.get 4
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 3
                          i32.const 8
                          i32.add
                          local.set 2
                          br 10 (;@1;)
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4332
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.const 1
                            i32.atomic.rmw.xchg offset=4832
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 1
                            local.set 2
                            loop  ;; label = @13
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=4832
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.const 1
                                i32.atomic.rmw.xchg offset=4832
                                i32.eqz
                                br_if 2 (;@12;)
                              end
                              block  ;; label = @14
                                local.get 2
                                i32.const 63
                                i32.and
                                br_if 0 (;@14;)
                                call $sched_yield
                                drop
                              end
                              local.get 2
                              i32.const 1
                              i32.add
                              local.set 2
                              br 0 (;@13;)
                            end
                          end
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=4332
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.const 2
                            i32.store offset=4352
                            i32.const 0
                            i64.const -1
                            i64.store offset=4344 align=4
                            i32.const 0
                            i64.const 281474976776192
                            i64.store offset=4336 align=4
                            i32.const 0
                            i64.const 2
                            i64.store offset=4800 align=4
                            i32.const 0
                            local.get 1
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store offset=4332
                          end
                          i32.const 0
                          i32.const 0
                          i32.atomic.store offset=4832
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4340
                          local.tee 2
                          local.get 4
                          i32.const 71
                          i32.add
                          local.tee 11
                          i32.add
                          i32.const 0
                          local.get 2
                          i32.sub
                          i32.and
                          local.tee 8
                          local.get 4
                          i32.gt_u
                          br_if 0 (;@11;)
                          global.get $__tls_base
                          i32.const 0
                          i32.add
                          i32.const 48
                          i32.store
                          i32.const 0
                          local.set 2
                          br 10 (;@1;)
                        end
                        i32.const 0
                        local.set 5
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4796
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=4788
                            local.tee 3
                            local.get 8
                            i32.add
                            local.tee 0
                            local.get 3
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 2
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          global.get $__tls_base
                          i32.const 0
                          i32.add
                          i32.const 48
                          i32.store
                          i32.const 0
                          local.set 2
                          br 10 (;@1;)
                        end
                        i32.const -1
                        local.set 7
                        i32.const 0
                        i32.load8_u offset=4800
                        i32.const 4
                        i32.and
                        br_if 6 (;@4;)
                        i32.const 0
                        local.set 3
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=4380
                          local.tee 2
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 4808
                          local.set 3
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 2
                              local.get 3
                              i32.load
                              local.tee 0
                              i32.lt_u
                              br_if 0 (;@13;)
                              local.get 2
                              local.get 0
                              local.get 3
                              i32.load offset=4
                              i32.add
                              i32.lt_u
                              br_if 2 (;@11;)
                            end
                            local.get 3
                            i32.load offset=8
                            local.tee 3
                            br_if 0 (;@12;)
                          end
                          i32.const 0
                          local.set 3
                        end
                        block  ;; label = @11
                          i32.const 0
                          i32.const 1
                          i32.atomic.rmw.xchg offset=4832
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1
                          local.set 2
                          loop  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4832
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 1
                              i32.atomic.rmw.xchg offset=4832
                              i32.eqz
                              br_if 2 (;@11;)
                            end
                            block  ;; label = @13
                              local.get 2
                              i32.const 63
                              i32.and
                              br_if 0 (;@13;)
                              call $sched_yield
                              drop
                            end
                            local.get 2
                            i32.const 1
                            i32.add
                            local.set 2
                            br 0 (;@12;)
                          end
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 2
                            i32.const 0
                            call $sbrk
                            local.tee 7
                            i32.const -1
                            i32.eq
                            br_if 6 (;@6;)
                            local.get 8
                            local.set 5
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4336
                              local.tee 2
                              i32.const -1
                              i32.add
                              local.tee 3
                              local.get 7
                              i32.and
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              local.get 7
                              i32.sub
                              local.get 3
                              local.get 7
                              i32.add
                              i32.const 0
                              local.get 2
                              i32.sub
                              i32.and
                              i32.add
                              local.set 5
                            end
                            block  ;; label = @13
                              local.get 5
                              local.get 4
                              i32.gt_u
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 2
                              br 7 (;@6;)
                            end
                            block  ;; label = @13
                              local.get 5
                              i32.const 2147483646
                              i32.le_u
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 2
                              br 7 (;@6;)
                            end
                            i32.const 0
                            local.set 2
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=4796
                              local.tee 3
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=4788
                              local.tee 0
                              local.get 5
                              i32.add
                              local.tee 6
                              local.get 0
                              i32.le_u
                              br_if 7 (;@6;)
                              local.get 6
                              local.get 3
                              i32.gt_u
                              br_if 7 (;@6;)
                            end
                            local.get 5
                            call $sbrk
                            local.tee 3
                            local.get 7
                            i32.ne
                            br_if 1 (;@11;)
                            br 7 (;@5;)
                          end
                          i32.const 0
                          local.set 2
                          local.get 11
                          i32.const 0
                          i32.load offset=4368
                          i32.sub
                          i32.const 0
                          i32.load offset=4340
                          local.tee 0
                          i32.add
                          i32.const 0
                          local.get 0
                          i32.sub
                          i32.and
                          local.tee 5
                          i32.const 2147483646
                          i32.gt_u
                          br_if 5 (;@6;)
                          local.get 5
                          call $sbrk
                          local.tee 7
                          local.get 3
                          i32.load
                          local.get 3
                          i32.load offset=4
                          i32.add
                          i32.eq
                          br_if 4 (;@7;)
                          local.get 7
                          local.set 3
                        end
                        i32.const 0
                        local.set 2
                        block  ;; label = @11
                          local.get 5
                          local.get 4
                          i32.const 72
                          i32.add
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const -1
                          i32.eq
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            local.get 11
                            local.get 5
                            i32.sub
                            i32.const 0
                            i32.load offset=4340
                            local.tee 2
                            i32.add
                            i32.const 0
                            local.get 2
                            i32.sub
                            i32.and
                            local.tee 2
                            i32.const 2147483646
                            i32.le_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.set 7
                            br 7 (;@5;)
                          end
                          block  ;; label = @12
                            local.get 2
                            call $sbrk
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 5
                            i32.add
                            local.set 5
                            local.get 3
                            local.set 7
                            br 7 (;@5;)
                          end
                          i32.const 0
                          local.get 5
                          i32.sub
                          call $sbrk
                          drop
                          i32.const 0
                          local.set 2
                          br 5 (;@6;)
                        end
                        local.get 3
                        local.set 7
                        local.get 3
                        i32.const -1
                        i32.ne
                        br_if 5 (;@5;)
                        br 4 (;@6;)
                      end
                      unreachable
                    end
                    i32.const 0
                    local.set 2
                    br 6 (;@2;)
                  end
                  i32.const 0
                  local.set 2
                  br 4 (;@3;)
                end
                local.get 5
                local.set 2
                local.get 7
                i32.const -1
                i32.ne
                br_if 1 (;@5;)
              end
              i32.const 0
              i32.const 0
              i32.load offset=4800
              i32.const 4
              i32.or
              i32.store offset=4800
              i32.const -1
              local.set 7
              local.get 2
              local.set 5
            end
            i32.const 0
            i32.const 0
            i32.atomic.store offset=4832
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.const 2147483646
                i32.gt_u
                br_if 0 (;@6;)
                local.get 7
                i32.const -1
                i32.ne
                br_if 0 (;@6;)
                block  ;; label = @7
                  i32.const 0
                  i32.const 1
                  i32.atomic.rmw.xchg offset=4832
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 2
                  loop  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=4832
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.const 1
                      i32.atomic.rmw.xchg offset=4832
                      i32.eqz
                      br_if 2 (;@7;)
                    end
                    block  ;; label = @9
                      local.get 2
                      i32.const 63
                      i32.and
                      br_if 0 (;@9;)
                      call $sched_yield
                      drop
                    end
                    local.get 2
                    i32.const 1
                    i32.add
                    local.set 2
                    br 0 (;@8;)
                  end
                end
                local.get 8
                call $sbrk
                local.set 7
                i32.const 0
                call $sbrk
                local.set 2
                i32.const 0
                i32.const 0
                i32.atomic.store offset=4832
                local.get 7
                i32.const -1
                i32.eq
                br_if 2 (;@4;)
                local.get 2
                i32.const -1
                i32.eq
                br_if 2 (;@4;)
                local.get 7
                local.get 2
                i32.ge_u
                br_if 2 (;@4;)
                local.get 2
                local.get 7
                i32.sub
                local.tee 5
                local.get 4
                i32.const 56
                i32.add
                i32.gt_u
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              local.get 7
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=4788
            local.get 5
            i32.add
            local.tee 2
            i32.store offset=4788
            block  ;; label = @5
              local.get 2
              i32.const 0
              i32.load offset=4792
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 2
              i32.store offset=4792
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=4380
                      local.tee 3
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 4808
                      local.set 2
                      loop  ;; label = @10
                        local.get 7
                        local.get 2
                        i32.load
                        local.tee 0
                        local.get 2
                        i32.load offset=4
                        local.tee 8
                        i32.add
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 2
                        i32.load offset=8
                        local.tee 2
                        br_if 0 (;@10;)
                        br 3 (;@7;)
                      end
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4372
                        local.tee 2
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 7
                        local.get 2
                        i32.ge_u
                        br_if 1 (;@9;)
                      end
                      i32.const 0
                      local.get 7
                      i32.store offset=4372
                    end
                    i32.const 0
                    local.set 2
                    i32.const 0
                    local.get 5
                    i32.store offset=4812
                    i32.const 0
                    local.get 7
                    i32.store offset=4808
                    i32.const 0
                    i32.const -1
                    i32.store offset=4388
                    i32.const 0
                    i32.const 0
                    i32.load offset=4332
                    i32.store offset=4392
                    i32.const 0
                    i32.const 0
                    i32.store offset=4820
                    loop  ;; label = @9
                      local.get 2
                      i32.const 4416
                      i32.add
                      local.get 2
                      i32.const 4404
                      i32.add
                      local.tee 3
                      i32.store
                      local.get 3
                      local.get 2
                      i32.const 4396
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 2
                      i32.const 4408
                      i32.add
                      local.get 0
                      i32.store
                      local.get 2
                      i32.const 4424
                      i32.add
                      local.get 2
                      i32.const 4412
                      i32.add
                      local.tee 0
                      i32.store
                      local.get 0
                      local.get 3
                      i32.store
                      local.get 2
                      i32.const 4432
                      i32.add
                      local.get 2
                      i32.const 4420
                      i32.add
                      local.tee 3
                      i32.store
                      local.get 3
                      local.get 0
                      i32.store
                      local.get 2
                      i32.const 4428
                      i32.add
                      local.get 3
                      i32.store
                      local.get 2
                      i32.const 32
                      i32.add
                      local.tee 2
                      i32.const 256
                      i32.ne
                      br_if 0 (;@9;)
                    end
                    local.get 7
                    i32.const -8
                    local.get 7
                    i32.sub
                    i32.const 15
                    i32.and
                    local.tee 2
                    i32.add
                    local.tee 3
                    local.get 5
                    i32.const -56
                    i32.add
                    local.tee 0
                    local.get 2
                    i32.sub
                    local.tee 2
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    i32.const 0
                    i32.const 0
                    i32.load offset=4348
                    i32.store offset=4384
                    i32.const 0
                    local.get 2
                    i32.store offset=4368
                    i32.const 0
                    local.get 3
                    i32.store offset=4380
                    local.get 7
                    local.get 0
                    i32.add
                    i32.const 56
                    i32.store offset=4
                    br 2 (;@6;)
                  end
                  local.get 3
                  local.get 7
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 0
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load offset=12
                  i32.const 8
                  i32.and
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const -8
                  local.get 3
                  i32.sub
                  i32.const 15
                  i32.and
                  local.tee 0
                  i32.add
                  local.tee 7
                  i32.const 0
                  i32.load offset=4368
                  local.get 5
                  i32.add
                  local.tee 11
                  local.get 0
                  i32.sub
                  local.tee 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 2
                  local.get 8
                  local.get 5
                  i32.add
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=4348
                  i32.store offset=4384
                  i32.const 0
                  local.get 0
                  i32.store offset=4368
                  i32.const 0
                  local.get 7
                  i32.store offset=4380
                  local.get 3
                  local.get 11
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 7
                  i32.const 0
                  i32.load offset=4372
                  i32.ge_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 7
                  i32.store offset=4372
                end
                local.get 7
                local.get 5
                i32.add
                local.set 0
                i32.const 4808
                local.set 2
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 2
                      i32.load
                      local.tee 8
                      local.get 0
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 2
                      i32.load offset=8
                      local.tee 2
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                  end
                  local.get 2
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 2 (;@5;)
                end
                i32.const 4808
                local.set 2
                block  ;; label = @7
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      local.get 2
                      i32.load
                      local.tee 0
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 3
                      local.get 0
                      local.get 2
                      i32.load offset=4
                      i32.add
                      local.tee 0
                      i32.lt_u
                      br_if 2 (;@7;)
                    end
                    local.get 2
                    i32.load offset=8
                    local.set 2
                    br 0 (;@8;)
                  end
                end
                local.get 7
                i32.const -8
                local.get 7
                i32.sub
                i32.const 15
                i32.and
                local.tee 2
                i32.add
                local.tee 11
                local.get 5
                i32.const -56
                i32.add
                local.tee 8
                local.get 2
                i32.sub
                local.tee 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 7
                local.get 8
                i32.add
                i32.const 56
                i32.store offset=4
                local.get 3
                local.get 0
                i32.const 55
                local.get 0
                i32.sub
                i32.const 15
                i32.and
                i32.add
                i32.const -63
                i32.add
                local.tee 8
                local.get 8
                local.get 3
                i32.const 16
                i32.add
                i32.lt_u
                select
                local.tee 8
                i32.const 35
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=4348
                i32.store offset=4384
                i32.const 0
                local.get 2
                i32.store offset=4368
                i32.const 0
                local.get 11
                i32.store offset=4380
                local.get 8
                i32.const 16
                i32.add
                i32.const 0
                i64.load offset=4816 align=4
                i64.store align=4
                local.get 8
                i32.const 0
                i64.load offset=4808 align=4
                i64.store offset=8 align=4
                i32.const 0
                local.get 8
                i32.const 8
                i32.add
                i32.store offset=4816
                i32.const 0
                local.get 5
                i32.store offset=4812
                i32.const 0
                local.get 7
                i32.store offset=4808
                i32.const 0
                i32.const 0
                i32.store offset=4820
                local.get 8
                i32.const 36
                i32.add
                local.set 2
                loop  ;; label = @7
                  local.get 2
                  i32.const 7
                  i32.store
                  local.get 2
                  i32.const 4
                  i32.add
                  local.tee 2
                  local.get 0
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 8
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 8
                local.get 8
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 8
                local.get 8
                local.get 3
                i32.sub
                local.tee 7
                i32.store
                local.get 3
                local.get 7
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 7
                    i32.const -8
                    i32.and
                    i32.const 4396
                    i32.add
                    local.set 2
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4356
                        local.tee 0
                        i32.const 1
                        local.get 7
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 7
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 0
                        local.get 7
                        i32.or
                        i32.store offset=4356
                        local.get 2
                        local.set 0
                        br 1 (;@9;)
                      end
                      local.get 2
                      i32.load offset=8
                      local.set 0
                    end
                    local.get 0
                    local.get 3
                    i32.store offset=12
                    local.get 2
                    local.get 3
                    i32.store offset=8
                    i32.const 12
                    local.set 7
                    i32.const 8
                    local.set 8
                    br 1 (;@7;)
                  end
                  i32.const 31
                  local.set 2
                  block  ;; label = @8
                    local.get 7
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 7
                    i32.const 38
                    local.get 7
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 2
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 2
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 2
                  end
                  local.get 3
                  local.get 2
                  i32.store offset=28
                  local.get 3
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 2
                  i32.const 2
                  i32.shl
                  i32.const 4660
                  i32.add
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=4360
                        local.tee 8
                        i32.const 1
                        local.get 2
                        i32.shl
                        local.tee 5
                        i32.and
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 3
                        i32.store
                        i32.const 0
                        local.get 8
                        local.get 5
                        i32.or
                        i32.store offset=4360
                        local.get 3
                        local.get 0
                        i32.store offset=24
                        br 1 (;@9;)
                      end
                      local.get 7
                      i32.const 0
                      i32.const 25
                      local.get 2
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 2
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 2
                      local.get 0
                      i32.load
                      local.set 8
                      loop  ;; label = @10
                        local.get 8
                        local.tee 0
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 7
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 2
                        i32.const 29
                        i32.shr_u
                        local.set 8
                        local.get 2
                        i32.const 1
                        i32.shl
                        local.set 2
                        local.get 0
                        local.get 8
                        i32.const 4
                        i32.and
                        i32.add
                        local.tee 5
                        i32.load offset=16
                        local.tee 8
                        br_if 0 (;@10;)
                      end
                      local.get 5
                      i32.const 16
                      i32.add
                      local.get 3
                      i32.store
                      local.get 3
                      local.get 0
                      i32.store offset=24
                    end
                    i32.const 8
                    local.set 7
                    i32.const 12
                    local.set 8
                    local.get 3
                    local.set 0
                    local.get 3
                    local.set 2
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.set 2
                  local.get 0
                  local.get 3
                  i32.store offset=8
                  local.get 2
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 2
                  i32.store offset=8
                  i32.const 0
                  local.set 2
                  i32.const 24
                  local.set 7
                  i32.const 12
                  local.set 8
                end
                local.get 3
                local.get 8
                i32.add
                local.get 0
                i32.store
                local.get 3
                local.get 7
                i32.add
                local.get 2
                i32.store
              end
              i32.const 0
              i32.load offset=4368
              local.tee 2
              local.get 4
              i32.le_u
              br_if 1 (;@4;)
              i32.const 0
              i32.load offset=4380
              local.tee 3
              local.get 4
              i32.add
              local.tee 0
              local.get 2
              local.get 4
              i32.sub
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              i32.const 0
              local.get 2
              i32.store offset=4368
              i32.const 0
              local.get 0
              i32.store offset=4380
              local.get 3
              local.get 4
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 3
              i32.const 8
              i32.add
              local.set 2
              br 4 (;@1;)
            end
            local.get 2
            local.get 7
            i32.store
            local.get 2
            local.get 2
            i32.load offset=4
            local.get 5
            i32.add
            i32.store offset=4
            local.get 7
            local.get 8
            local.get 4
            call $prepend_alloc
            local.set 2
            br 3 (;@1;)
          end
          global.get $__tls_base
          i32.const 0
          i32.add
          i32.const 48
          i32.store
          i32.const 0
          local.set 2
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 7
              i32.const 2
              i32.shl
              local.tee 0
              i32.load offset=4660
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              i32.const 4660
              i32.add
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=4360
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 11
                i32.load offset=16
                local.get 8
                i32.ne
                br_if 0 (;@6;)
                local.get 11
                local.get 2
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 11
              local.get 2
              i32.store offset=20
            end
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 11
          i32.store offset=24
          block  ;; label = @4
            local.get 8
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 2
            i32.store offset=24
          end
          local.get 8
          i32.load offset=20
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 0
          i32.store offset=20
          local.get 0
          local.get 2
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 3
            local.get 4
            i32.or
            local.tee 2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 2
            i32.add
            local.tee 2
            local.get 2
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 8
          local.get 4
          i32.add
          local.tee 7
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 8
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 4396
            i32.add
            local.set 2
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=4356
                local.tee 4
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 4
                local.get 3
                i32.or
                i32.store offset=4356
                local.get 2
                local.set 3
                br 1 (;@5;)
              end
              local.get 2
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 7
            i32.store offset=12
            local.get 2
            local.get 7
            i32.store offset=8
            local.get 7
            local.get 2
            i32.store offset=12
            local.get 7
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 2
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 2
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 2
          end
          local.get 7
          local.get 2
          i32.store offset=28
          local.get 7
          i64.const 0
          i64.store offset=16 align=4
          local.get 2
          i32.const 2
          i32.shl
          i32.const 4660
          i32.add
          local.set 4
          block  ;; label = @4
            local.get 10
            i32.const 1
            local.get 2
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            local.get 4
            local.get 7
            i32.store
            i32.const 0
            local.get 10
            local.get 0
            i32.or
            i32.store offset=4360
            local.get 7
            local.get 4
            i32.store offset=24
            local.get 7
            local.get 7
            i32.store offset=8
            local.get 7
            local.get 7
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 2
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 2
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 2
          local.get 4
          i32.load
          local.set 0
          block  ;; label = @4
            loop  ;; label = @5
              local.get 0
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 0
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 4
              local.get 0
              i32.const 4
              i32.and
              i32.add
              local.tee 5
              i32.load offset=16
              local.tee 0
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 16
            i32.add
            local.get 7
            i32.store
            local.get 7
            local.get 4
            i32.store offset=24
            local.get 7
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 7
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.tee 2
          local.get 7
          i32.store offset=12
          local.get 4
          local.get 7
          i32.store offset=8
          local.get 7
          i32.const 0
          i32.store offset=24
          local.get 7
          local.get 4
          i32.store offset=12
          local.get 7
          local.get 2
          i32.store offset=8
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            local.get 7
            i32.load offset=28
            local.tee 8
            i32.const 2
            i32.shl
            local.tee 0
            i32.load offset=4660
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 4660
            i32.add
            local.get 2
            i32.store
            local.get 2
            br_if 1 (;@3;)
            i32.const 0
            local.get 9
            i32.const -2
            local.get 8
            i32.rotl
            i32.and
            i32.store offset=4360
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 10
              i32.load offset=16
              local.get 7
              i32.ne
              br_if 0 (;@5;)
              local.get 10
              local.get 2
              i32.store offset=16
              br 1 (;@4;)
            end
            local.get 10
            local.get 2
            i32.store offset=20
          end
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 2
        local.get 10
        i32.store offset=24
        block  ;; label = @3
          local.get 7
          i32.load offset=16
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 0
          i32.store offset=16
          local.get 0
          local.get 2
          i32.store offset=24
        end
        local.get 7
        i32.load offset=20
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        i32.store offset=20
        local.get 0
        local.get 2
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 7
          local.get 3
          local.get 4
          i32.or
          local.tee 2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 2
          i32.add
          local.tee 2
          local.get 2
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 7
        local.get 4
        i32.add
        local.tee 0
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 7
        local.get 4
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 0
        local.get 3
        i32.add
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const -8
          i32.and
          i32.const 4396
          i32.add
          local.set 4
          i32.const 0
          i32.load offset=4376
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 6
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 8
              local.get 5
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 8
              local.get 5
              i32.or
              i32.store offset=4356
              local.get 4
              local.set 8
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=8
            local.set 8
          end
          local.get 8
          local.get 2
          i32.store offset=12
          local.get 4
          local.get 2
          i32.store offset=8
          local.get 2
          local.get 4
          i32.store offset=12
          local.get 2
          local.get 8
          i32.store offset=8
        end
        i32.const 0
        local.get 0
        i32.store offset=4376
        i32.const 0
        local.get 3
        i32.store offset=4364
      end
      local.get 7
      i32.const 8
      i32.add
      local.set 2
    end
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=4800
      i32.const 2
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.atomic.store offset=4804
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $prepend_alloc (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    local.get 0
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 3
    local.get 2
    i32.const 3
    i32.or
    i32.store offset=4
    local.get 1
    i32.const -8
    local.get 1
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 4
    local.get 3
    local.get 2
    i32.add
    local.tee 5
    i32.sub
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=4380
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=4380
        i32.const 0
        i32.const 0
        i32.load offset=4368
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=4368
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=4376
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=4376
        i32.const 0
        i32.const 0
        i32.load offset=4364
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=4364
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 2
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.load offset=4
        local.tee 1
        i32.const 3
        i32.and
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        local.set 6
        local.get 4
        i32.load offset=12
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.load offset=8
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=4356
              i32.const -2
              local.get 1
              i32.const 3
              i32.shr_u
              i32.rotl
              i32.and
              i32.store offset=4356
              br 2 (;@3;)
            end
            local.get 2
            local.get 7
            i32.store offset=8
            local.get 7
            local.get 2
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=24
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 20
                  i32.add
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                local.get 4
                i32.const 16
                i32.add
                local.set 7
              end
              loop  ;; label = @6
                local.get 7
                local.set 9
                local.get 1
                local.tee 2
                i32.const 20
                i32.add
                local.set 7
                local.get 2
                i32.load offset=20
                local.tee 1
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.set 7
                local.get 2
                i32.load offset=16
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 9
              i32.const 0
              i32.store
              br 1 (;@4;)
            end
            i32.const 0
            local.set 2
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              local.get 4
              i32.load offset=28
              local.tee 7
              i32.const 2
              i32.shl
              local.tee 1
              i32.load offset=4660
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              i32.const 4660
              i32.add
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=4360
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=4360
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 8
                i32.load offset=16
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                local.get 8
                local.get 2
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 8
              local.get 2
              i32.store offset=20
            end
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 8
          i32.store offset=24
          block  ;; label = @4
            local.get 4
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 2
            i32.store offset=24
          end
          local.get 4
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 6
        local.get 0
        i32.add
        local.set 0
        local.get 4
        local.get 6
        i32.add
        local.tee 4
        i32.load offset=4
        local.set 1
      end
      local.get 4
      local.get 1
      i32.const -2
      i32.and
      i32.store offset=4
      local.get 5
      local.get 0
      i32.add
      local.get 0
      i32.store
      local.get 5
      local.get 0
      i32.const 1
      i32.or
      i32.store offset=4
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 4396
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4356
            local.tee 1
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            local.get 0
            i32.or
            i32.store offset=4356
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 5
        i32.store offset=12
        local.get 2
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 2
        i32.store offset=12
        local.get 5
        local.get 0
        i32.store offset=8
        br 1 (;@1;)
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 5
      local.get 2
      i32.store offset=28
      local.get 5
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 4660
      i32.add
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load offset=4360
        local.tee 7
        i32.const 1
        local.get 2
        i32.shl
        local.tee 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        local.get 5
        i32.store
        i32.const 0
        local.get 7
        local.get 4
        i32.or
        i32.store offset=4360
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 5
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.const 25
      local.get 2
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 2
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 2
      local.get 1
      i32.load
      local.set 7
      block  ;; label = @2
        loop  ;; label = @3
          local.get 7
          local.tee 1
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 0
          i32.eq
          br_if 1 (;@2;)
          local.get 2
          i32.const 29
          i32.shr_u
          local.set 7
          local.get 2
          i32.const 1
          i32.shl
          local.set 2
          local.get 1
          local.get 7
          i32.const 4
          i32.and
          i32.add
          local.tee 4
          i32.load offset=16
          local.tee 7
          br_if 0 (;@3;)
        end
        local.get 4
        i32.const 16
        i32.add
        local.get 5
        i32.store
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 5
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=8
      local.tee 2
      local.get 5
      i32.store offset=12
      local.get 1
      local.get 5
      i32.store offset=8
      local.get 5
      i32.const 0
      i32.store offset=24
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 2
      i32.store offset=8
    end
    local.get 3
    i32.const 8
    i32.add)
  (func $free (type 0) (param i32)
    local.get 0
    call $dlfree)
  (func $dlfree (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=4800
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.atomic.rmw.xchg offset=4804
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        loop  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=4804
            br_if 0 (;@4;)
            i32.const 0
            i32.const 1
            i32.atomic.rmw.xchg offset=4804
            i32.eqz
            br_if 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            i32.const 63
            i32.and
            br_if 0 (;@4;)
            call $sched_yield
            drop
          end
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          br 0 (;@3;)
        end
      end
      local.get 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 0
      i32.const -8
      i32.and
      local.tee 2
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 0
          i32.const 2
          i32.and
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 1
          i32.load
          local.tee 4
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=4372
          i32.lt_u
          br_if 1 (;@2;)
          local.get 4
          local.get 2
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=4376
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=12
                  local.set 0
                  block  ;; label = @8
                    local.get 4
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 1
                    i32.load offset=8
                    local.tee 5
                    i32.ne
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=4356
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=4356
                    br 5 (;@3;)
                  end
                  local.get 1
                  i32.load offset=24
                  local.set 6
                  block  ;; label = @8
                    local.get 0
                    local.get 1
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load offset=8
                    local.tee 4
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 4
                    i32.store offset=8
                    br 4 (;@4;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=20
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 20
                      i32.add
                      local.set 5
                      br 1 (;@8;)
                    end
                    local.get 1
                    i32.load offset=16
                    local.tee 4
                    i32.eqz
                    br_if 3 (;@5;)
                    local.get 1
                    i32.const 16
                    i32.add
                    local.set 5
                  end
                  loop  ;; label = @8
                    local.get 5
                    local.set 7
                    local.get 4
                    local.tee 0
                    i32.const 20
                    i32.add
                    local.set 5
                    local.get 0
                    i32.load offset=20
                    local.tee 4
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 16
                    i32.add
                    local.set 5
                    local.get 0
                    i32.load offset=16
                    local.tee 4
                    br_if 0 (;@8;)
                  end
                  local.get 7
                  i32.const 0
                  i32.store
                  br 3 (;@4;)
                end
                local.get 3
                i32.load offset=4
                local.tee 0
                i32.const 3
                i32.and
                i32.const 3
                i32.ne
                br_if 3 (;@3;)
                local.get 3
                local.get 0
                i32.const -2
                i32.and
                i32.store offset=4
                i32.const 0
                local.get 2
                i32.store offset=4364
                local.get 3
                local.get 2
                i32.store
                local.get 1
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                br 4 (;@2;)
              end
              local.get 0
              local.get 5
              i32.store offset=8
              local.get 5
              local.get 0
              i32.store offset=12
              br 2 (;@3;)
            end
            i32.const 0
            local.set 0
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              local.get 1
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              local.tee 4
              i32.load offset=4660
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              i32.const 4660
              i32.add
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=4360
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=4360
              br 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 6
                i32.load offset=16
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                local.get 6
                local.get 0
                i32.store offset=16
                br 1 (;@5;)
              end
              local.get 6
              local.get 0
              i32.store offset=20
            end
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 6
          i32.store offset=24
          block  ;; label = @4
            local.get 1
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 1
          i32.load offset=20
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          i32.store offset=20
          local.get 4
          local.get 0
          i32.store offset=24
        end
        local.get 1
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=4
        local.tee 4
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.const 2
                  i32.and
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 3
                    i32.const 0
                    i32.load offset=4380
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 1
                    i32.store offset=4380
                    i32.const 0
                    i32.const 0
                    i32.load offset=4368
                    local.get 2
                    i32.add
                    local.tee 2
                    i32.store offset=4368
                    local.get 1
                    local.get 2
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    i32.const 0
                    i32.load offset=4376
                    i32.ne
                    br_if 6 (;@2;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=4364
                    i32.const 0
                    i32.const 0
                    i32.store offset=4376
                    br 6 (;@2;)
                  end
                  block  ;; label = @8
                    local.get 3
                    i32.const 0
                    i32.load offset=4376
                    local.tee 6
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 1
                    i32.store offset=4376
                    i32.const 0
                    i32.const 0
                    i32.load offset=4364
                    local.get 2
                    i32.add
                    local.tee 2
                    i32.store offset=4364
                    local.get 1
                    local.get 2
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 2
                    i32.add
                    local.get 2
                    i32.store
                    br 6 (;@2;)
                  end
                  local.get 4
                  i32.const -8
                  i32.and
                  local.get 2
                  i32.add
                  local.set 2
                  local.get 3
                  i32.load offset=12
                  local.set 0
                  block  ;; label = @8
                    local.get 4
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 0
                      local.get 3
                      i32.load offset=8
                      local.tee 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.const 0
                      i32.load offset=4356
                      i32.const -2
                      local.get 4
                      i32.const 3
                      i32.shr_u
                      i32.rotl
                      i32.and
                      i32.store offset=4356
                      br 5 (;@4;)
                    end
                    local.get 0
                    local.get 5
                    i32.store offset=8
                    local.get 5
                    local.get 0
                    i32.store offset=12
                    br 4 (;@4;)
                  end
                  local.get 3
                  i32.load offset=24
                  local.set 8
                  block  ;; label = @8
                    local.get 0
                    local.get 3
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 3
                    i32.load offset=8
                    local.tee 4
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 4
                    i32.store offset=8
                    br 3 (;@5;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.load offset=20
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 20
                      i32.add
                      local.set 5
                      br 1 (;@8;)
                    end
                    local.get 3
                    i32.load offset=16
                    local.tee 4
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 3
                    i32.const 16
                    i32.add
                    local.set 5
                  end
                  loop  ;; label = @8
                    local.get 5
                    local.set 7
                    local.get 4
                    local.tee 0
                    i32.const 20
                    i32.add
                    local.set 5
                    local.get 0
                    i32.load offset=20
                    local.tee 4
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 16
                    i32.add
                    local.set 5
                    local.get 0
                    i32.load offset=16
                    local.tee 4
                    br_if 0 (;@8;)
                  end
                  local.get 7
                  i32.const 0
                  i32.store
                  br 2 (;@5;)
                end
                local.get 3
                local.get 4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 1
                local.get 2
                i32.add
                local.get 2
                i32.store
                local.get 1
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                br 3 (;@3;)
              end
              i32.const 0
              local.set 0
            end
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                local.get 3
                i32.load offset=28
                local.tee 5
                i32.const 2
                i32.shl
                local.tee 4
                i32.load offset=4660
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                i32.const 4660
                i32.add
                local.get 0
                i32.store
                local.get 0
                br_if 1 (;@5;)
                i32.const 0
                i32.const 0
                i32.load offset=4360
                i32.const -2
                local.get 5
                i32.rotl
                i32.and
                i32.store offset=4360
                br 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.load offset=16
                  local.get 3
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  local.get 0
                  i32.store offset=16
                  br 1 (;@6;)
                end
                local.get 8
                local.get 0
                i32.store offset=20
              end
              local.get 0
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 0
            local.get 8
            i32.store offset=24
            block  ;; label = @5
              local.get 3
              i32.load offset=16
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 0
              i32.store offset=24
            end
            local.get 3
            i32.load offset=20
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=20
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 1
          local.get 2
          i32.add
          local.get 2
          i32.store
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 6
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.get 2
          i32.store offset=4364
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const -8
          i32.and
          i32.const 4396
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=4356
              local.tee 4
              i32.const 1
              local.get 2
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              local.get 2
              i32.or
              i32.store offset=4356
              local.get 0
              local.set 2
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
            local.set 2
          end
          local.get 2
          local.get 1
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 1
          local.get 2
          i32.store offset=8
          br 1 (;@2;)
        end
        i32.const 31
        local.set 0
        block  ;; label = @3
          local.get 2
          i32.const 16777215
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 38
          local.get 2
          i32.const 8
          i32.shr_u
          i32.clz
          local.tee 0
          i32.sub
          i32.shr_u
          i32.const 1
          i32.and
          local.get 0
          i32.const 1
          i32.shl
          i32.sub
          i32.const 62
          i32.add
          local.set 0
        end
        local.get 1
        local.get 0
        i32.store offset=28
        local.get 1
        i64.const 0
        i64.store offset=16 align=4
        local.get 0
        i32.const 2
        i32.shl
        i32.const 4660
        i32.add
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=4360
                local.tee 4
                i32.const 1
                local.get 0
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                local.get 5
                local.get 1
                i32.store
                i32.const 0
                local.get 4
                local.get 3
                i32.or
                i32.store offset=4360
                i32.const 8
                local.set 2
                i32.const 24
                local.set 0
                br 1 (;@5;)
              end
              local.get 2
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 5
              i32.load
              local.set 5
              loop  ;; label = @6
                local.get 5
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 2
                i32.eq
                br_if 2 (;@4;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 5
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 4
                local.get 5
                i32.const 4
                i32.and
                i32.add
                local.tee 3
                i32.load offset=16
                local.tee 5
                br_if 0 (;@6;)
              end
              local.get 3
              i32.const 16
              i32.add
              local.get 1
              i32.store
              i32.const 8
              local.set 2
              i32.const 24
              local.set 0
              local.get 4
              local.set 5
            end
            local.get 1
            local.set 4
            local.get 1
            local.set 3
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=8
          local.tee 5
          local.get 1
          i32.store offset=12
          local.get 4
          local.get 1
          i32.store offset=8
          i32.const 0
          local.set 3
          i32.const 24
          local.set 2
          i32.const 8
          local.set 0
        end
        local.get 1
        local.get 0
        i32.add
        local.get 5
        i32.store
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 2
        i32.add
        local.get 3
        i32.store
        i32.const 0
        i32.const 0
        i32.load offset=4388
        i32.const -1
        i32.add
        local.tee 2
        i32.const -1
        local.get 2
        select
        i32.store offset=4388
      end
      i32.const 0
      i32.load8_u offset=4800
      i32.const 2
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.atomic.store offset=4804
    end)
  (func $sched_yield (type 9) (result i32)
    (local i32)
    block  ;; label = @1
      call $__wasi_sched_yield
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    global.get $__tls_base
    i32.const 0
    i32.add
    local.get 0
    i32.store
    i32.const -1)
  (func $__wasi_clock_time_get (type 5) (param i32 i64 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $__imported_wasi_snapshot_preview1_clock_time_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_close (type 4) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_fd_close
    i32.const 65535
    i32.and)
  (func $__wasi_fd_fdstat_get (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $__imported_wasi_snapshot_preview1_fd_fdstat_get
    i32.const 65535
    i32.and)
  (func $__wasi_fd_seek (type 7) (param i32 i64 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_seek
    i32.const 65535
    i32.and)
  (func $__wasi_fd_write (type 8) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__imported_wasi_snapshot_preview1_fd_write
    i32.const 65535
    i32.and)
  (func $__wasi_proc_exit (type 0) (param i32)
    local.get 0
    call $__imported_wasi_snapshot_preview1_proc_exit
    unreachable)
  (func $__wasi_sched_yield (type 9) (result i32)
    call $__imported_wasi_snapshot_preview1_sched_yield
    i32.const 65535
    i32.and)
  (func $__wasi_thread_spawn (type 4) (param i32) (result i32)
    local.get 0
    call $__imported_wasi_thread_spawn)
  (func $abort (type 1)
    unreachable)
  (func $sbrk (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block  ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        global.get $__tls_base
        i32.const 0
        i32.add
        i32.const 48
        i32.store
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable)
  (func $__wasi_init_tp (type 1)
    (local i32 i32 i32)
    global.get $__tls_base
    i32.const 4
    i32.add
    local.tee 0
    local.get 0
    i32.store
    i32.const 72576
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        i32.const 72576
        i32.eqz
        br_if 0 (;@2;)
        i32.const 72576
        i32.const 7040
        i32.sub
        local.set 2
        br 1 (;@1;)
      end
      global.get $__stack_pointer
      local.set 2
      i32.const 72576
      i32.const 7028
      i32.sub
      i32.const 1024
      local.get 2
      i32.const 1024
      i32.gt_u
      local.tee 1
      select
      local.set 2
      i32.const 72576
      i32.const 1024
      local.get 1
      select
      local.set 1
    end
    local.get 0
    i32.const 2
    i32.store offset=28
    local.get 0
    i32.const 0
    i32.store offset=56
    local.get 0
    local.get 2
    i32.store offset=52
    local.get 0
    local.get 1
    i32.store offset=48
    local.get 0
    i32.const 4852
    i32.store offset=92
    local.get 0
    i32.const 1073741823
    i32.store offset=20
    local.get 0
    local.get 0
    i32.const 72
    i32.add
    i32.store offset=72
    local.get 0
    i32.const 0
    i32.load offset=4840
    i32.store offset=12
    i32.const 0
    local.get 2
    i32.const 8388608
    local.get 2
    i32.const 8388608
    i32.lt_u
    select
    i32.store offset=4228
    local.get 0
    local.get 0
    i32.store offset=8
    local.get 0
    local.get 0
    i32.store offset=4)
  (func $__copy_tls (type 4) (param i32) (result i32)
    (local i32 i32)
    global.get $__tls_align
    local.set 1
    global.get $__tls_base
    local.set 2
    local.get 0
    local.get 1
    i32.add
    i32.const 0
    local.get 1
    i32.sub
    i32.and
    local.tee 1
    call $__wasm_init_tls
    local.get 2
    global.set $__tls_base
    local.get 1)
  (func $_Exit (type 0) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $dummy (type 1))
  (func $__wasm_call_dtors (type 1)
    call $dummy
    call $__stdio_exit)
  (func $exit (type 0) (param i32)
    call $dummy
    call $__stdio_exit
    local.get 0
    call $_Exit
    unreachable)
  (func $__lockfile (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=68
      i32.const -1073741825
      i32.and
      global.get $__tls_base
      i32.const 4
      i32.add
      i32.load offset=20
      local.tee 1
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 1
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 68
      i32.add
      local.tee 3
      i32.const 0
      local.get 1
      i32.atomic.rmw.cmpxchg
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 0
      local.get 1
      i32.const 1073741824
      i32.or
      local.tee 4
      i32.atomic.rmw.cmpxchg
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 1073741824
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.set 1
              br 1 (;@4;)
            end
            local.get 3
            local.get 0
            local.get 0
            i32.const 1073741824
            i32.or
            local.tee 1
            i32.atomic.rmw.cmpxchg
            local.get 0
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 3
          i32.const 0
          local.get 1
          i32.const 1
          call $__wait
        end
        local.get 3
        i32.const 0
        local.get 4
        i32.atomic.rmw.cmpxchg
        local.tee 0
        br_if 0 (;@2;)
      end
      i32.const 1
      local.set 2
    end
    local.get 2)
  (func $__unlockfile (type 0) (param i32)
    (local i32)
    local.get 0
    i32.const 68
    i32.add
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      local.get 0
      local.get 1
      i32.const 0
      i32.atomic.rmw.cmpxchg
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 1
      i32.const 1073741824
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      memory.atomic.notify
      drop
    end)
  (func $__stdio_exit (type 1)
    (local i32 i32 i32)
    block  ;; label = @1
      call $__ofl_lock
      i32.load
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=68
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 0
          call $__lockfile
          drop
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=24
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=32
          call_indirect (type 2)
          drop
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          i32.sub
          i64.extend_i32_s
          i32.const 1
          local.get 0
          i32.load offset=36
          call_indirect (type 3)
          drop
        end
        local.get 0
        i32.load offset=52
        local.tee 0
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=4876
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=68
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        call $__lockfile
        drop
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 3)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=4224
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=68
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        call $__lockfile
        drop
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 3)
      drop
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=4088
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=68
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 0
        call $__lockfile
        drop
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.get 0
        i32.load offset=24
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
      end
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=36
      call_indirect (type 3)
      drop
    end)
  (func $__towrite (type 4) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.load offset=64
    local.tee 1
    i32.const -1
    i32.add
    local.get 1
    i32.or
    i32.store offset=64
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const 8
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 32
      i32.or
      i32.store
      i32.const -1
      return
    end
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    local.get 0
    local.get 0
    i32.load offset=40
    local.tee 1
    i32.store offset=24
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=44
    i32.add
    i32.store offset=16
    i32.const 0)
  (func $__overflow (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store8 offset=15
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          call $__towrite
          i32.eqz
          br_if 0 (;@3;)
          i32.const -1
          local.set 3
          br 2 (;@1;)
        end
        local.get 0
        i32.load offset=16
        local.set 3
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=20
        local.tee 4
        local.get 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=72
        local.get 1
        i32.const 255
        i32.and
        local.tee 3
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 4
        local.get 1
        i32.store8
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        local.get 2
        i32.const 15
        i32.add
        i32.const 1
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        i32.const 1
        i32.eq
        br_if 0 (;@2;)
        i32.const -1
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      i32.load8_u offset=15
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $fputc (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=68
        local.tee 2
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 1073741823
        i32.and
        global.get $__tls_base
        i32.const 4
        i32.add
        i32.load offset=20
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 2
        local.get 1
        i32.load offset=72
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=16
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 3
        local.get 0
        i32.store8
        local.get 2
        return
      end
      local.get 1
      local.get 2
      call $__overflow
      return
    end
    local.get 0
    local.get 1
    call $locking_putc)
  (func $locking_putc (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.const 1073741823
      i32.atomic.rmw.cmpxchg offset=68
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $__lockfile
      drop
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.and
        local.tee 2
        local.get 1
        i32.load offset=72
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=16
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.const 1
        i32.add
        i32.store offset=20
        local.get 3
        local.get 0
        i32.store8
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      call $__overflow
      local.set 2
    end
    local.get 1
    i32.const 68
    i32.add
    local.set 1
    loop  ;; label = @1
      local.get 1
      i32.load
      local.tee 0
      local.get 1
      local.get 0
      i32.const 0
      i32.atomic.rmw.cmpxchg
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 0
      i32.const 1073741824
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 1
      memory.atomic.notify
      drop
    end
    local.get 2)
  (func $__fwritex (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 2
        call $__towrite
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=16
        local.set 3
      end
      block  ;; label = @2
        local.get 1
        local.get 3
        local.get 2
        i32.load offset=20
        local.tee 5
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        local.get 2
        local.get 0
        local.get 1
        local.get 2
        i32.load offset=32
        call_indirect (type 2)
        return
      end
      i32.const 0
      local.set 6
      block  ;; label = @2
        local.get 2
        i32.load offset=72
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.add
        local.set 4
        i32.const 0
        local.set 3
        block  ;; label = @3
          loop  ;; label = @4
            local.get 4
            local.get 3
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            br_if 1 (;@3;)
            local.get 1
            local.get 3
            i32.const -1
            i32.add
            local.tee 3
            i32.add
            br_if 0 (;@4;)
          end
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 2
        local.get 0
        local.get 1
        local.get 3
        i32.add
        local.tee 6
        local.get 2
        i32.load offset=32
        call_indirect (type 2)
        local.tee 4
        local.get 6
        i32.lt_u
        br_if 1 (;@1;)
        local.get 6
        local.get 0
        i32.add
        local.set 0
        i32.const 0
        local.get 3
        i32.sub
        local.set 1
        local.get 2
        i32.load offset=20
        local.set 5
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 0
        local.get 1
        memory.copy
      end
      local.get 2
      local.get 2
      i32.load offset=20
      local.get 1
      i32.add
      i32.store offset=20
      local.get 6
      local.get 1
      i32.add
      local.set 4
    end
    local.get 4)
  (func $fwrite (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=68
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      call $__lockfile
      i32.eqz
      local.set 4
    end
    local.get 2
    local.get 1
    i32.mul
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=16
        local.tee 6
        br_if 0 (;@2;)
        i32.const 0
        local.set 7
        local.get 3
        call $__towrite
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=16
        local.set 6
      end
      block  ;; label = @2
        local.get 5
        local.get 6
        local.get 3
        i32.load offset=20
        local.tee 8
        i32.sub
        i32.le_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 5
        local.get 3
        i32.load offset=32
        call_indirect (type 2)
        local.set 7
        br 1 (;@1;)
      end
      i32.const 0
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        i32.const 0
        local.set 6
        block  ;; label = @3
          local.get 3
          i32.load offset=72
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i32.add
        local.set 7
        block  ;; label = @3
          loop  ;; label = @4
            local.get 7
            local.get 6
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.eq
            br_if 1 (;@3;)
            local.get 5
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            i32.add
            br_if 0 (;@4;)
          end
          i32.const 0
          local.set 9
          local.get 5
          local.set 6
          br 1 (;@2;)
        end
        local.get 3
        local.get 0
        local.get 5
        local.get 6
        i32.add
        local.tee 9
        local.get 3
        i32.load offset=32
        call_indirect (type 2)
        local.tee 7
        local.get 9
        i32.lt_u
        br_if 1 (;@1;)
        local.get 9
        local.get 0
        i32.add
        local.set 0
        i32.const 0
        local.get 6
        i32.sub
        local.set 6
        local.get 3
        i32.load offset=20
        local.set 8
      end
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 8
        local.get 0
        local.get 6
        memory.copy
      end
      local.get 3
      local.get 3
      i32.load offset=20
      local.get 6
      i32.add
      i32.store offset=20
      local.get 9
      local.get 6
      i32.add
      local.set 7
    end
    block  ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      local.get 3
      call $__unlockfile
    end
    block  ;; label = @1
      local.get 7
      local.get 5
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      local.get 1
      select
      return
    end
    local.get 7
    local.get 1
    i32.div_u)
  (func $__ofl_lock (type 9) (result i32)
    i32.const 4880
    call $__lock
    i32.const 4884)
  (func $__ofl_unlock (type 1)
    i32.const 4880
    call $__unlock)
  (func $printf (type 6) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    i32.const 4096
    local.get 0
    local.get 1
    call $vfprintf
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__wasilibc_populate_preopens (type 1))
  (func $close (type 4) (param i32) (result i32)
    call $__wasilibc_populate_preopens
    block  ;; label = @1
      local.get 0
      call $__wasi_fd_close
      local.tee 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    global.get $__tls_base
    i32.const 0
    i32.add
    local.get 0
    i32.store
    i32.const -1)
  (func $dummy.1 (type 4) (param i32) (result i32)
    local.get 0)
  (func $__stdio_close (type 4) (param i32) (result i32)
    local.get 0
    i32.load offset=56
    call $dummy.1
    call $close)
  (func $writev (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const -1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        global.get $__tls_base
        i32.const 0
        i32.add
        i32.const 28
        i32.store
        br 1 (;@1;)
      end
      local.get 3
      i32.const 0
      i32.store offset=12
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        i32.const 12
        i32.add
        call $__wasi_fd_write
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        global.get $__tls_base
        i32.const 0
        i32.add
        local.get 2
        i32.store
        i32.const -1
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      i32.load offset=12
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $__stdio_write (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 0
    i32.load offset=24
    local.tee 1
    i32.store
    local.get 3
    local.get 0
    i32.load offset=20
    local.get 1
    i32.sub
    local.tee 4
    i32.store offset=4
    i32.const 2
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=56
        local.get 3
        i32.const 2
        call $writev
        local.tee 1
        local.get 4
        local.get 2
        i32.add
        local.tee 6
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.set 4
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            local.get 0
            i32.const 0
            i32.store offset=24
            local.get 0
            i64.const 0
            i64.store offset=16
            local.get 0
            local.get 0
            i32.load
            i32.const 32
            i32.or
            i32.store
            local.get 5
            i32.const 2
            i32.eq
            br_if 3 (;@1;)
            local.get 2
            local.get 4
            i32.load offset=4
            i32.sub
            local.set 1
            br 3 (;@1;)
          end
          local.get 4
          i32.const 8
          i32.const 0
          local.get 1
          local.get 4
          i32.load offset=4
          local.tee 7
          i32.gt_u
          local.tee 8
          select
          i32.add
          local.tee 9
          local.get 9
          i32.load
          local.get 1
          local.get 7
          i32.const 0
          local.get 8
          select
          i32.sub
          local.tee 7
          i32.add
          i32.store
          local.get 4
          i32.const 12
          i32.const 4
          local.get 8
          select
          i32.add
          local.tee 4
          local.get 4
          i32.load
          local.get 7
          i32.sub
          i32.store
          local.get 9
          local.set 4
          local.get 6
          local.get 1
          i32.sub
          local.tee 6
          local.get 0
          i32.load offset=56
          local.get 9
          local.get 5
          local.get 8
          i32.sub
          local.tee 5
          call $writev
          local.tee 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 0
      i32.load offset=40
      local.tee 1
      i32.store offset=24
      local.get 0
      local.get 1
      i32.store offset=20
      local.get 0
      local.get 1
      local.get 0
      i32.load offset=44
      i32.add
      i32.store offset=16
      local.get 2
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__lseek (type 3) (param i32 i64 i32) (result i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        i32.const 255
        i32.and
        local.get 3
        i32.const 8
        i32.add
        call $__wasi_fd_seek
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        global.get $__tls_base
        i32.const 0
        i32.add
        i32.const 70
        local.get 2
        local.get 2
        i32.const 76
        i32.eq
        select
        i32.store
        i64.const -1
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i64.load offset=8
      local.set 1
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $__stdio_seek (type 3) (param i32 i64 i32) (result i64)
    local.get 0
    i32.load offset=56
    local.get 1
    local.get 2
    call $__lseek)
  (func $__isatty (type 4) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        local.get 1
        i32.const 8
        i32.add
        call $__wasi_fd_fdstat_get
        local.tee 0
        br_if 0 (;@2;)
        i32.const 59
        local.set 0
        local.get 1
        i32.load8_u offset=8
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u offset=16
        i32.const 36
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        br 1 (;@1;)
      end
      global.get $__tls_base
      i32.const 0
      i32.add
      local.get 0
      i32.store
      i32.const 0
      local.set 0
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__stdout_write (type 2) (param i32 i32 i32) (result i32)
    local.get 0
    i32.const 5
    i32.store offset=32
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 64
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=56
      call $__isatty
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.store offset=72
    end
    local.get 0
    local.get 1
    local.get 2
    call $__stdio_write)
  (func $dummy.2 (type 6) (param i32 i32) (result i32)
    local.get 0)
  (func $__lctrans (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $dummy.2)
  (func $strerror (type 4) (param i32) (result i32)
    i32.const 0
    local.get 0
    local.get 0
    i32.const 76
    i32.gt_u
    select
    i32.const 1
    i32.shl
    i32.load16_u offset=3312
    i32.const 1760
    i32.add
    global.get $__tls_base
    i32.const 4
    i32.add
    i32.load offset=92
    i32.load offset=20
    call $__lctrans)
  (func $wcrtomb (type 2) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 127
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store8
        i32.const 1
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          global.get $__tls_base
          i32.const 4
          i32.add
          i32.load offset=92
          i32.load
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const -128
            i32.and
            i32.const 57216
            i32.eq
            br_if 0 (;@4;)
            global.get $__tls_base
            i32.const 0
            i32.add
            i32.const 25
            i32.store
            br 2 (;@2;)
          end
          local.get 0
          local.get 1
          i32.store8
          i32.const 1
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const 2047
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 192
          i32.or
          i32.store8
          i32.const 2
          return
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 55296
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -8192
            i32.and
            i32.const 57344
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 224
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 3
          return
        end
        block  ;; label = @3
          local.get 1
          i32.const -65536
          i32.add
          i32.const 1048575
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=3
          local.get 0
          local.get 1
          i32.const 18
          i32.shr_u
          i32.const 240
          i32.or
          i32.store8
          local.get 0
          local.get 1
          i32.const 6
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=2
          local.get 0
          local.get 1
          i32.const 12
          i32.shr_u
          i32.const 63
          i32.and
          i32.const 128
          i32.or
          i32.store8 offset=1
          i32.const 4
          return
        end
        global.get $__tls_base
        i32.const 0
        i32.add
        i32.const 25
        i32.store
      end
      i32.const -1
      local.set 3
    end
    local.get 3)
  (func $wctomb (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.const 0
    call $wcrtomb)
  (func $frexp (type 12) (param f64 i32) (result f64)
    (local i64 i32)
    block  ;; label = @1
      local.get 0
      i64.reinterpret_f64
      local.tee 2
      i64.const 52
      i64.shr_u
      i32.wrap_i64
      i32.const 2047
      i32.and
      local.tee 3
      i32.const 2047
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          f64.const 0x0p+0 (;=0;)
          f64.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
          local.get 0
          return
        end
        local.get 0
        f64.const 0x1p+64 (;=1.84467e+19;)
        f64.mul
        local.get 1
        call $frexp
        local.set 0
        local.get 1
        local.get 1
        i32.load
        i32.const -64
        i32.add
        i32.store
        local.get 0
        return
      end
      local.get 1
      local.get 3
      i32.const -1022
      i32.add
      i32.store
      local.get 2
      i64.const -9218868437227405313
      i64.and
      i64.const 4602678819172646912
      i64.or
      f64.reinterpret_i64
      local.set 0
    end
    local.get 0)
  (func $fputs (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    call $strlen
    local.set 2
    i32.const -1
    i32.const 0
    local.get 2
    local.get 0
    i32.const 1
    local.get 2
    local.get 1
    call $fwrite
    i32.ne
    select)
  (func $vfprintf (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=204
    local.get 3
    i32.const 192
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 184
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i32.const 176
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=168
    local.get 3
    i64.const 0
    i64.store offset=160
    local.get 3
    local.get 2
    i32.store offset=200
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=68
          i32.const 0
          i32.ge_s
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
          br 1 (;@2;)
        end
        local.get 0
        call $__lockfile
        i32.eqz
        local.set 4
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 5
      i32.const -33
      i32.and
      i32.store
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=44
              br_if 0 (;@5;)
              local.get 0
              i32.const 80
              i32.store offset=44
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              i64.const 0
              i64.store offset=16
              local.get 0
              i32.load offset=40
              local.set 6
              local.get 0
              local.get 3
              i32.store offset=40
              br 1 (;@4;)
            end
            i32.const 0
            local.set 6
            local.get 0
            i32.load offset=16
            br_if 1 (;@3;)
          end
          i32.const -1
          local.set 2
          local.get 0
          call $__towrite
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 1
        local.get 3
        i32.const 200
        i32.add
        local.get 3
        i32.const 80
        i32.add
        local.get 3
        i32.const 160
        i32.add
        call $printf_core
        local.set 2
      end
      local.get 5
      i32.const 32
      i32.and
      local.set 1
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 0
        local.get 0
        i32.load offset=32
        call_indirect (type 2)
        drop
        local.get 0
        i32.const 0
        i32.store offset=44
        local.get 0
        local.get 6
        i32.store offset=40
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i32.load offset=20
        local.set 6
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 2
        i32.const -1
        local.get 6
        select
        local.set 2
      end
      local.get 0
      local.get 0
      i32.load
      local.tee 6
      local.get 1
      i32.or
      i32.store
      i32.const -1
      local.get 2
      local.get 6
      i32.const 32
      i32.and
      select
      local.set 2
      local.get 4
      br_if 0 (;@1;)
      local.get 0
      call $__unlockfile
    end
    local.get 3
    i32.const 208
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $printf_core (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 f64 i32 i32 i32 i32 i32 i64 i32 i32 f64)
    global.get $__stack_pointer
    i32.const 864
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    global.get $__tls_base
    i32.const 0
    i32.add
    local.set 6
    local.get 5
    i32.const 52
    i32.add
    i32.const 12
    i32.add
    local.set 7
    local.get 5
    i32.const 96
    i32.add
    i32.const -4
    i32.add
    local.set 8
    local.get 5
    i32.const 16
    i32.add
    i32.const 25
    i32.add
    local.set 9
    local.get 5
    i32.const 39
    i32.add
    local.set 10
    local.get 5
    i32.const 52
    i32.add
    i32.const 11
    i32.add
    local.set 11
    local.get 5
    i32.const 64
    i32.add
    i32.const -1
    i32.add
    local.set 12
    local.get 5
    i32.const 64
    i32.add
    i32.const 8
    i32.or
    local.set 13
    local.get 5
    i32.const 64
    i32.add
    i32.const 9
    i32.or
    local.set 14
    local.get 5
    i32.const 52
    i32.add
    i32.const 10
    i32.add
    local.set 15
    local.get 5
    i32.const 40
    i32.add
    local.set 16
    i32.const 0
    local.set 17
    i32.const 0
    local.set 18
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 0
          local.set 19
          block  ;; label = @4
            loop  ;; label = @5
              local.get 1
              local.set 20
              local.get 19
              local.get 18
              i32.const 2147483647
              i32.xor
              i32.gt_s
              br_if 1 (;@4;)
              local.get 19
              local.get 18
              i32.add
              local.set 18
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 20
                                i32.load8_u
                                local.tee 19
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 20
                                local.set 1
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 19
                                        i32.const 255
                                        i32.and
                                        local.tee 19
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 19
                                        i32.const 37
                                        i32.ne
                                        br_if 2 (;@16;)
                                        local.get 1
                                        local.set 19
                                        loop  ;; label = @19
                                          local.get 1
                                          i32.const 1
                                          i32.add
                                          i32.load8_u
                                          i32.const 37
                                          i32.ne
                                          br_if 2 (;@17;)
                                          local.get 19
                                          i32.const 1
                                          i32.add
                                          local.set 19
                                          local.get 1
                                          i32.const 2
                                          i32.add
                                          local.tee 1
                                          i32.load8_u
                                          i32.const 37
                                          i32.eq
                                          br_if 0 (;@19;)
                                          br 2 (;@17;)
                                        end
                                      end
                                      local.get 1
                                      local.set 19
                                    end
                                    local.get 19
                                    local.get 20
                                    i32.sub
                                    local.tee 19
                                    local.get 18
                                    i32.const 2147483647
                                    i32.xor
                                    local.tee 21
                                    i32.gt_s
                                    br_if 12 (;@4;)
                                    block  ;; label = @17
                                      local.get 0
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 20
                                      local.get 19
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 19
                                    br_if 11 (;@5;)
                                    local.get 1
                                    i32.const 1
                                    i32.add
                                    local.set 22
                                    i32.const -1
                                    local.set 23
                                    block  ;; label = @17
                                      local.get 1
                                      i32.load8_s offset=1
                                      local.tee 24
                                      i32.const -48
                                      i32.add
                                      local.tee 19
                                      i32.const 9
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 1
                                      i32.load8_u offset=2
                                      i32.const 36
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 1
                                      i32.const 3
                                      i32.add
                                      local.set 22
                                      local.get 1
                                      i32.load8_s offset=3
                                      local.set 24
                                      i32.const 1
                                      local.set 17
                                      local.get 19
                                      local.set 23
                                    end
                                    i32.const 0
                                    local.set 25
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 24
                                        i32.const -32
                                        i32.add
                                        local.tee 1
                                        i32.const 31
                                        i32.le_u
                                        br_if 0 (;@18;)
                                        local.get 22
                                        local.set 1
                                        br 1 (;@17;)
                                      end
                                      block  ;; label = @18
                                        i32.const 1
                                        local.get 1
                                        i32.shl
                                        local.tee 19
                                        i32.const 75913
                                        i32.and
                                        br_if 0 (;@18;)
                                        local.get 22
                                        local.set 1
                                        br 1 (;@17;)
                                      end
                                      local.get 22
                                      i32.const 1
                                      i32.add
                                      local.set 22
                                      i32.const 0
                                      local.set 25
                                      loop  ;; label = @18
                                        local.get 19
                                        local.get 25
                                        i32.or
                                        local.set 25
                                        local.get 22
                                        local.tee 1
                                        i32.load8_s
                                        local.tee 24
                                        i32.const -32
                                        i32.add
                                        local.tee 19
                                        i32.const 32
                                        i32.ge_u
                                        br_if 1 (;@17;)
                                        local.get 1
                                        i32.const 1
                                        i32.add
                                        local.set 22
                                        i32.const 1
                                        local.get 19
                                        i32.shl
                                        local.tee 19
                                        i32.const 75913
                                        i32.and
                                        br_if 0 (;@18;)
                                      end
                                    end
                                    block  ;; label = @17
                                      local.get 24
                                      i32.const 42
                                      i32.ne
                                      br_if 0 (;@17;)
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 1
                                          i32.load8_s offset=1
                                          i32.const -48
                                          i32.add
                                          local.tee 19
                                          i32.const 9
                                          i32.gt_u
                                          br_if 0 (;@19;)
                                          local.get 1
                                          i32.load8_u offset=2
                                          i32.const 36
                                          i32.ne
                                          br_if 0 (;@19;)
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              local.get 0
                                              br_if 0 (;@21;)
                                              local.get 4
                                              local.get 19
                                              i32.const 2
                                              i32.shl
                                              i32.add
                                              i32.const 10
                                              i32.store
                                              i32.const 0
                                              local.set 26
                                              br 1 (;@20;)
                                            end
                                            local.get 3
                                            local.get 19
                                            i32.const 3
                                            i32.shl
                                            i32.add
                                            i32.load
                                            local.set 26
                                          end
                                          local.get 1
                                          i32.const 3
                                          i32.add
                                          local.set 1
                                          i32.const 1
                                          local.set 17
                                          br 1 (;@18;)
                                        end
                                        local.get 17
                                        br_if 6 (;@12;)
                                        local.get 1
                                        i32.const 1
                                        i32.add
                                        local.set 1
                                        block  ;; label = @19
                                          local.get 0
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          local.set 17
                                          i32.const 0
                                          local.set 26
                                          br 6 (;@13;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 19
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 19
                                        i32.load
                                        local.set 26
                                        i32.const 0
                                        local.set 17
                                      end
                                      local.get 26
                                      i32.const -1
                                      i32.gt_s
                                      br_if 4 (;@13;)
                                      i32.const 0
                                      local.get 26
                                      i32.sub
                                      local.set 26
                                      local.get 25
                                      i32.const 8192
                                      i32.or
                                      local.set 25
                                      br 4 (;@13;)
                                    end
                                    i32.const 0
                                    local.set 26
                                    local.get 24
                                    i32.const -48
                                    i32.add
                                    local.tee 22
                                    i32.const 9
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                    local.get 1
                                    local.set 19
                                    loop  ;; label = @17
                                      block  ;; label = @18
                                        local.get 26
                                        i32.const 214748364
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        i32.const -1
                                        local.get 26
                                        i32.const 10
                                        i32.mul
                                        local.tee 1
                                        local.get 22
                                        i32.add
                                        local.get 22
                                        local.get 1
                                        i32.const 2147483647
                                        i32.xor
                                        i32.gt_u
                                        local.tee 24
                                        select
                                        local.set 26
                                        local.get 19
                                        i32.load8_s offset=1
                                        local.set 22
                                        local.get 19
                                        i32.const 1
                                        i32.add
                                        local.tee 1
                                        local.set 19
                                        local.get 22
                                        i32.const -48
                                        i32.add
                                        local.tee 22
                                        i32.const 10
                                        i32.lt_u
                                        br_if 1 (;@17;)
                                        local.get 24
                                        br_if 14 (;@4;)
                                        br 5 (;@13;)
                                      end
                                      local.get 19
                                      i32.load8_s offset=1
                                      local.set 1
                                      i32.const -1
                                      local.set 26
                                      local.get 19
                                      i32.const 1
                                      i32.add
                                      local.set 19
                                      local.get 1
                                      i32.const -48
                                      i32.add
                                      local.tee 22
                                      i32.const 10
                                      i32.lt_u
                                      br_if 0 (;@17;)
                                      br 13 (;@4;)
                                    end
                                  end
                                  local.get 1
                                  i32.const 1
                                  i32.add
                                  local.tee 1
                                  i32.load8_u
                                  local.set 19
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              br_if 12 (;@1;)
                              block  ;; label = @14
                                local.get 17
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 18
                                br 13 (;@1;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=4
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 1
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 8
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=8
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 2
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 16
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=12
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 3
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 24
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=16
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 4
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 32
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=20
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 5
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 40
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=24
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 6
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 48
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=28
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 7
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 56
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  block  ;; label = @16
                                    local.get 4
                                    i32.load offset=32
                                    local.tee 1
                                    br_if 0 (;@16;)
                                    i32.const 8
                                    local.set 1
                                    br 1 (;@15;)
                                  end
                                  local.get 3
                                  i32.const 64
                                  i32.add
                                  local.get 1
                                  local.get 2
                                  call $pop_arg
                                  local.get 4
                                  i32.load offset=36
                                  local.tee 1
                                  br_if 1 (;@14;)
                                  i32.const 9
                                  local.set 1
                                end
                                local.get 1
                                i32.const 2
                                i32.shl
                                local.set 1
                                loop  ;; label = @15
                                  local.get 4
                                  local.get 1
                                  i32.add
                                  i32.load
                                  br_if 3 (;@12;)
                                  local.get 1
                                  i32.const 4
                                  i32.add
                                  local.tee 1
                                  i32.const 40
                                  i32.ne
                                  br_if 0 (;@15;)
                                end
                                i32.const 1
                                local.set 18
                                br 13 (;@1;)
                              end
                              local.get 3
                              i32.const 72
                              i32.add
                              local.get 1
                              local.get 2
                              call $pop_arg
                              i32.const 1
                              local.set 18
                              br 12 (;@1;)
                            end
                            i32.const 0
                            local.set 19
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 1
                                i32.load8_u
                                i32.const 46
                                i32.eq
                                br_if 0 (;@14;)
                                i32.const -1
                                local.set 24
                                i32.const 0
                                local.set 27
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 1
                                i32.load8_s offset=1
                                local.tee 22
                                i32.const 42
                                i32.ne
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  local.get 1
                                  i32.load8_s offset=2
                                  i32.const -48
                                  i32.add
                                  local.tee 22
                                  i32.const 9
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  local.get 1
                                  i32.load8_u offset=3
                                  i32.const 36
                                  i32.ne
                                  br_if 0 (;@15;)
                                  block  ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 22
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    i32.const 10
                                    i32.store
                                    i32.const 0
                                    local.set 24
                                    local.get 1
                                    i32.const 4
                                    i32.add
                                    local.set 1
                                    i32.const 0
                                    i32.const -1
                                    i32.gt_s
                                    local.set 27
                                    br 3 (;@13;)
                                  end
                                  local.get 1
                                  i32.const 4
                                  i32.add
                                  local.set 1
                                  local.get 3
                                  local.get 22
                                  i32.const 3
                                  i32.shl
                                  i32.add
                                  i32.load
                                  local.tee 24
                                  i32.const -1
                                  i32.gt_s
                                  local.set 27
                                  br 2 (;@13;)
                                end
                                local.get 17
                                br_if 2 (;@12;)
                                local.get 1
                                i32.const 2
                                i32.add
                                local.set 1
                                block  ;; label = @15
                                  local.get 0
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 24
                                  i32.const 0
                                  i32.const -1
                                  i32.gt_s
                                  local.set 27
                                  br 2 (;@13;)
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                local.tee 22
                                i32.const 4
                                i32.add
                                i32.store
                                local.get 22
                                i32.load
                                local.tee 24
                                i32.const -1
                                i32.gt_s
                                local.set 27
                                br 1 (;@13;)
                              end
                              local.get 1
                              i32.const 1
                              i32.add
                              local.set 1
                              block  ;; label = @14
                                local.get 22
                                i32.const -48
                                i32.add
                                local.tee 28
                                i32.const 9
                                i32.le_u
                                br_if 0 (;@14;)
                                i32.const 1
                                local.set 27
                                i32.const 0
                                local.set 24
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 22
                              loop  ;; label = @14
                                i32.const -1
                                local.set 24
                                block  ;; label = @15
                                  local.get 22
                                  i32.const 214748364
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.get 22
                                  i32.const 10
                                  i32.mul
                                  local.tee 22
                                  local.get 28
                                  i32.add
                                  local.get 28
                                  local.get 22
                                  i32.const 2147483647
                                  i32.xor
                                  i32.gt_u
                                  select
                                  local.set 24
                                end
                                i32.const 1
                                local.set 27
                                local.get 24
                                local.set 22
                                local.get 1
                                i32.const 1
                                i32.add
                                local.tee 1
                                i32.load8_s
                                i32.const -48
                                i32.add
                                local.tee 28
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                              end
                            end
                            loop  ;; label = @13
                              local.get 19
                              local.set 22
                              local.get 1
                              i32.load8_s
                              local.tee 19
                              i32.const -123
                              i32.add
                              i32.const -58
                              i32.lt_u
                              br_if 1 (;@12;)
                              local.get 1
                              i32.const 1
                              i32.add
                              local.set 1
                              local.get 19
                              local.get 22
                              i32.const 58
                              i32.mul
                              i32.add
                              i32.const 3407
                              i32.add
                              i32.load8_u
                              local.tee 19
                              i32.const -1
                              i32.add
                              i32.const 255
                              i32.and
                              i32.const 8
                              i32.lt_u
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 19
                                i32.const 27
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 19
                                i32.eqz
                                br_if 2 (;@12;)
                                block  ;; label = @15
                                  local.get 23
                                  i32.const 0
                                  i32.lt_s
                                  br_if 0 (;@15;)
                                  block  ;; label = @16
                                    local.get 0
                                    br_if 0 (;@16;)
                                    local.get 4
                                    local.get 23
                                    i32.const 2
                                    i32.shl
                                    i32.add
                                    local.get 19
                                    i32.store
                                    br 13 (;@3;)
                                  end
                                  local.get 5
                                  local.get 3
                                  local.get 23
                                  i32.const 3
                                  i32.shl
                                  i32.add
                                  i64.load
                                  i64.store offset=40
                                  br 2 (;@13;)
                                end
                                block  ;; label = @15
                                  local.get 0
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 18
                                  br 14 (;@1;)
                                end
                                local.get 5
                                i32.const 40
                                i32.add
                                local.get 19
                                local.get 2
                                call $pop_arg
                                br 1 (;@13;)
                              end
                              local.get 23
                              i32.const -1
                              i32.gt_s
                              br_if 1 (;@12;)
                              i32.const 0
                              local.set 19
                              local.get 0
                              i32.eqz
                              br_if 8 (;@5;)
                            end
                            local.get 0
                            i32.load
                            local.tee 23
                            i32.const 32
                            i32.and
                            br_if 10 (;@2;)
                            local.get 25
                            i32.const -65537
                            i32.and
                            local.tee 28
                            local.get 25
                            local.get 25
                            i32.const 8192
                            i32.and
                            select
                            local.set 29
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                local.get 1
                                                                i32.const -1
                                                                i32.add
                                                                i32.load8_u
                                                                local.tee 25
                                                                i32.extend8_s
                                                                local.tee 19
                                                                i32.const -45
                                                                i32.and
                                                                local.get 19
                                                                local.get 25
                                                                i32.const 15
                                                                i32.and
                                                                i32.const 3
                                                                i32.eq
                                                                select
                                                                local.get 19
                                                                local.get 22
                                                                select
                                                                local.tee 30
                                                                i32.const -65
                                                                i32.add
                                                                br_table 17 (;@13;) 19 (;@11;) 12 (;@18;) 19 (;@11;) 17 (;@13;) 17 (;@13;) 17 (;@13;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 13 (;@17;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 3 (;@27;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 17 (;@13;) 19 (;@11;) 8 (;@22;) 5 (;@25;) 17 (;@13;) 17 (;@13;) 17 (;@13;) 19 (;@11;) 5 (;@25;) 19 (;@11;) 19 (;@11;) 19 (;@11;) 9 (;@21;) 1 (;@29;) 4 (;@26;) 2 (;@28;) 19 (;@11;) 19 (;@11;) 10 (;@20;) 19 (;@11;) 0 (;@30;) 19 (;@11;) 19 (;@11;) 3 (;@27;) 19 (;@11;)
                                                              end
                                                              i32.const 0
                                                              local.set 23
                                                              i32.const 1190
                                                              local.set 31
                                                              local.get 5
                                                              i64.load offset=40
                                                              local.set 32
                                                              br 5 (;@24;)
                                                            end
                                                            i32.const 0
                                                            local.set 19
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          local.get 22
                                                                          br_table 0 (;@35;) 1 (;@34;) 2 (;@33;) 3 (;@32;) 4 (;@31;) 30 (;@5;) 5 (;@30;) 6 (;@29;) 30 (;@5;)
                                                                        end
                                                                        local.get 5
                                                                        i32.load offset=40
                                                                        local.get 18
                                                                        i32.store
                                                                        br 29 (;@5;)
                                                                      end
                                                                      local.get 5
                                                                      i32.load offset=40
                                                                      local.get 18
                                                                      i32.store
                                                                      br 28 (;@5;)
                                                                    end
                                                                    local.get 5
                                                                    i32.load offset=40
                                                                    local.get 18
                                                                    i64.extend_i32_s
                                                                    i64.store
                                                                    br 27 (;@5;)
                                                                  end
                                                                  local.get 5
                                                                  i32.load offset=40
                                                                  local.get 18
                                                                  i32.store16
                                                                  br 26 (;@5;)
                                                                end
                                                                local.get 5
                                                                i32.load offset=40
                                                                local.get 18
                                                                i32.store8
                                                                br 25 (;@5;)
                                                              end
                                                              local.get 5
                                                              i32.load offset=40
                                                              local.get 18
                                                              i32.store
                                                              br 24 (;@5;)
                                                            end
                                                            local.get 5
                                                            i32.load offset=40
                                                            local.get 18
                                                            i64.extend_i32_s
                                                            i64.store
                                                            br 23 (;@5;)
                                                          end
                                                          local.get 24
                                                          i32.const 8
                                                          local.get 24
                                                          i32.const 8
                                                          i32.gt_u
                                                          select
                                                          local.set 24
                                                          local.get 29
                                                          i32.const 8
                                                          i32.or
                                                          local.set 29
                                                          i32.const 120
                                                          local.set 30
                                                        end
                                                        i32.const 0
                                                        local.set 23
                                                        i32.const 1190
                                                        local.set 31
                                                        block  ;; label = @27
                                                          local.get 5
                                                          i64.load offset=40
                                                          local.tee 32
                                                          i64.eqz
                                                          i32.eqz
                                                          br_if 0 (;@27;)
                                                          local.get 16
                                                          local.set 20
                                                          br 4 (;@23;)
                                                        end
                                                        local.get 30
                                                        i32.const 32
                                                        i32.and
                                                        local.set 22
                                                        local.get 16
                                                        local.set 20
                                                        loop  ;; label = @27
                                                          local.get 20
                                                          i32.const -1
                                                          i32.add
                                                          local.tee 20
                                                          local.get 32
                                                          i32.wrap_i64
                                                          i32.const 15
                                                          i32.and
                                                          i32.load8_u offset=3936
                                                          local.get 22
                                                          i32.or
                                                          i32.store8
                                                          local.get 32
                                                          i64.const 15
                                                          i64.gt_u
                                                          local.set 19
                                                          local.get 32
                                                          i64.const 4
                                                          i64.shr_u
                                                          local.set 32
                                                          local.get 19
                                                          br_if 0 (;@27;)
                                                        end
                                                        local.get 29
                                                        i32.const 8
                                                        i32.and
                                                        i32.eqz
                                                        br_if 3 (;@23;)
                                                        local.get 30
                                                        i32.const 4
                                                        i32.shr_u
                                                        i32.const 1190
                                                        i32.add
                                                        local.set 31
                                                        i32.const 2
                                                        local.set 23
                                                        br 3 (;@23;)
                                                      end
                                                      local.get 16
                                                      local.set 20
                                                      block  ;; label = @26
                                                        local.get 5
                                                        i64.load offset=40
                                                        local.tee 32
                                                        i64.eqz
                                                        br_if 0 (;@26;)
                                                        local.get 16
                                                        local.set 20
                                                        loop  ;; label = @27
                                                          local.get 20
                                                          i32.const -1
                                                          i32.add
                                                          local.tee 20
                                                          local.get 32
                                                          i32.wrap_i64
                                                          i32.const 7
                                                          i32.and
                                                          i32.const 48
                                                          i32.or
                                                          i32.store8
                                                          local.get 32
                                                          i64.const 7
                                                          i64.gt_u
                                                          local.set 19
                                                          local.get 32
                                                          i64.const 3
                                                          i64.shr_u
                                                          local.set 32
                                                          local.get 19
                                                          br_if 0 (;@27;)
                                                        end
                                                      end
                                                      i32.const 0
                                                      local.set 23
                                                      i32.const 1190
                                                      local.set 31
                                                      local.get 29
                                                      i32.const 8
                                                      i32.and
                                                      i32.eqz
                                                      br_if 2 (;@23;)
                                                      local.get 24
                                                      local.get 9
                                                      local.get 20
                                                      i32.sub
                                                      local.tee 19
                                                      local.get 24
                                                      local.get 19
                                                      i32.gt_s
                                                      select
                                                      local.set 24
                                                      br 2 (;@23;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 5
                                                      i64.load offset=40
                                                      local.tee 32
                                                      i64.const -1
                                                      i64.gt_s
                                                      br_if 0 (;@25;)
                                                      local.get 5
                                                      i64.const 0
                                                      local.get 32
                                                      i64.sub
                                                      local.tee 32
                                                      i64.store offset=40
                                                      i32.const 1
                                                      local.set 23
                                                      i32.const 1190
                                                      local.set 31
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 29
                                                      i32.const 2048
                                                      i32.and
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      i32.const 1
                                                      local.set 23
                                                      i32.const 1191
                                                      local.set 31
                                                      br 1 (;@24;)
                                                    end
                                                    i32.const 1192
                                                    i32.const 1190
                                                    local.get 29
                                                    i32.const 1
                                                    i32.and
                                                    local.tee 23
                                                    select
                                                    local.set 31
                                                  end
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      local.get 32
                                                      i64.const 4294967296
                                                      i64.ge_u
                                                      br_if 0 (;@25;)
                                                      local.get 32
                                                      local.set 33
                                                      local.get 16
                                                      local.set 20
                                                      br 1 (;@24;)
                                                    end
                                                    local.get 16
                                                    local.set 20
                                                    loop  ;; label = @25
                                                      local.get 20
                                                      i32.const -1
                                                      i32.add
                                                      local.tee 20
                                                      local.get 32
                                                      local.get 32
                                                      i64.const 10
                                                      i64.div_u
                                                      local.tee 33
                                                      i64.const 10
                                                      i64.mul
                                                      i64.sub
                                                      i32.wrap_i64
                                                      i32.const 48
                                                      i32.or
                                                      i32.store8
                                                      local.get 32
                                                      i64.const 42949672959
                                                      i64.gt_u
                                                      local.set 19
                                                      local.get 33
                                                      local.set 32
                                                      local.get 19
                                                      br_if 0 (;@25;)
                                                    end
                                                  end
                                                  local.get 33
                                                  i64.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 33
                                                  i32.wrap_i64
                                                  local.set 19
                                                  loop  ;; label = @24
                                                    local.get 20
                                                    i32.const -1
                                                    i32.add
                                                    local.tee 20
                                                    local.get 19
                                                    local.get 19
                                                    i32.const 10
                                                    i32.div_u
                                                    local.tee 22
                                                    i32.const 10
                                                    i32.mul
                                                    i32.sub
                                                    i32.const 48
                                                    i32.or
                                                    i32.store8
                                                    local.get 19
                                                    i32.const 9
                                                    i32.gt_u
                                                    local.set 25
                                                    local.get 22
                                                    local.set 19
                                                    local.get 25
                                                    br_if 0 (;@24;)
                                                  end
                                                end
                                                local.get 27
                                                local.get 24
                                                i32.const 0
                                                i32.lt_s
                                                i32.and
                                                br_if 18 (;@4;)
                                                local.get 29
                                                i32.const -65537
                                                i32.and
                                                local.get 29
                                                local.get 27
                                                select
                                                local.set 28
                                                block  ;; label = @23
                                                  local.get 5
                                                  i64.load offset=40
                                                  local.tee 32
                                                  i64.const 0
                                                  i64.ne
                                                  br_if 0 (;@23;)
                                                  i32.const 0
                                                  local.set 25
                                                  local.get 24
                                                  br_if 0 (;@23;)
                                                  local.get 16
                                                  local.set 20
                                                  local.get 16
                                                  local.set 19
                                                  br 17 (;@6;)
                                                end
                                                local.get 24
                                                local.get 16
                                                local.get 20
                                                i32.sub
                                                local.get 32
                                                i64.eqz
                                                i32.add
                                                local.tee 19
                                                local.get 24
                                                local.get 19
                                                i32.gt_s
                                                select
                                                local.set 25
                                                local.get 16
                                                local.set 19
                                                br 16 (;@6;)
                                              end
                                              local.get 5
                                              i32.load8_u offset=40
                                              local.set 19
                                              br 14 (;@7;)
                                            end
                                            local.get 6
                                            i32.load
                                            call $strerror
                                            local.set 20
                                            br 1 (;@19;)
                                          end
                                          local.get 5
                                          i32.load offset=40
                                          local.tee 19
                                          i32.const 1491
                                          local.get 19
                                          select
                                          local.set 20
                                        end
                                        local.get 20
                                        local.get 20
                                        local.get 24
                                        i32.const 2147483647
                                        local.get 24
                                        i32.const 2147483647
                                        i32.lt_u
                                        select
                                        call $strnlen
                                        local.tee 25
                                        i32.add
                                        local.set 19
                                        i32.const 0
                                        local.set 23
                                        i32.const 1190
                                        local.set 31
                                        local.get 24
                                        i32.const -1
                                        i32.gt_s
                                        br_if 12 (;@6;)
                                        local.get 19
                                        i32.load8_u
                                        i32.eqz
                                        br_if 12 (;@6;)
                                        br 14 (;@4;)
                                      end
                                      local.get 5
                                      i64.load offset=40
                                      local.tee 32
                                      i64.eqz
                                      i32.eqz
                                      br_if 1 (;@16;)
                                      i32.const 0
                                      local.set 19
                                      br 10 (;@7;)
                                    end
                                    block  ;; label = @17
                                      local.get 24
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.load offset=40
                                      local.set 22
                                      br 2 (;@15;)
                                    end
                                    i32.const 0
                                    local.set 19
                                    local.get 0
                                    i32.const 32
                                    local.get 26
                                    i32.const 0
                                    local.get 29
                                    call $pad
                                    br 2 (;@14;)
                                  end
                                  local.get 5
                                  i32.const 0
                                  i32.store offset=12
                                  local.get 5
                                  local.get 32
                                  i64.store32 offset=8
                                  local.get 5
                                  local.get 5
                                  i32.const 8
                                  i32.add
                                  i32.store offset=40
                                  local.get 5
                                  i32.const 8
                                  i32.add
                                  local.set 22
                                  i32.const -1
                                  local.set 24
                                end
                                i32.const 0
                                local.set 19
                                local.get 22
                                local.set 20
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 20
                                    i32.load
                                    local.tee 21
                                    i32.eqz
                                    br_if 1 (;@15;)
                                    local.get 5
                                    i32.const 4
                                    i32.add
                                    local.get 21
                                    call $wctomb
                                    local.tee 21
                                    i32.const 0
                                    i32.lt_s
                                    br_if 14 (;@2;)
                                    local.get 21
                                    local.get 24
                                    local.get 19
                                    i32.sub
                                    i32.gt_u
                                    br_if 1 (;@15;)
                                    local.get 20
                                    i32.const 4
                                    i32.add
                                    local.set 20
                                    local.get 21
                                    local.get 19
                                    i32.add
                                    local.tee 19
                                    local.get 24
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 19
                                i32.const 0
                                i32.lt_s
                                br_if 10 (;@4;)
                                local.get 0
                                i32.const 32
                                local.get 26
                                local.get 19
                                local.get 29
                                call $pad
                                block  ;; label = @15
                                  local.get 19
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 19
                                  br 1 (;@14;)
                                end
                                i32.const 0
                                local.set 20
                                loop  ;; label = @15
                                  local.get 22
                                  i32.load
                                  local.tee 21
                                  i32.eqz
                                  br_if 1 (;@14;)
                                  local.get 5
                                  i32.const 4
                                  i32.add
                                  local.get 21
                                  call $wctomb
                                  local.tee 21
                                  local.get 20
                                  i32.add
                                  local.tee 20
                                  local.get 19
                                  i32.gt_u
                                  br_if 1 (;@14;)
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 4
                                    i32.add
                                    local.get 21
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 22
                                  i32.const 4
                                  i32.add
                                  local.set 22
                                  local.get 20
                                  local.get 19
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.const 32
                              local.get 26
                              local.get 19
                              local.get 29
                              i32.const 8192
                              i32.xor
                              call $pad
                              local.get 26
                              local.get 19
                              local.get 26
                              local.get 19
                              i32.gt_s
                              select
                              local.set 19
                              br 8 (;@5;)
                            end
                            local.get 27
                            local.get 24
                            i32.const 0
                            i32.lt_s
                            local.tee 19
                            i32.and
                            br_if 8 (;@4;)
                            local.get 5
                            f64.load offset=40
                            local.set 34
                            local.get 5
                            i32.const 0
                            i32.store offset=92
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 34
                                i64.reinterpret_f64
                                i64.const -1
                                i64.gt_s
                                br_if 0 (;@14;)
                                local.get 34
                                f64.neg
                                local.set 34
                                i32.const 1
                                local.set 35
                                i32.const 0
                                local.set 36
                                i32.const 1200
                                local.set 37
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 29
                                i32.const 2048
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 1
                                local.set 35
                                i32.const 0
                                local.set 36
                                i32.const 1203
                                local.set 37
                                br 1 (;@13;)
                              end
                              i32.const 1206
                              i32.const 1201
                              local.get 29
                              i32.const 1
                              i32.and
                              local.tee 35
                              select
                              local.set 37
                              local.get 35
                              i32.eqz
                              local.set 36
                            end
                            block  ;; label = @13
                              local.get 34
                              f64.const inf (;=inf;)
                              f64.lt
                              br_if 0 (;@13;)
                              local.get 35
                              i32.const 3
                              i32.add
                              local.set 20
                              block  ;; label = @14
                                local.get 29
                                i32.const 8192
                                i32.and
                                br_if 0 (;@14;)
                                local.get 26
                                local.get 20
                                i32.le_u
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  local.get 26
                                  local.get 20
                                  i32.sub
                                  local.tee 19
                                  i32.const 256
                                  local.get 19
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 21
                                  select
                                  local.tee 22
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.const 608
                                  i32.add
                                  i32.const 32
                                  local.get 22
                                  memory.fill
                                end
                                block  ;; label = @15
                                  local.get 21
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 608
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 19
                                    i32.const -256
                                    i32.add
                                    local.tee 19
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 0
                                  i32.load
                                  local.set 23
                                end
                                local.get 23
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 608
                                i32.add
                                local.get 19
                                local.get 0
                                call $__fwritex
                                drop
                                local.get 0
                                i32.load
                                local.set 23
                              end
                              block  ;; label = @14
                                local.get 23
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 37
                                local.get 35
                                local.get 0
                                call $__fwritex
                                drop
                                local.get 0
                                i32.load
                                local.set 23
                              end
                              block  ;; label = @14
                                local.get 23
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                i32.const 1242
                                i32.const 1481
                                local.get 30
                                i32.const 32
                                i32.and
                                local.tee 19
                                select
                                i32.const 1246
                                i32.const 1485
                                local.get 19
                                select
                                local.get 34
                                local.get 34
                                f64.ne
                                select
                                i32.const 3
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              block  ;; label = @14
                                local.get 29
                                i32.const 73728
                                i32.and
                                i32.const 8192
                                i32.ne
                                br_if 0 (;@14;)
                                local.get 26
                                local.get 20
                                i32.le_u
                                br_if 0 (;@14;)
                                block  ;; label = @15
                                  local.get 26
                                  local.get 20
                                  i32.sub
                                  local.tee 19
                                  i32.const 256
                                  local.get 19
                                  i32.const 256
                                  i32.lt_u
                                  local.tee 21
                                  select
                                  local.tee 22
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.const 608
                                  i32.add
                                  i32.const 32
                                  local.get 22
                                  memory.fill
                                end
                                block  ;; label = @15
                                  local.get 21
                                  br_if 0 (;@15;)
                                  loop  ;; label = @16
                                    block  ;; label = @17
                                      local.get 0
                                      i32.load8_u
                                      i32.const 32
                                      i32.and
                                      br_if 0 (;@17;)
                                      local.get 5
                                      i32.const 608
                                      i32.add
                                      i32.const 256
                                      local.get 0
                                      call $__fwritex
                                      drop
                                    end
                                    local.get 19
                                    i32.const -256
                                    i32.add
                                    local.tee 19
                                    i32.const 255
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 608
                                i32.add
                                local.get 19
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 26
                              local.get 20
                              local.get 26
                              local.get 20
                              i32.gt_u
                              select
                              local.set 19
                              br 8 (;@5;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 34
                                  local.get 5
                                  i32.const 92
                                  i32.add
                                  call $frexp
                                  local.tee 34
                                  local.get 34
                                  f64.add
                                  local.tee 34
                                  f64.const 0x0p+0 (;=0;)
                                  f64.eq
                                  br_if 0 (;@15;)
                                  local.get 5
                                  local.get 5
                                  i32.load offset=92
                                  local.tee 20
                                  i32.const -1
                                  i32.add
                                  i32.store offset=92
                                  local.get 30
                                  i32.const 32
                                  i32.or
                                  local.tee 38
                                  i32.const 97
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 7 (;@8;)
                                end
                                local.get 30
                                i32.const 32
                                i32.or
                                local.tee 38
                                i32.const 97
                                i32.eq
                                br_if 6 (;@8;)
                                i32.const 6
                                local.get 24
                                local.get 19
                                select
                                local.set 23
                                local.get 5
                                i32.load offset=92
                                local.set 22
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 20
                              i32.const -29
                              i32.add
                              local.tee 22
                              i32.store offset=92
                              i32.const 6
                              local.get 24
                              local.get 19
                              select
                              local.set 23
                              local.get 34
                              f64.const 0x1p+28 (;=2.68435e+08;)
                              f64.mul
                              local.set 34
                            end
                            local.get 5
                            i32.const 96
                            i32.add
                            i32.const 0
                            i32.const 288
                            local.get 22
                            i32.const 0
                            i32.lt_s
                            local.tee 39
                            select
                            i32.add
                            local.tee 31
                            local.set 20
                            loop  ;; label = @13
                              local.get 20
                              local.get 34
                              i32.trunc_sat_f64_u
                              local.tee 19
                              i32.store
                              local.get 20
                              i32.const 4
                              i32.add
                              local.set 20
                              local.get 34
                              local.get 19
                              f64.convert_i32_u
                              f64.sub
                              f64.const 0x1.dcd65p+29 (;=1e+09;)
                              f64.mul
                              local.tee 34
                              f64.const 0x0p+0 (;=0;)
                              f64.ne
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 22
                                i32.const 1
                                i32.ge_s
                                br_if 0 (;@14;)
                                local.get 20
                                local.set 19
                                local.get 31
                                local.set 21
                                br 1 (;@13;)
                              end
                              local.get 31
                              local.set 21
                              loop  ;; label = @14
                                local.get 22
                                i32.const 29
                                local.get 22
                                i32.const 29
                                i32.lt_u
                                select
                                local.set 22
                                block  ;; label = @15
                                  local.get 20
                                  i32.const -4
                                  i32.add
                                  local.tee 19
                                  local.get 21
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 22
                                  i64.extend_i32_u
                                  local.set 40
                                  i64.const 0
                                  local.set 32
                                  loop  ;; label = @16
                                    local.get 19
                                    local.get 19
                                    i64.load32_u
                                    local.get 40
                                    i64.shl
                                    local.get 32
                                    i64.add
                                    local.tee 33
                                    local.get 33
                                    i64.const 1000000000
                                    i64.div_u
                                    local.tee 32
                                    i64.const 1000000000
                                    i64.mul
                                    i64.sub
                                    i64.store32
                                    local.get 19
                                    i32.const -4
                                    i32.add
                                    local.tee 19
                                    local.get 21
                                    i32.ge_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 33
                                  i64.const 1000000000
                                  i64.lt_u
                                  br_if 0 (;@15;)
                                  local.get 21
                                  i32.const -4
                                  i32.add
                                  local.tee 21
                                  local.get 32
                                  i64.store32
                                end
                                block  ;; label = @15
                                  loop  ;; label = @16
                                    local.get 20
                                    local.tee 19
                                    local.get 21
                                    i32.le_u
                                    br_if 1 (;@15;)
                                    local.get 19
                                    i32.const -4
                                    i32.add
                                    local.tee 20
                                    i32.load
                                    i32.eqz
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 5
                                local.get 5
                                i32.load offset=92
                                local.get 22
                                i32.sub
                                local.tee 22
                                i32.store offset=92
                                local.get 19
                                local.set 20
                                local.get 22
                                i32.const 0
                                i32.gt_s
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 22
                              i32.const -1
                              i32.gt_s
                              br_if 0 (;@13;)
                              local.get 23
                              i32.const 25
                              i32.add
                              i32.const 9
                              i32.div_u
                              i32.const 1
                              i32.add
                              local.set 41
                              local.get 38
                              i32.const 102
                              i32.eq
                              local.set 42
                              loop  ;; label = @14
                                i32.const 0
                                local.get 22
                                i32.sub
                                local.tee 20
                                i32.const 9
                                local.get 20
                                i32.const 9
                                i32.lt_u
                                select
                                local.set 24
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 21
                                    local.get 19
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    i32.const 4
                                    local.get 21
                                    i32.load
                                    select
                                    local.set 20
                                    br 1 (;@15;)
                                  end
                                  i32.const 1000000000
                                  local.get 24
                                  i32.shr_u
                                  local.set 28
                                  i32.const -1
                                  local.get 24
                                  i32.shl
                                  i32.const -1
                                  i32.xor
                                  local.set 27
                                  i32.const 0
                                  local.set 22
                                  local.get 21
                                  local.set 20
                                  loop  ;; label = @16
                                    local.get 20
                                    local.get 20
                                    i32.load
                                    local.tee 25
                                    local.get 24
                                    i32.shr_u
                                    local.get 22
                                    i32.add
                                    i32.store
                                    local.get 25
                                    local.get 27
                                    i32.and
                                    local.get 28
                                    i32.mul
                                    local.set 22
                                    local.get 20
                                    i32.const 4
                                    i32.add
                                    local.tee 20
                                    local.get 19
                                    i32.lt_u
                                    br_if 0 (;@16;)
                                  end
                                  i32.const 0
                                  i32.const 4
                                  local.get 21
                                  i32.load
                                  select
                                  local.set 20
                                  local.get 22
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 19
                                  local.get 22
                                  i32.store
                                  local.get 19
                                  i32.const 4
                                  i32.add
                                  local.set 19
                                end
                                local.get 5
                                local.get 5
                                i32.load offset=92
                                local.get 24
                                i32.add
                                local.tee 22
                                i32.store offset=92
                                local.get 31
                                local.get 21
                                local.get 20
                                i32.add
                                local.tee 21
                                local.get 42
                                select
                                local.tee 20
                                local.get 41
                                i32.const 2
                                i32.shl
                                i32.add
                                local.get 19
                                local.get 19
                                local.get 20
                                i32.sub
                                i32.const 2
                                i32.shr_s
                                local.get 41
                                i32.gt_s
                                select
                                local.set 19
                                local.get 22
                                i32.const 0
                                i32.lt_s
                                br_if 0 (;@14;)
                              end
                            end
                            i32.const 0
                            local.set 25
                            block  ;; label = @13
                              local.get 21
                              local.get 19
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 31
                              local.get 21
                              i32.sub
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              local.set 25
                              local.get 21
                              i32.load
                              local.tee 22
                              i32.const 10
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 10
                              local.set 20
                              loop  ;; label = @14
                                local.get 25
                                i32.const 1
                                i32.add
                                local.set 25
                                local.get 22
                                local.get 20
                                i32.const 10
                                i32.mul
                                local.tee 20
                                i32.ge_u
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 23
                              i32.const 0
                              local.get 25
                              local.get 38
                              i32.const 102
                              i32.eq
                              select
                              i32.sub
                              local.get 23
                              i32.const 0
                              i32.ne
                              local.get 38
                              i32.const 103
                              i32.eq
                              local.tee 27
                              i32.and
                              i32.sub
                              local.tee 20
                              local.get 19
                              local.get 31
                              i32.sub
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              i32.const -9
                              i32.add
                              i32.ge_s
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 96
                              i32.add
                              i32.const -4092
                              i32.const -3804
                              local.get 39
                              select
                              local.tee 38
                              i32.add
                              local.get 20
                              i32.const 9216
                              i32.add
                              local.tee 22
                              i32.const 9
                              i32.div_s
                              local.tee 24
                              i32.const 2
                              i32.shl
                              local.tee 39
                              i32.add
                              local.set 28
                              i32.const 10
                              local.set 20
                              block  ;; label = @14
                                local.get 22
                                local.get 24
                                i32.const 9
                                i32.mul
                                i32.sub
                                local.tee 24
                                i32.const 7
                                i32.gt_s
                                br_if 0 (;@14;)
                                i32.const 8
                                local.get 24
                                i32.sub
                                local.tee 41
                                i32.const 7
                                i32.and
                                local.set 22
                                i32.const 10
                                local.set 20
                                block  ;; label = @15
                                  local.get 24
                                  i32.const -1
                                  i32.add
                                  i32.const 7
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 41
                                  i32.const -8
                                  i32.and
                                  local.set 24
                                  i32.const 10
                                  local.set 20
                                  loop  ;; label = @16
                                    local.get 20
                                    i32.const 100000000
                                    i32.mul
                                    local.set 20
                                    local.get 24
                                    i32.const -8
                                    i32.add
                                    local.tee 24
                                    br_if 0 (;@16;)
                                  end
                                end
                                local.get 22
                                i32.eqz
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  local.get 20
                                  i32.const 10
                                  i32.mul
                                  local.set 20
                                  local.get 22
                                  i32.const -1
                                  i32.add
                                  local.tee 22
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 28
                              i32.const 4
                              i32.add
                              local.set 41
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 28
                                  i32.load
                                  local.tee 22
                                  local.get 22
                                  local.get 20
                                  i32.div_u
                                  local.tee 42
                                  local.get 20
                                  i32.mul
                                  i32.sub
                                  local.tee 24
                                  br_if 0 (;@15;)
                                  local.get 41
                                  local.get 19
                                  i32.eq
                                  br_if 1 (;@14;)
                                end
                                block  ;; label = @15
                                  block  ;; label = @16
                                    local.get 42
                                    i32.const 1
                                    i32.and
                                    br_if 0 (;@16;)
                                    f64.const 0x1p+53 (;=9.0072e+15;)
                                    local.set 34
                                    local.get 20
                                    i32.const 1000000000
                                    i32.ne
                                    br_if 1 (;@15;)
                                    local.get 28
                                    local.get 21
                                    i32.le_u
                                    br_if 1 (;@15;)
                                    local.get 28
                                    i32.const -4
                                    i32.add
                                    i32.load8_u
                                    i32.const 1
                                    i32.and
                                    i32.eqz
                                    br_if 1 (;@15;)
                                  end
                                  f64.const 0x1.0000000000001p+53 (;=9.0072e+15;)
                                  local.set 34
                                end
                                f64.const 0x1p-1 (;=0.5;)
                                f64.const 0x1p+0 (;=1;)
                                f64.const 0x1.8p+0 (;=1.5;)
                                local.get 41
                                local.get 19
                                i32.eq
                                select
                                f64.const 0x1.8p+0 (;=1.5;)
                                local.get 24
                                local.get 20
                                i32.const 1
                                i32.shr_u
                                local.tee 41
                                i32.eq
                                select
                                local.get 24
                                local.get 41
                                i32.lt_u
                                select
                                local.set 43
                                block  ;; label = @15
                                  local.get 36
                                  br_if 0 (;@15;)
                                  local.get 37
                                  i32.load8_u
                                  i32.const 45
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 43
                                  f64.neg
                                  local.set 43
                                  local.get 34
                                  f64.neg
                                  local.set 34
                                end
                                local.get 28
                                local.get 22
                                local.get 24
                                i32.sub
                                local.tee 22
                                i32.store
                                local.get 34
                                local.get 43
                                f64.add
                                local.get 34
                                f64.eq
                                br_if 0 (;@14;)
                                local.get 28
                                local.get 22
                                local.get 20
                                i32.add
                                local.tee 20
                                i32.store
                                block  ;; label = @15
                                  local.get 20
                                  i32.const 1000000000
                                  i32.lt_u
                                  br_if 0 (;@15;)
                                  local.get 8
                                  local.get 38
                                  local.get 39
                                  i32.add
                                  i32.add
                                  local.set 20
                                  loop  ;; label = @16
                                    local.get 20
                                    i32.const 4
                                    i32.add
                                    i32.const 0
                                    i32.store
                                    block  ;; label = @17
                                      local.get 20
                                      local.get 21
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 21
                                      i32.const -4
                                      i32.add
                                      local.tee 21
                                      i32.const 0
                                      i32.store
                                    end
                                    local.get 20
                                    local.get 20
                                    i32.load
                                    i32.const 1
                                    i32.add
                                    local.tee 22
                                    i32.store
                                    local.get 20
                                    i32.const -4
                                    i32.add
                                    local.set 20
                                    local.get 22
                                    i32.const 999999999
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                  end
                                  local.get 20
                                  i32.const 4
                                  i32.add
                                  local.set 28
                                end
                                local.get 31
                                local.get 21
                                i32.sub
                                i32.const 2
                                i32.shr_s
                                i32.const 9
                                i32.mul
                                local.set 25
                                local.get 21
                                i32.load
                                local.tee 22
                                i32.const 10
                                i32.lt_u
                                br_if 0 (;@14;)
                                i32.const 10
                                local.set 20
                                loop  ;; label = @15
                                  local.get 25
                                  i32.const 1
                                  i32.add
                                  local.set 25
                                  local.get 22
                                  local.get 20
                                  i32.const 10
                                  i32.mul
                                  local.tee 20
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 28
                              i32.const 4
                              i32.add
                              local.tee 20
                              local.get 19
                              local.get 19
                              local.get 20
                              i32.gt_u
                              select
                              local.set 19
                            end
                            local.get 19
                            local.get 31
                            i32.sub
                            local.set 20
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 20
                                local.set 22
                                local.get 19
                                local.tee 28
                                local.get 21
                                i32.le_u
                                local.tee 24
                                br_if 1 (;@13;)
                                local.get 22
                                i32.const -4
                                i32.add
                                local.set 20
                                local.get 28
                                i32.const -4
                                i32.add
                                local.tee 19
                                i32.load
                                i32.eqz
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 27
                                br_if 0 (;@14;)
                                local.get 29
                                i32.const 8
                                i32.and
                                local.set 41
                                br 1 (;@13;)
                              end
                              local.get 25
                              i32.const -1
                              i32.xor
                              i32.const -1
                              local.get 23
                              i32.const 1
                              local.get 23
                              select
                              local.tee 19
                              local.get 25
                              i32.gt_s
                              local.get 25
                              i32.const -5
                              i32.gt_s
                              i32.and
                              local.tee 20
                              select
                              local.get 19
                              i32.add
                              local.set 23
                              i32.const -1
                              i32.const -2
                              local.get 20
                              select
                              local.get 30
                              i32.add
                              local.set 30
                              local.get 29
                              i32.const 8
                              i32.and
                              local.tee 41
                              br_if 0 (;@13;)
                              i32.const -9
                              local.set 19
                              block  ;; label = @14
                                local.get 24
                                br_if 0 (;@14;)
                                local.get 28
                                i32.const -4
                                i32.add
                                i32.load
                                local.tee 24
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 19
                                local.get 24
                                i32.const 10
                                i32.rem_u
                                br_if 0 (;@14;)
                                i32.const 10
                                local.set 20
                                i32.const 0
                                local.set 19
                                loop  ;; label = @15
                                  local.get 19
                                  i32.const -1
                                  i32.add
                                  local.set 19
                                  local.get 24
                                  local.get 20
                                  i32.const 10
                                  i32.mul
                                  local.tee 20
                                  i32.rem_u
                                  i32.eqz
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 22
                              i32.const 2
                              i32.shr_s
                              i32.const 9
                              i32.mul
                              local.set 20
                              block  ;; label = @14
                                local.get 30
                                i32.const -33
                                i32.and
                                i32.const 70
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 41
                                local.get 23
                                local.get 20
                                local.get 19
                                i32.add
                                i32.const -9
                                i32.add
                                local.tee 19
                                i32.const 0
                                local.get 19
                                i32.const 0
                                i32.gt_s
                                select
                                local.tee 19
                                local.get 23
                                local.get 19
                                i32.lt_s
                                select
                                local.set 23
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 41
                              local.get 23
                              local.get 25
                              local.get 20
                              i32.add
                              local.get 19
                              i32.add
                              i32.const -9
                              i32.add
                              local.tee 19
                              i32.const 0
                              local.get 19
                              i32.const 0
                              i32.gt_s
                              select
                              local.tee 19
                              local.get 23
                              local.get 19
                              i32.lt_s
                              select
                              local.set 23
                            end
                            local.get 23
                            i32.const 2147483645
                            i32.const 2147483646
                            local.get 23
                            local.get 41
                            i32.or
                            local.tee 38
                            select
                            i32.gt_s
                            br_if 8 (;@4;)
                            local.get 23
                            local.get 38
                            i32.const 0
                            i32.ne
                            i32.add
                            i32.const 1
                            i32.add
                            local.set 42
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 30
                                i32.const -33
                                i32.and
                                i32.const 70
                                i32.ne
                                local.tee 39
                                br_if 0 (;@14;)
                                local.get 25
                                local.get 42
                                i32.const 2147483647
                                i32.xor
                                i32.gt_s
                                br_if 10 (;@4;)
                                local.get 25
                                i32.const 0
                                local.get 25
                                i32.const 0
                                i32.gt_s
                                select
                                local.set 19
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 25
                                  br_if 0 (;@15;)
                                  local.get 7
                                  local.set 22
                                  local.get 7
                                  local.set 20
                                  br 1 (;@14;)
                                end
                                local.get 25
                                local.get 25
                                i32.const 31
                                i32.shr_s
                                local.tee 19
                                i32.xor
                                local.get 19
                                i32.sub
                                local.set 19
                                local.get 7
                                local.set 22
                                local.get 7
                                local.set 20
                                loop  ;; label = @15
                                  local.get 20
                                  i32.const -1
                                  i32.add
                                  local.tee 20
                                  local.get 19
                                  local.get 19
                                  i32.const 10
                                  i32.div_u
                                  local.tee 24
                                  i32.const 10
                                  i32.mul
                                  i32.sub
                                  i32.const 48
                                  i32.or
                                  i32.store8
                                  local.get 22
                                  i32.const -1
                                  i32.add
                                  local.set 22
                                  local.get 19
                                  i32.const 9
                                  i32.gt_u
                                  local.set 27
                                  local.get 24
                                  local.set 19
                                  local.get 27
                                  br_if 0 (;@15;)
                                end
                              end
                              block  ;; label = @14
                                local.get 7
                                local.get 22
                                i32.sub
                                i32.const 1
                                i32.gt_s
                                br_if 0 (;@14;)
                                local.get 20
                                local.get 15
                                local.get 22
                                i32.sub
                                i32.add
                                local.set 20
                                local.get 22
                                local.get 5
                                i32.const 52
                                i32.add
                                i32.sub
                                i32.const -10
                                i32.add
                                local.tee 19
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 20
                                i32.const 48
                                local.get 19
                                memory.fill
                              end
                              local.get 20
                              i32.const -2
                              i32.add
                              local.tee 36
                              local.get 30
                              i32.store8
                              local.get 20
                              i32.const -1
                              i32.add
                              i32.const 45
                              i32.const 43
                              local.get 25
                              i32.const 0
                              i32.lt_s
                              select
                              i32.store8
                              local.get 7
                              local.get 36
                              i32.sub
                              local.tee 19
                              local.get 42
                              i32.const 2147483647
                              i32.xor
                              i32.gt_s
                              br_if 9 (;@4;)
                            end
                            local.get 19
                            local.get 42
                            i32.add
                            local.tee 19
                            local.get 35
                            i32.const 2147483647
                            i32.xor
                            i32.gt_s
                            br_if 8 (;@4;)
                            local.get 19
                            local.get 35
                            i32.add
                            local.set 27
                            block  ;; label = @13
                              local.get 29
                              i32.const 73728
                              i32.and
                              local.tee 29
                              br_if 0 (;@13;)
                              local.get 26
                              local.get 27
                              i32.le_s
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 26
                                local.get 27
                                i32.sub
                                local.tee 19
                                i32.const 256
                                local.get 19
                                i32.const 256
                                i32.lt_u
                                local.tee 20
                                select
                                local.tee 22
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 608
                                i32.add
                                i32.const 32
                                local.get 22
                                memory.fill
                              end
                              block  ;; label = @14
                                local.get 20
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 608
                                    i32.add
                                    i32.const 256
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 19
                                  i32.const -256
                                  i32.add
                                  local.tee 19
                                  i32.const 255
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 608
                              i32.add
                              local.get 19
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 37
                              local.get 35
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              local.get 29
                              i32.const 65536
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 26
                              local.get 27
                              i32.le_s
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 26
                                local.get 27
                                i32.sub
                                local.tee 19
                                i32.const 256
                                local.get 19
                                i32.const 256
                                i32.lt_u
                                local.tee 20
                                select
                                local.tee 22
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 608
                                i32.add
                                i32.const 48
                                local.get 22
                                memory.fill
                              end
                              block  ;; label = @14
                                local.get 20
                                br_if 0 (;@14;)
                                loop  ;; label = @15
                                  block  ;; label = @16
                                    local.get 0
                                    i32.load8_u
                                    i32.const 32
                                    i32.and
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 608
                                    i32.add
                                    i32.const 256
                                    local.get 0
                                    call $__fwritex
                                    drop
                                  end
                                  local.get 19
                                  i32.const -256
                                  i32.add
                                  local.tee 19
                                  i32.const 255
                                  i32.gt_u
                                  br_if 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 608
                              i32.add
                              local.get 19
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 39
                            br_if 2 (;@10;)
                            local.get 31
                            local.get 21
                            local.get 21
                            local.get 31
                            i32.gt_u
                            select
                            local.tee 25
                            local.set 24
                            loop  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 24
                                      i32.load
                                      local.tee 19
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      i32.const 8
                                      local.set 20
                                      loop  ;; label = @18
                                        local.get 5
                                        i32.const 64
                                        i32.add
                                        local.get 20
                                        i32.add
                                        local.get 19
                                        local.get 19
                                        i32.const 10
                                        i32.div_u
                                        local.tee 21
                                        i32.const 10
                                        i32.mul
                                        i32.sub
                                        i32.const 48
                                        i32.or
                                        i32.store8
                                        local.get 20
                                        i32.const -1
                                        i32.add
                                        local.set 20
                                        local.get 19
                                        i32.const 9
                                        i32.gt_u
                                        local.set 22
                                        local.get 21
                                        local.set 19
                                        local.get 22
                                        br_if 0 (;@18;)
                                      end
                                      local.get 20
                                      i32.const 1
                                      i32.add
                                      local.tee 21
                                      local.get 5
                                      i32.const 64
                                      i32.add
                                      i32.add
                                      local.set 19
                                      block  ;; label = @18
                                        local.get 24
                                        local.get 25
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 20
                                        i32.const 2
                                        i32.add
                                        i32.const 2
                                        i32.lt_s
                                        br_if 4 (;@14;)
                                        br 3 (;@15;)
                                      end
                                      local.get 20
                                      i32.const 8
                                      i32.ne
                                      br_if 3 (;@14;)
                                      br 1 (;@16;)
                                    end
                                    i32.const 9
                                    local.set 21
                                    local.get 24
                                    local.get 25
                                    i32.ne
                                    br_if 1 (;@15;)
                                  end
                                  local.get 5
                                  i32.const 48
                                  i32.store8 offset=72
                                  local.get 13
                                  local.set 19
                                  br 1 (;@14;)
                                end
                                local.get 21
                                local.get 5
                                i32.const 64
                                i32.add
                                i32.add
                                local.get 5
                                i32.const 64
                                i32.add
                                local.get 12
                                local.get 21
                                i32.add
                                local.tee 19
                                local.get 5
                                i32.const 64
                                i32.add
                                local.get 19
                                i32.lt_u
                                select
                                local.tee 19
                                i32.sub
                                local.tee 20
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 19
                                i32.const 48
                                local.get 20
                                memory.fill
                              end
                              block  ;; label = @14
                                local.get 0
                                i32.load8_u
                                i32.const 32
                                i32.and
                                br_if 0 (;@14;)
                                local.get 19
                                local.get 14
                                local.get 19
                                i32.sub
                                local.get 0
                                call $__fwritex
                                drop
                              end
                              local.get 24
                              i32.const 4
                              i32.add
                              local.tee 24
                              local.get 31
                              i32.le_u
                              br_if 0 (;@13;)
                            end
                            block  ;; label = @13
                              local.get 38
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 1489
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 23
                                i32.const 1
                                i32.ge_s
                                br_if 0 (;@14;)
                                local.get 23
                                local.set 19
                                br 1 (;@13;)
                              end
                              block  ;; label = @14
                                local.get 24
                                local.get 28
                                i32.lt_u
                                br_if 0 (;@14;)
                                local.get 23
                                local.set 19
                                br 1 (;@13;)
                              end
                              loop  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      local.get 24
                                      i32.load
                                      local.tee 19
                                      br_if 0 (;@17;)
                                      local.get 14
                                      local.set 20
                                      local.get 14
                                      local.set 21
                                      br 1 (;@16;)
                                    end
                                    local.get 14
                                    local.set 21
                                    local.get 14
                                    local.set 20
                                    loop  ;; label = @17
                                      local.get 20
                                      i32.const -1
                                      i32.add
                                      local.tee 20
                                      local.get 19
                                      local.get 19
                                      i32.const 10
                                      i32.div_u
                                      local.tee 22
                                      i32.const 10
                                      i32.mul
                                      i32.sub
                                      i32.const 48
                                      i32.or
                                      i32.store8
                                      local.get 21
                                      i32.const -1
                                      i32.add
                                      local.set 21
                                      local.get 19
                                      i32.const 9
                                      i32.gt_u
                                      local.set 25
                                      local.get 22
                                      local.set 19
                                      local.get 25
                                      br_if 0 (;@17;)
                                    end
                                    local.get 20
                                    local.get 5
                                    i32.const 64
                                    i32.add
                                    i32.le_u
                                    br_if 1 (;@15;)
                                  end
                                  local.get 20
                                  local.get 5
                                  i32.const 64
                                  i32.add
                                  i32.add
                                  local.get 21
                                  i32.sub
                                  local.set 20
                                  local.get 21
                                  local.get 5
                                  i32.const 64
                                  i32.add
                                  i32.sub
                                  local.tee 19
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 20
                                  i32.const 48
                                  local.get 19
                                  memory.fill
                                end
                                block  ;; label = @15
                                  local.get 0
                                  i32.load8_u
                                  i32.const 32
                                  i32.and
                                  br_if 0 (;@15;)
                                  local.get 20
                                  local.get 23
                                  i32.const 9
                                  local.get 23
                                  i32.const 9
                                  i32.lt_u
                                  select
                                  local.get 0
                                  call $__fwritex
                                  drop
                                end
                                local.get 23
                                i32.const -9
                                i32.add
                                local.set 19
                                local.get 24
                                i32.const 4
                                i32.add
                                local.tee 24
                                local.get 28
                                i32.ge_u
                                br_if 1 (;@13;)
                                local.get 23
                                i32.const 9
                                i32.gt_s
                                local.set 20
                                local.get 19
                                local.set 23
                                local.get 20
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 0
                            i32.const 48
                            local.get 19
                            i32.const 9
                            i32.add
                            i32.const 9
                            i32.const 0
                            call $pad
                            br 3 (;@9;)
                          end
                          local.get 6
                          i32.const 28
                          i32.store
                          br 9 (;@2;)
                        end
                        i32.const 0
                        local.set 23
                        i32.const 1190
                        local.set 31
                        local.get 16
                        local.set 19
                        local.get 29
                        local.set 28
                        local.get 24
                        local.set 25
                        br 4 (;@6;)
                      end
                      block  ;; label = @10
                        local.get 23
                        i32.const 0
                        i32.lt_s
                        br_if 0 (;@10;)
                        local.get 28
                        local.get 21
                        i32.const 4
                        i32.add
                        local.get 28
                        local.get 21
                        i32.gt_u
                        select
                        local.set 28
                        local.get 21
                        local.set 24
                        loop  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 24
                              i32.load
                              local.tee 19
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 14
                              local.set 20
                              loop  ;; label = @14
                                local.get 20
                                i32.const -1
                                i32.add
                                local.tee 20
                                local.get 19
                                local.get 19
                                i32.const 10
                                i32.div_u
                                local.tee 22
                                i32.const 10
                                i32.mul
                                i32.sub
                                i32.const 48
                                i32.or
                                i32.store8
                                local.get 19
                                i32.const 10
                                i32.lt_u
                                local.set 25
                                local.get 22
                                local.set 19
                                local.get 25
                                i32.eqz
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 5
                            i32.const 48
                            i32.store8 offset=72
                            local.get 13
                            local.set 20
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 24
                              local.get 21
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 20
                              local.get 5
                              i32.const 64
                              i32.add
                              i32.le_u
                              br_if 1 (;@12;)
                              block  ;; label = @14
                                local.get 20
                                local.get 5
                                i32.const 64
                                i32.add
                                i32.sub
                                local.tee 19
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 5
                                i32.const 64
                                i32.add
                                i32.const 48
                                local.get 19
                                memory.fill
                              end
                              local.get 5
                              i32.const 64
                              i32.add
                              local.set 20
                              br 1 (;@12;)
                            end
                            block  ;; label = @13
                              local.get 0
                              i32.load8_u
                              i32.const 32
                              i32.and
                              br_if 0 (;@13;)
                              local.get 20
                              i32.const 1
                              local.get 0
                              call $__fwritex
                              drop
                            end
                            local.get 20
                            i32.const 1
                            i32.add
                            local.set 20
                            local.get 23
                            local.get 41
                            i32.or
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 1489
                            i32.const 1
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 14
                          local.get 20
                          i32.sub
                          local.set 19
                          block  ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 20
                            local.get 19
                            local.get 23
                            local.get 19
                            local.get 23
                            i32.lt_s
                            select
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 23
                          local.get 19
                          i32.sub
                          local.set 23
                          local.get 24
                          i32.const 4
                          i32.add
                          local.tee 24
                          local.get 28
                          i32.ge_u
                          br_if 1 (;@10;)
                          local.get 23
                          i32.const -1
                          i32.gt_s
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.const 48
                      local.get 23
                      i32.const 18
                      i32.add
                      i32.const 18
                      i32.const 0
                      call $pad
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 36
                      local.get 7
                      local.get 36
                      i32.sub
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    block  ;; label = @9
                      local.get 29
                      i32.const 8192
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 26
                      local.get 27
                      i32.le_s
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 26
                        local.get 27
                        i32.sub
                        local.tee 19
                        i32.const 256
                        local.get 19
                        i32.const 256
                        i32.lt_u
                        local.tee 20
                        select
                        local.tee 21
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 5
                        i32.const 608
                        i32.add
                        i32.const 32
                        local.get 21
                        memory.fill
                      end
                      block  ;; label = @10
                        local.get 20
                        br_if 0 (;@10;)
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load8_u
                            i32.const 32
                            i32.and
                            br_if 0 (;@12;)
                            local.get 5
                            i32.const 608
                            i32.add
                            i32.const 256
                            local.get 0
                            call $__fwritex
                            drop
                          end
                          local.get 19
                          i32.const -256
                          i32.add
                          local.tee 19
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 608
                      i32.add
                      local.get 19
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 26
                    local.get 27
                    local.get 26
                    local.get 27
                    i32.gt_s
                    select
                    local.set 19
                    br 3 (;@5;)
                  end
                  local.get 37
                  local.get 30
                  i32.const 26
                  i32.shl
                  i32.const 31
                  i32.shr_s
                  i32.const 9
                  i32.and
                  i32.add
                  local.set 23
                  block  ;; label = @8
                    local.get 24
                    i32.const 11
                    i32.gt_u
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 12
                        local.get 24
                        i32.sub
                        local.tee 19
                        i32.const 7
                        i32.and
                        local.tee 20
                        br_if 0 (;@10;)
                        f64.const 0x1p+4 (;=16;)
                        local.set 43
                        br 1 (;@9;)
                      end
                      local.get 24
                      i32.const -12
                      i32.add
                      local.set 19
                      f64.const 0x1p+4 (;=16;)
                      local.set 43
                      loop  ;; label = @10
                        local.get 19
                        i32.const 1
                        i32.add
                        local.set 19
                        local.get 43
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 43
                        local.get 20
                        i32.const -1
                        i32.add
                        local.tee 20
                        br_if 0 (;@10;)
                      end
                      i32.const 0
                      local.get 19
                      i32.sub
                      local.set 19
                    end
                    block  ;; label = @9
                      local.get 24
                      i32.const 4
                      i32.gt_u
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        local.get 43
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        f64.const 0x1p+4 (;=16;)
                        f64.mul
                        local.set 43
                        local.get 19
                        i32.const -8
                        i32.add
                        local.tee 19
                        br_if 0 (;@10;)
                      end
                    end
                    block  ;; label = @9
                      local.get 23
                      i32.load8_u
                      i32.const 45
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 43
                      local.get 34
                      f64.neg
                      local.get 43
                      f64.sub
                      f64.add
                      f64.neg
                      local.set 34
                      br 1 (;@8;)
                    end
                    local.get 34
                    local.get 43
                    f64.add
                    local.get 43
                    f64.sub
                    local.set 34
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      i32.load offset=92
                      local.tee 25
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 25
                      local.get 25
                      i32.const 31
                      i32.shr_s
                      local.tee 19
                      i32.xor
                      local.get 19
                      i32.sub
                      local.set 19
                      local.get 7
                      local.set 20
                      loop  ;; label = @10
                        local.get 20
                        i32.const -1
                        i32.add
                        local.tee 20
                        local.get 19
                        local.get 19
                        i32.const 10
                        i32.div_u
                        local.tee 21
                        i32.const 10
                        i32.mul
                        i32.sub
                        i32.const 48
                        i32.or
                        i32.store8
                        local.get 19
                        i32.const 10
                        i32.lt_u
                        local.set 22
                        local.get 21
                        local.set 19
                        local.get 22
                        i32.eqz
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    local.get 5
                    i32.const 48
                    i32.store8 offset=63
                    local.get 11
                    local.set 20
                  end
                  local.get 35
                  i32.const 2
                  i32.or
                  local.set 28
                  local.get 30
                  i32.const 32
                  i32.and
                  local.set 21
                  local.get 20
                  i32.const -2
                  i32.add
                  local.tee 27
                  local.get 30
                  i32.const 15
                  i32.add
                  i32.store8
                  local.get 20
                  i32.const -1
                  i32.add
                  i32.const 45
                  i32.const 43
                  local.get 25
                  i32.const 0
                  i32.lt_s
                  select
                  i32.store8
                  local.get 29
                  i32.const 8
                  i32.and
                  i32.eqz
                  local.get 24
                  i32.const 1
                  i32.lt_s
                  i32.and
                  local.set 22
                  local.get 5
                  i32.const 64
                  i32.add
                  local.set 20
                  loop  ;; label = @8
                    local.get 20
                    local.tee 19
                    local.get 34
                    i32.trunc_sat_f64_s
                    local.tee 20
                    i32.const 3936
                    i32.add
                    i32.load8_u
                    local.get 21
                    i32.or
                    i32.store8
                    local.get 34
                    local.get 20
                    f64.convert_i32_s
                    f64.sub
                    f64.const 0x1p+4 (;=16;)
                    f64.mul
                    local.set 34
                    block  ;; label = @9
                      local.get 19
                      i32.const 1
                      i32.add
                      local.tee 20
                      local.get 5
                      i32.const 64
                      i32.add
                      i32.sub
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 22
                      local.get 34
                      f64.const 0x0p+0 (;=0;)
                      f64.eq
                      i32.and
                      br_if 0 (;@9;)
                      local.get 19
                      i32.const 46
                      i32.store8 offset=1
                      local.get 19
                      i32.const 2
                      i32.add
                      local.set 20
                    end
                    local.get 34
                    f64.const 0x0p+0 (;=0;)
                    f64.ne
                    br_if 0 (;@8;)
                  end
                  local.get 24
                  i32.const 2147483645
                  local.get 7
                  local.get 27
                  i32.sub
                  local.tee 31
                  local.get 28
                  i32.add
                  local.tee 19
                  i32.sub
                  i32.gt_s
                  br_if 3 (;@4;)
                  local.get 24
                  i32.const 2
                  i32.add
                  local.get 20
                  local.get 5
                  i32.const 64
                  i32.add
                  i32.sub
                  local.tee 21
                  local.get 21
                  i32.const -2
                  i32.add
                  local.get 24
                  i32.lt_s
                  select
                  local.get 21
                  local.get 24
                  select
                  local.tee 25
                  local.get 19
                  i32.add
                  local.set 20
                  block  ;; label = @8
                    local.get 29
                    i32.const 73728
                    i32.and
                    local.tee 22
                    br_if 0 (;@8;)
                    local.get 26
                    local.get 20
                    i32.le_s
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 26
                      local.get 20
                      i32.sub
                      local.tee 19
                      i32.const 256
                      local.get 19
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      local.tee 29
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 608
                      i32.add
                      i32.const 32
                      local.get 29
                      memory.fill
                    end
                    block  ;; label = @9
                      local.get 24
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 608
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 19
                        i32.const -256
                        i32.add
                        local.tee 19
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 608
                    i32.add
                    local.get 19
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 23
                    local.get 28
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 22
                    i32.const 65536
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 26
                    local.get 20
                    i32.le_s
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 26
                      local.get 20
                      i32.sub
                      local.tee 19
                      i32.const 256
                      local.get 19
                      i32.const 256
                      i32.lt_u
                      local.tee 24
                      select
                      local.tee 28
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 608
                      i32.add
                      i32.const 48
                      local.get 28
                      memory.fill
                    end
                    block  ;; label = @9
                      local.get 24
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 608
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 19
                        i32.const -256
                        i32.add
                        local.tee 19
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 608
                    i32.add
                    local.get 19
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 64
                    i32.add
                    local.get 21
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 25
                    local.get 21
                    i32.sub
                    local.tee 19
                    i32.const 1
                    i32.lt_s
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 19
                      i32.const 256
                      local.get 19
                      i32.const 256
                      i32.lt_u
                      local.tee 21
                      select
                      local.tee 25
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 608
                      i32.add
                      i32.const 48
                      local.get 25
                      memory.fill
                    end
                    block  ;; label = @9
                      local.get 21
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 608
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 19
                        i32.const -256
                        i32.add
                        local.tee 19
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 608
                    i32.add
                    local.get 19
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 27
                    local.get 31
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  block  ;; label = @8
                    local.get 22
                    i32.const 8192
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 26
                    local.get 20
                    i32.le_s
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      local.get 26
                      local.get 20
                      i32.sub
                      local.tee 19
                      i32.const 256
                      local.get 19
                      i32.const 256
                      i32.lt_u
                      local.tee 21
                      select
                      local.tee 22
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 608
                      i32.add
                      i32.const 32
                      local.get 22
                      memory.fill
                    end
                    block  ;; label = @9
                      local.get 21
                      br_if 0 (;@9;)
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.load8_u
                          i32.const 32
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          i32.const 608
                          i32.add
                          i32.const 256
                          local.get 0
                          call $__fwritex
                          drop
                        end
                        local.get 19
                        i32.const -256
                        i32.add
                        local.tee 19
                        i32.const 255
                        i32.gt_u
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 608
                    i32.add
                    local.get 19
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 26
                  local.get 20
                  local.get 26
                  local.get 20
                  i32.gt_s
                  select
                  local.set 19
                  br 2 (;@5;)
                end
                local.get 5
                local.get 19
                i32.store8 offset=39
                i32.const 0
                local.set 23
                i32.const 1190
                local.set 31
                i32.const 1
                local.set 25
                local.get 10
                local.set 20
                local.get 16
                local.set 19
              end
              local.get 25
              local.get 19
              local.get 20
              i32.sub
              local.tee 24
              local.get 25
              local.get 24
              i32.gt_s
              select
              local.tee 27
              local.get 23
              i32.const 2147483647
              i32.xor
              i32.gt_s
              br_if 1 (;@4;)
              local.get 26
              local.get 23
              local.get 27
              i32.add
              local.tee 22
              local.get 26
              local.get 22
              i32.gt_s
              select
              local.tee 19
              local.get 21
              i32.gt_u
              br_if 1 (;@4;)
              block  ;; label = @6
                local.get 28
                i32.const 73728
                i32.and
                local.tee 28
                br_if 0 (;@6;)
                local.get 26
                local.get 22
                i32.le_s
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 19
                  local.get 22
                  i32.sub
                  local.tee 21
                  i32.const 256
                  local.get 21
                  i32.const 256
                  i32.lt_u
                  local.tee 29
                  select
                  local.tee 41
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 96
                  i32.add
                  i32.const 32
                  local.get 41
                  memory.fill
                end
                block  ;; label = @7
                  local.get 29
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 96
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 21
                    i32.const -256
                    i32.add
                    local.tee 21
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 96
                i32.add
                local.get 21
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 31
                local.get 23
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 28
                i32.const 65536
                i32.ne
                br_if 0 (;@6;)
                local.get 26
                local.get 22
                i32.le_s
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 19
                  local.get 22
                  i32.sub
                  local.tee 21
                  i32.const 256
                  local.get 21
                  i32.const 256
                  i32.lt_u
                  local.tee 23
                  select
                  local.tee 31
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 96
                  i32.add
                  i32.const 48
                  local.get 31
                  memory.fill
                end
                block  ;; label = @7
                  local.get 23
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 96
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 21
                    i32.const -256
                    i32.add
                    local.tee 21
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 96
                i32.add
                local.get 21
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 25
                local.get 24
                i32.le_s
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 27
                  local.get 24
                  i32.sub
                  local.tee 21
                  i32.const 256
                  local.get 21
                  i32.const 256
                  i32.lt_u
                  local.tee 25
                  select
                  local.tee 27
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  i32.const 96
                  i32.add
                  i32.const 48
                  local.get 27
                  memory.fill
                end
                block  ;; label = @7
                  local.get 25
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load8_u
                      i32.const 32
                      i32.and
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 96
                      i32.add
                      i32.const 256
                      local.get 0
                      call $__fwritex
                      drop
                    end
                    local.get 21
                    i32.const -256
                    i32.add
                    local.tee 21
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 5
                i32.const 96
                i32.add
                local.get 21
                local.get 0
                call $__fwritex
                drop
              end
              block  ;; label = @6
                local.get 0
                i32.load8_u
                i32.const 32
                i32.and
                br_if 0 (;@6;)
                local.get 20
                local.get 24
                local.get 0
                call $__fwritex
                drop
              end
              local.get 28
              i32.const 8192
              i32.ne
              br_if 0 (;@5;)
              local.get 26
              local.get 22
              i32.le_s
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 19
                local.get 22
                i32.sub
                local.tee 20
                i32.const 256
                local.get 20
                i32.const 256
                i32.lt_u
                local.tee 21
                select
                local.tee 22
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                i32.const 96
                i32.add
                i32.const 32
                local.get 22
                memory.fill
              end
              block  ;; label = @6
                local.get 21
                br_if 0 (;@6;)
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_u
                    i32.const 32
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    i32.const 96
                    i32.add
                    i32.const 256
                    local.get 0
                    call $__fwritex
                    drop
                  end
                  local.get 20
                  i32.const -256
                  i32.add
                  local.tee 20
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load8_u
              i32.const 32
              i32.and
              br_if 0 (;@5;)
              local.get 5
              i32.const 96
              i32.add
              local.get 20
              local.get 0
              call $__fwritex
              drop
              br 0 (;@5;)
            end
          end
        end
        local.get 6
        i32.const 61
        i32.store
      end
      i32.const -1
      local.set 18
    end
    local.get 5
    i32.const 864
    i32.add
    global.set $__stack_pointer
    local.get 18)
  (func $pop_arg (type 14) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 1
                                          i32.const -9
                                          i32.add
                                          br_table 17 (;@2;) 0 (;@19;) 1 (;@18;) 4 (;@15;) 2 (;@17;) 3 (;@16;) 5 (;@14;) 6 (;@13;) 7 (;@12;) 8 (;@11;) 9 (;@10;) 10 (;@9;) 11 (;@8;) 12 (;@7;) 13 (;@6;) 14 (;@5;) 15 (;@4;) 16 (;@3;) 18 (;@1;)
                                        end
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        local.tee 1
                                        i32.const 4
                                        i32.add
                                        i32.store
                                        local.get 0
                                        local.get 1
                                        i64.load32_s
                                        i64.store
                                        return
                                      end
                                      local.get 2
                                      local.get 2
                                      i32.load
                                      local.tee 1
                                      i32.const 4
                                      i32.add
                                      i32.store
                                      local.get 0
                                      local.get 1
                                      i64.load32_u
                                      i64.store
                                      return
                                    end
                                    local.get 2
                                    local.get 2
                                    i32.load
                                    local.tee 1
                                    i32.const 4
                                    i32.add
                                    i32.store
                                    local.get 0
                                    local.get 1
                                    i64.load32_s
                                    i64.store
                                    return
                                  end
                                  local.get 2
                                  local.get 2
                                  i32.load
                                  local.tee 1
                                  i32.const 4
                                  i32.add
                                  i32.store
                                  local.get 0
                                  local.get 1
                                  i64.load32_u
                                  i64.store
                                  return
                                end
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const 7
                                i32.add
                                i32.const -8
                                i32.and
                                local.tee 1
                                i32.const 8
                                i32.add
                                i32.store
                                local.get 0
                                local.get 1
                                i64.load
                                i64.store
                                return
                              end
                              local.get 2
                              local.get 2
                              i32.load
                              local.tee 1
                              i32.const 4
                              i32.add
                              i32.store
                              local.get 0
                              local.get 1
                              i64.load16_s
                              i64.store
                              return
                            end
                            local.get 2
                            local.get 2
                            i32.load
                            local.tee 1
                            i32.const 4
                            i32.add
                            i32.store
                            local.get 0
                            local.get 1
                            i64.load16_u
                            i64.store
                            return
                          end
                          local.get 2
                          local.get 2
                          i32.load
                          local.tee 1
                          i32.const 4
                          i32.add
                          i32.store
                          local.get 0
                          local.get 1
                          i64.load8_s
                          i64.store
                          return
                        end
                        local.get 2
                        local.get 2
                        i32.load
                        local.tee 1
                        i32.const 4
                        i32.add
                        i32.store
                        local.get 0
                        local.get 1
                        i64.load8_u
                        i64.store
                        return
                      end
                      local.get 2
                      local.get 2
                      i32.load
                      i32.const 7
                      i32.add
                      i32.const -8
                      i32.and
                      local.tee 1
                      i32.const 8
                      i32.add
                      i32.store
                      local.get 0
                      local.get 1
                      i64.load
                      i64.store
                      return
                    end
                    local.get 2
                    local.get 2
                    i32.load
                    local.tee 1
                    i32.const 4
                    i32.add
                    i32.store
                    local.get 0
                    local.get 1
                    i64.load32_u
                    i64.store
                    return
                  end
                  local.get 2
                  local.get 2
                  i32.load
                  i32.const 7
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 1
                  i32.const 8
                  i32.add
                  i32.store
                  local.get 0
                  local.get 1
                  i64.load
                  i64.store
                  return
                end
                local.get 2
                local.get 2
                i32.load
                i32.const 7
                i32.add
                i32.const -8
                i32.and
                local.tee 1
                i32.const 8
                i32.add
                i32.store
                local.get 0
                local.get 1
                i64.load
                i64.store
                return
              end
              local.get 2
              local.get 2
              i32.load
              local.tee 1
              i32.const 4
              i32.add
              i32.store
              local.get 0
              local.get 1
              i64.load32_s
              i64.store
              return
            end
            local.get 2
            local.get 2
            i32.load
            local.tee 1
            i32.const 4
            i32.add
            i32.store
            local.get 0
            local.get 1
            i64.load32_u
            i64.store
            return
          end
          local.get 2
          local.get 2
          i32.load
          i32.const 7
          i32.add
          i32.const -8
          i32.and
          local.tee 1
          i32.const 8
          i32.add
          i32.store
          local.get 0
          local.get 1
          f64.load
          f64.store
          return
        end
        call $long_double_not_supported
        unreachable
      end
      local.get 2
      local.get 2
      i32.load
      local.tee 1
      i32.const 4
      i32.add
      i32.store
      local.get 0
      local.get 1
      i32.load
      i32.store
    end)
  (func $pad (type 15) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 256
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.le_s
      br_if 0 (;@1;)
      local.get 4
      i32.const 73728
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        local.get 3
        i32.sub
        local.tee 3
        i32.const 256
        local.get 3
        i32.const 256
        i32.lt_u
        local.tee 2
        select
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 1
        local.get 4
        memory.fill
      end
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 32
            i32.and
            br_if 0 (;@4;)
            local.get 5
            i32.const 256
            local.get 0
            call $__fwritex
            drop
          end
          local.get 3
          i32.const -256
          i32.add
          local.tee 3
          i32.const 255
          i32.gt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      i32.load8_u
      i32.const 32
      i32.and
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      local.get 0
      call $__fwritex
      drop
    end
    local.get 5
    i32.const 256
    i32.add
    global.set $__stack_pointer)
  (func $long_double_not_supported (type 1)
    i32.const 1621
    i32.const 3960
    call $fputs
    drop
    call $abort
    unreachable)
  (func $memchr (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load8_u
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              local.get 2
              local.set 5
              br 3 (;@2;)
            end
            local.get 2
            i32.const -1
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -2
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 2
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -3
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 3
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            i32.const -4
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          local.set 5
          local.get 0
          local.set 4
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 4
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 0
          loop  ;; label = @4
            i32.const 16843008
            local.get 4
            i32.load
            local.get 0
            i32.xor
            local.tee 2
            i32.sub
            local.get 2
            i32.or
            i32.const -2139062144
            i32.and
            i32.const -2139062144
            i32.ne
            br_if 2 (;@2;)
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 5
            i32.const -4
            i32.add
            local.tee 5
            i32.const 3
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 5
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 255
      i32.and
      local.set 2
      loop  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load8_u
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          return
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func $strlen (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load8_u
          br_if 0 (;@3;)
          local.get 0
          local.get 0
          i32.sub
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 2
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 3
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 4
        i32.add
        local.tee 1
        i32.const 3
        i32.and
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const -4
      i32.add
      local.set 2
      local.get 1
      i32.const -5
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        i32.const 16843008
        local.get 2
        i32.const 4
        i32.add
        local.tee 2
        i32.load
        local.tee 3
        i32.sub
        local.get 3
        i32.or
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.eq
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.load8_u
        local.set 3
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.sub)
  (func $strnlen (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.const 0
    local.get 1
    call $memchr
    local.tee 2
    local.get 0
    i32.sub
    local.get 1
    local.get 2
    select)
  (func $__lock (type 0) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      i32.const 0
      i32.load8_s offset=4845
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const -2147483647
      i32.atomic.rmw.cmpxchg
      local.tee 2
      i32.eqz
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store8 offset=4845
      end
      local.get 3
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.tee 2
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 2147483647
      i32.add
      local.get 2
      local.get 2
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      local.get 1
      i32.const -2147483647
      i32.add
      i32.atomic.rmw.cmpxchg
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.load
        local.tee 2
        local.get 0
        local.get 2
        local.get 2
        i32.const 1
        i32.add
        local.tee 1
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const -1
            i32.le_s
            br_if 0 (;@4;)
            local.get 1
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          i32.const 0
          local.get 1
          i32.const 1
          call $__wait
          local.get 1
          i32.const 2147483647
          i32.add
          local.set 2
        end
        local.get 0
        local.get 2
        local.get 2
        i32.const -2147483648
        i32.or
        i32.atomic.rmw.cmpxchg
        local.tee 1
        local.get 2
        i32.ne
        br_if 0 (;@2;)
      end
    end)
  (func $__unlock (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        local.get 1
        local.get 1
        i32.const 2147483647
        i32.add
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -2147483647
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      memory.atomic.notify
      drop
    end)
  (func $__wasilibc_futex_wait (type 10) (param i32 i32 i32 i64) (result i32)
    (local i32)
    i32.const -28
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.const 3
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 2
        local.get 3
        call $undefined_weak:__wasilibc_futex_wait_maybe_busy
        return
      end
      i32.const -6
      i32.const -73
      i32.const 0
      local.get 0
      local.get 2
      local.get 3
      memory.atomic.wait32
      local.tee 0
      i32.const 2
      i32.eq
      select
      local.get 0
      i32.const 1
      i32.eq
      select
      local.set 4
    end
    local.get 4)
  (func $__wait (type 16) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const -100
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.load
              br_if 2 (;@3;)
            end
            local.get 0
            i32.load
            local.get 2
            i32.ne
            br_if 3 (;@1;)
            local.get 4
            i32.const 0
            i32.store offset=12
            local.get 4
            i32.const 0
            i32.const 0
            i32.atomic.rmw.cmpxchg offset=12
            drop
            block  ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.load
              br_if 2 (;@3;)
            end
            local.get 0
            i32.load
            local.get 2
            i32.ne
            br_if 3 (;@1;)
            local.get 4
            i32.const 0
            i32.store offset=12
            local.get 4
            i32.const 0
            i32.const 0
            i32.atomic.rmw.cmpxchg offset=12
            drop
            local.get 5
            i32.const 2
            i32.add
            local.tee 5
            br_if 0 (;@4;)
          end
          local.get 1
          br_if 0 (;@3;)
          i32.const 1
          local.set 6
          br 1 (;@2;)
        end
        loop  ;; label = @3
          local.get 1
          i32.load
          local.tee 5
          local.get 1
          local.get 5
          local.get 5
          i32.const 1
          i32.add
          i32.atomic.rmw.cmpxchg
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 0
        local.set 6
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 2
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.and
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 5
            br_if 0 (;@4;)
            block  ;; label = @5
              i32.const 0
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.const 0
              local.get 2
              i64.const -1
              call $undefined_weak:__wasilibc_futex_wait_maybe_busy
              drop
              br 1 (;@4;)
            end
            local.get 0
            local.get 2
            i64.const -1
            memory.atomic.wait32
            local.set 7
          end
          local.get 0
          i32.load
          local.get 2
          i32.eq
          br_if 0 (;@3;)
        end
      end
      local.get 6
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.load
        local.tee 5
        local.get 1
        local.get 5
        local.get 5
        i32.const -1
        i32.add
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $pthread_cond_broadcast (type 4) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      call $__private_cond_signal
      return
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=12
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.load
        local.tee 0
        local.get 1
        local.get 0
        local.get 0
        i32.const 1
        i32.add
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 2147483647
      memory.atomic.notify
      drop
    end
    i32.const 0)
  (func $__clock_gettime (type 6) (param i32 i32) (result i32)
    (local i32 i64 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        i64.const 1
        local.get 2
        i32.const 8
        i32.add
        call $__wasi_clock_time_get
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        global.get $__tls_base
        i32.const 0
        i32.add
        local.get 0
        i32.store
        i32.const -1
        local.set 0
        br 1 (;@1;)
      end
      i32.const 0
      local.set 0
      local.get 1
      i32.const 0
      i32.store offset=12
      local.get 1
      local.get 2
      i64.load offset=8
      local.tee 3
      i64.const 1000000000
      i64.div_u
      local.tee 4
      i64.store
      local.get 1
      local.get 3
      local.get 4
      i64.const 1000000000
      i64.mul
      i64.sub
      i64.store32 offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $__timedwait_cp (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i64.const -1
          local.set 6
          br 1 (;@2;)
        end
        i32.const 28
        local.set 7
        local.get 3
        i32.load offset=8
        i32.const 999999999
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 5
        call $__clock_gettime
        br_if 1 (;@1;)
        local.get 5
        local.get 3
        i64.load
        local.get 5
        i64.load
        i64.sub
        local.tee 6
        i64.store
        local.get 5
        local.get 3
        i32.load offset=8
        local.get 5
        i32.load offset=8
        i32.sub
        local.tee 3
        i32.store offset=8
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 5
          local.get 3
          i32.const 1000000000
          i32.add
          local.tee 3
          i32.store offset=8
          local.get 5
          local.get 6
          i64.const -1
          i64.add
          local.tee 6
          i64.store
        end
        block  ;; label = @3
          local.get 6
          i64.const 0
          i64.ge_s
          br_if 0 (;@3;)
          i32.const 73
          local.set 7
          br 2 (;@1;)
        end
        local.get 6
        i64.const 1000000000
        i64.mul
        local.get 3
        i64.extend_i32_s
        i64.add
        local.set 6
      end
      i32.const 0
      i32.const 0
      local.get 0
      i32.const 128
      i32.const 0
      local.get 4
      select
      local.get 1
      local.get 6
      call $__wasilibc_futex_wait
      local.tee 3
      i32.sub
      local.tee 7
      local.get 3
      i32.const -17
      i32.and
      i32.const -27
      i32.ne
      select
      local.get 7
      local.get 3
      i32.const -73
      i32.ne
      select
      local.set 7
    end
    local.get 5
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 7)
  (func $__timedwait (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    i32.const 1
    local.get 5
    i32.const 12
    i32.add
    call $__pthread_setcancelstate
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i64.const -1
          local.set 6
          br 1 (;@2;)
        end
        i32.const 28
        local.set 7
        local.get 3
        i32.load offset=8
        i32.const 999999999
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 5
        i32.const 16
        i32.add
        call $__clock_gettime
        br_if 1 (;@1;)
        local.get 5
        local.get 3
        i64.load
        local.get 5
        i64.load offset=16
        i64.sub
        local.tee 6
        i64.store offset=16
        local.get 5
        local.get 3
        i32.load offset=8
        local.get 5
        i32.load offset=24
        i32.sub
        local.tee 3
        i32.store offset=24
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 5
          local.get 3
          i32.const 1000000000
          i32.add
          local.tee 3
          i32.store offset=24
          local.get 5
          local.get 6
          i64.const -1
          i64.add
          local.tee 6
          i64.store offset=16
        end
        block  ;; label = @3
          local.get 6
          i64.const 0
          i64.ge_s
          br_if 0 (;@3;)
          i32.const 73
          local.set 7
          br 2 (;@1;)
        end
        local.get 6
        i64.const 1000000000
        i64.mul
        local.get 3
        i64.extend_i32_s
        i64.add
        local.set 6
      end
      i32.const 0
      i32.const 0
      local.get 0
      i32.const 128
      i32.const 0
      local.get 4
      select
      local.get 1
      local.get 6
      call $__wasilibc_futex_wait
      local.tee 3
      i32.sub
      local.tee 7
      local.get 3
      i32.const -17
      i32.and
      i32.const -27
      i32.ne
      select
      local.get 7
      local.get 3
      i32.const -73
      i32.ne
      select
      local.set 7
    end
    local.get 5
    i32.load offset=12
    i32.const 0
    call $__pthread_setcancelstate
    drop
    local.get 5
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 7)
  (func $__pthread_cond_timedwait (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 24
    i32.add
    i32.const 0
    i32.store
    local.get 3
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    local.get 3
    i64.const 0
    i64.store offset=8
    local.get 3
    local.get 0
    i32.load offset=16
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load8_u
        i32.const 15
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        i32.const 2147483647
        i32.and
        global.get $__tls_base
        i32.const 4
        i32.add
        i32.load offset=20
        i32.eq
        br_if 0 (;@2;)
        i32.const 63
        local.set 4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=8
        i32.const 999999999
        i32.le_u
        br_if 0 (;@2;)
        i32.const 28
        local.set 4
        br 1 (;@1;)
      end
      call $__pthread_testcancel
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 8
          i32.add
          local.set 6
          local.get 0
          i32.load offset=8
          local.set 7
          loop  ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 4
            local.get 0
            local.get 4
            local.get 4
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=12
            i32.ne
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 0
        i32.const 32
        i32.add
        local.set 4
        block  ;; label = @3
          local.get 0
          i32.const 0
          i32.const 1
          i32.atomic.rmw.cmpxchg offset=32
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 1
          i32.const 2
          i32.atomic.rmw.cmpxchg
          drop
          loop  ;; label = @4
            local.get 4
            i32.const 0
            i32.const 2
            i32.const 1
            call $__wait
            local.get 4
            i32.const 0
            i32.const 2
            i32.atomic.rmw.cmpxchg
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.const 2
        i32.store offset=20
        local.get 3
        i32.const 0
        i32.store offset=16
        local.get 0
        i32.load offset=4
        local.set 7
        local.get 0
        local.get 3
        i32.const 8
        i32.add
        i32.store offset=4
        local.get 3
        local.get 7
        i32.store offset=12
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            i32.const 8
            i32.add
            i32.store offset=20
            br 1 (;@3;)
          end
          local.get 7
          local.get 3
          i32.const 8
          i32.add
          i32.store
        end
        local.get 3
        i32.const 20
        i32.add
        local.set 6
        loop  ;; label = @3
          local.get 4
          i32.load
          local.tee 8
          local.get 4
          local.get 8
          i32.const 0
          i32.atomic.rmw.cmpxchg
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 2
        local.set 7
        local.get 8
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 4
        i32.const 1
        memory.atomic.notify
        drop
      end
      local.get 1
      call $__pthread_mutex_unlock
      drop
      i32.const 2
      local.get 3
      i32.const 4
      i32.add
      call $__pthread_setcancelstate
      drop
      block  ;; label = @2
        local.get 3
        i32.load offset=4
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        i32.const 1
        i32.const 0
        call $__pthread_setcancelstate
        drop
      end
      local.get 6
      local.get 7
      local.get 3
      local.get 2
      local.get 5
      i32.eqz
      local.tee 8
      call $__timedwait_cp
      local.set 4
      block  ;; label = @2
        local.get 6
        i32.load
        local.get 7
        i32.ne
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 27
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            br_if 2 (;@2;)
          end
          local.get 6
          local.get 7
          local.get 3
          local.get 2
          local.get 8
          call $__timedwait_cp
          local.set 4
          local.get 6
          i32.load
          local.get 7
          i32.eq
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.get 4
      local.get 4
      i32.const 27
      i32.eq
      select
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 8
                i32.const 11
                i32.ne
                br_if 0 (;@6;)
                i32.const 11
                i32.const 0
                local.get 0
                i32.load offset=8
                local.get 7
                i32.eq
                select
                local.set 8
              end
              local.get 0
              i32.const 12
              i32.add
              local.set 0
              loop  ;; label = @6
                local.get 0
                i32.load
                local.tee 4
                local.get 0
                local.get 4
                local.get 4
                i32.const -1
                i32.add
                i32.atomic.rmw.cmpxchg
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 4
              i32.const -2147483647
              i32.ne
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 3
              i32.const 0
              i32.const 2
              i32.atomic.rmw.cmpxchg offset=16
              br_if 0 (;@5;)
              local.get 0
              i32.const 32
              i32.add
              local.set 4
              block  ;; label = @6
                local.get 0
                i32.const 0
                i32.const 1
                i32.atomic.rmw.cmpxchg offset=32
                i32.eqz
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.const 2
                i32.atomic.rmw.cmpxchg
                drop
                loop  ;; label = @7
                  local.get 4
                  i32.const 0
                  i32.const 2
                  i32.const 1
                  call $__wait
                  local.get 4
                  i32.const 0
                  i32.const 2
                  i32.atomic.rmw.cmpxchg
                  br_if 0 (;@7;)
                end
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=4
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 3
                  i32.load offset=12
                  i32.store offset=4
                  br 1 (;@6;)
                end
                local.get 3
                i32.load offset=8
                local.tee 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                local.get 3
                i32.load offset=12
                i32.store offset=4
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.load offset=20
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 3
                  i32.load offset=8
                  i32.store offset=20
                  br 1 (;@6;)
                end
                local.get 3
                i32.load offset=12
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                i32.load offset=8
                i32.store
              end
              loop  ;; label = @6
                local.get 4
                i32.load
                local.tee 0
                local.get 4
                local.get 0
                i32.const 0
                i32.atomic.rmw.cmpxchg
                i32.ne
                br_if 0 (;@6;)
              end
              block  ;; label = @6
                local.get 0
                i32.const 2
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                memory.atomic.notify
                drop
              end
              local.get 3
              i32.load offset=24
              local.tee 0
              i32.eqz
              br_if 2 (;@3;)
              loop  ;; label = @6
                local.get 0
                i32.load
                local.tee 4
                local.get 0
                local.get 4
                local.get 4
                i32.const -1
                i32.add
                i32.atomic.rmw.cmpxchg
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 4
              i32.const 1
              i32.ne
              br_if 2 (;@3;)
              local.get 3
              i32.load offset=24
              local.set 0
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 3
              i32.const 0
              i32.const 1
              i32.atomic.rmw.cmpxchg offset=20
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              i32.const 20
              i32.add
              local.set 4
              local.get 3
              i32.const 1
              i32.const 2
              i32.atomic.rmw.cmpxchg offset=20
              drop
              loop  ;; label = @6
                local.get 4
                i32.const 0
                i32.const 2
                i32.const 1
                call $__wait
                local.get 3
                i32.const 0
                i32.const 2
                i32.atomic.rmw.cmpxchg offset=20
                br_if 0 (;@6;)
              end
            end
            local.get 1
            call $__pthread_mutex_lock
            local.set 0
            block  ;; label = @5
              local.get 3
              i32.load offset=12
              br_if 0 (;@5;)
              local.get 1
              i32.load8_u
              i32.const 8
              i32.and
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 1
                i32.load offset=8
                local.tee 4
                local.get 1
                local.get 4
                local.get 4
                i32.const 1
                i32.add
                i32.atomic.rmw.cmpxchg offset=8
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 0
            local.get 8
            local.get 0
            select
            local.set 7
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=8
                local.tee 4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 1
                  i32.load offset=4
                  local.tee 0
                  i32.const 1
                  i32.lt_s
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 0
                  local.get 0
                  i32.const -2147483648
                  i32.or
                  i32.atomic.rmw.cmpxchg offset=4
                  drop
                  local.get 3
                  i32.load offset=8
                  local.set 4
                end
                local.get 4
                i32.const 12
                i32.add
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  i32.load
                  local.tee 0
                  local.get 4
                  local.get 0
                  i32.const 0
                  i32.atomic.rmw.cmpxchg
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 4
                i32.const 1
                memory.atomic.notify
                drop
                br 1 (;@5;)
              end
              local.get 1
              i32.load8_u
              i32.const 8
              i32.and
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 1
                i32.load offset=8
                local.tee 4
                local.get 1
                local.get 4
                local.get 4
                i32.const -1
                i32.add
                i32.atomic.rmw.cmpxchg offset=8
                i32.ne
                br_if 0 (;@6;)
              end
            end
            i32.const 0
            local.get 7
            local.get 7
            i32.const 11
            i32.eq
            select
            local.set 4
            local.get 3
            i32.load offset=4
            local.set 0
            br 2 (;@2;)
          end
          local.get 0
          i32.const 1
          memory.atomic.notify
          drop
        end
        local.get 1
        call $__pthread_mutex_lock
        local.set 4
        local.get 3
        i32.load offset=4
        i32.const 0
        call $__pthread_setcancelstate
        drop
        local.get 4
        local.get 8
        local.get 4
        select
        local.tee 4
        i32.const 11
        i32.ne
        br_if 1 (;@1;)
        call $__pthread_testcancel
        i32.const 1
        local.set 0
        i32.const 11
        local.set 4
      end
      local.get 0
      i32.const 0
      call $__pthread_setcancelstate
      drop
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $__private_cond_signal (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    local.get 2
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 32
    i32.add
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.const 0
      i32.const 1
      i32.atomic.rmw.cmpxchg offset=32
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 1
      i32.const 2
      i32.atomic.rmw.cmpxchg
      drop
      loop  ;; label = @2
        local.get 4
        i32.const 0
        i32.const 2
        i32.const 1
        call $__wait
        local.get 4
        i32.const 0
        i32.const 2
        i32.atomic.rmw.cmpxchg
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=20
    local.tee 5
    i32.const 0
    i32.ne
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.const 0
            i32.const 1
            i32.atomic.rmw.cmpxchg offset=8
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 2
            i32.const 12
            i32.add
            i32.store offset=16
            local.get 2
            local.get 2
            i32.load offset=12
            i32.const 1
            i32.add
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          local.get 5
          local.get 3
          select
          local.set 3
          local.get 1
          i32.const -1
          i32.add
          local.set 1
        end
        local.get 5
        i32.load
        local.tee 5
        i32.const 0
        i32.ne
        local.set 6
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 5
          i32.load offset=4
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store
        end
        local.get 5
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    local.get 5
    i32.store offset=20
    loop  ;; label = @1
      local.get 4
      i32.load
      local.tee 5
      local.get 4
      local.get 5
      i32.const 0
      i32.atomic.rmw.cmpxchg
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 5
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      local.get 4
      i32.const 1
      memory.atomic.notify
      drop
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=12
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        i32.const 12
        i32.add
        i32.const 0
        local.get 4
        i32.const 1
        call $__wait
        local.get 2
        i32.load offset=12
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 12
      i32.add
      local.set 4
      loop  ;; label = @2
        local.get 4
        i32.load
        local.tee 5
        local.get 4
        local.get 5
        i32.const 0
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 5
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      local.get 4
      i32.const 1
      memory.atomic.notify
      drop
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $pthread_cond_wait (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.const 0
    call $__pthread_cond_timedwait)
  (func $dummy_0 (type 1))
  (func $__tl_unlock (type 1)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=5932
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 0
      i32.const -1
      i32.add
      i32.store offset=5932
      return
    end
    loop  ;; label = @1
      i32.const 0
      i32.load offset=4836
      local.tee 0
      i32.const 0
      local.get 0
      i32.const 0
      i32.atomic.rmw.cmpxchg offset=4836
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=5936
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 1
      memory.atomic.notify offset=4836
      drop
    end)
  (func $__tl_sync (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.const 0
    i32.atomic.rmw.cmpxchg offset=12
    drop
    block  ;; label = @1
      i32.const 0
      i32.load offset=4836
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 4836
      i32.const 5936
      local.get 2
      i32.const 0
      call $__wait
      i32.const 0
      i32.load offset=5936
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 1
      memory.atomic.notify offset=4836
      drop
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $__wasi_thread_start_C (type 11) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__tls_base
    i32.const 4
    i32.add
    local.tee 2
    local.get 0
    i32.atomic.store offset=20
    local.get 1
    i32.load offset=12
    local.get 1
    i32.load offset=8
    call_indirect (type 4)
    local.set 1
    local.get 2
    i32.const 1
    i32.store8 offset=36
    local.get 2
    local.get 1
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store8 offset=37
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.load offset=64
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 1
        i32.load offset=8
        i32.store offset=64
        local.get 1
        i32.load offset=4
        local.get 1
        i32.load
        call_indirect (type 0)
        br 0 (;@2;)
      end
    end
    call $__pthread_tsd_run_dtors
    local.get 2
    i32.const 2
    i32.const 1
    i32.atomic.rmw.cmpxchg offset=28
    local.set 3
    local.get 2
    i32.const 96
    i32.add
    local.tee 4
    call $__lock
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=20
        local.tee 0
        i32.const 0
        i32.load offset=4836
        i32.eq
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        local.get 0
        i32.atomic.rmw.cmpxchg offset=4836
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          i32.const 4836
          i32.const 5936
          local.get 1
          i32.const 0
          call $__wait
          i32.const 0
          i32.const 0
          local.get 0
          i32.atomic.rmw.cmpxchg offset=4836
          local.tee 1
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      i32.const 0
      i32.load offset=5932
      i32.const 1
      i32.add
      i32.store offset=5932
    end
    local.get 2
    i32.const 28
    i32.add
    local.set 5
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      local.get 2
      i32.eq
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.store offset=20
      local.get 4
      call $__unlock
      block  ;; label = @2
        local.get 2
        i32.load offset=72
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.const 72
        i32.add
        local.tee 4
        i32.eq
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 1
          i32.const -8
          i32.add
          i32.load
          local.set 6
          local.get 2
          local.get 1
          i32.store offset=80
          local.get 2
          local.get 1
          i32.load
          i32.store offset=72
          local.get 1
          i32.const -12
          i32.add
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.load
            local.tee 0
            local.get 1
            local.get 0
            i32.const 1073741824
            i32.atomic.rmw.cmpxchg
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 2
          i32.const 0
          i32.store offset=80
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 0
              i32.lt_s
              br_if 0 (;@5;)
              local.get 6
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 1
            i32.const 1
            memory.atomic.notify
            drop
          end
          local.get 4
          i32.load
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          local.get 4
          i32.ne
          br_if 0 (;@3;)
        end
      end
      call $dummy_0
      i32.const 0
      i32.const 0
      i32.load offset=4848
      i32.const -1
      i32.add
      local.tee 1
      i32.store offset=4848
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        i32.const 255
        i32.store8 offset=4845
      end
      local.get 2
      i32.load offset=4
      local.tee 1
      local.get 2
      i32.load offset=8
      local.tee 0
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 2
      i32.store offset=8
      local.get 2
      local.get 2
      i32.store offset=4
      block  ;; label = @2
        local.get 3
        i32.const 3
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=40
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=5940
        call $free
        i32.const 0
        local.get 2
        i32.load offset=40
        i32.store offset=5940
        return
      end
      loop  ;; label = @2
        local.get 5
        i32.load
        local.tee 1
        local.get 5
        local.get 1
        i32.const 0
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 5
      i32.const 1
      memory.atomic.notify
      drop
      return
    end
    call $__tl_unlock
    local.get 4
    call $__unlock
    local.get 5
    local.get 3
    i32.store
    i32.const 0
    call $exit
    unreachable)
  (func $__pthread_create (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 16
    i32.add
    i64.const 0
    i64.store
    i32.const 0
    local.set 5
    local.get 4
    i32.const 24
    i32.add
    i32.const 0
    i32.store
    local.get 4
    i32.const 0
    i32.store offset=44
    local.get 4
    i32.const 0
    i32.store offset=40
    local.get 4
    i32.const 0
    i32.store offset=36
    local.get 4
    i32.const 0
    i32.store offset=32
    local.get 4
    i64.const 0
    i64.store offset=8
    global.get $__tls_base
    i32.const 4
    i32.add
    local.set 6
    global.get $__tls_align
    local.set 7
    global.get $__tls_size
    local.set 8
    i32.const 0
    i32.load8_u offset=4844
    local.set 9
    global.get $__tls_base
    local.set 10
    block  ;; label = @1
      local.get 9
      br_if 0 (;@1;)
      block  ;; label = @2
        call $__ofl_lock
        i32.load
        local.tee 9
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          block  ;; label = @4
            local.get 9
            i32.load offset=68
            i32.const -1
            i32.gt_s
            br_if 0 (;@4;)
            local.get 9
            i32.const 0
            i32.store offset=68
          end
          local.get 9
          i32.load offset=52
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      call $__ofl_unlock
      block  ;; label = @2
        i32.const 0
        i32.load offset=4876
        local.tee 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.load offset=68
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 9
        i32.const 0
        i32.store offset=68
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=4224
        local.tee 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.load offset=68
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 9
        i32.const 0
        i32.store offset=68
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=4088
        local.tee 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.load offset=68
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 9
        i32.const 0
        i32.store offset=68
      end
      i32.const 0
      i32.const 1
      i32.store8 offset=4844
      local.get 6
      i32.const 5952
      i32.store offset=68
    end
    i32.const 0
    local.set 11
    i32.const 0
    local.set 9
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 12
      i32.const 2
      i32.lt_u
      br_if 0 (;@1;)
      local.get 4
      local.get 1
      i32.load
      local.tee 11
      i32.store offset=44
      local.get 4
      local.get 1
      i32.load offset=4
      local.tee 5
      i32.store offset=40
      local.get 4
      local.get 1
      i32.load offset=8
      local.tee 9
      i32.store offset=36
      local.get 4
      local.get 1
      i32.load offset=12
      i32.store offset=32
      local.get 4
      i32.const 24
      i32.add
      local.get 1
      i32.const 32
      i32.add
      i32.load
      i32.store
      local.get 4
      i32.const 16
      i32.add
      local.get 1
      i32.const 24
      i32.add
      i64.load align=4
      i64.store
      local.get 4
      local.get 1
      i64.load offset=16 align=4
      i64.store offset=8
    end
    call $dummy_0
    block  ;; label = @1
      local.get 12
      i32.const 1
      i32.gt_u
      br_if 0 (;@1;)
      local.get 4
      i32.const 0
      i32.load offset=4228
      local.tee 11
      i32.store offset=44
      local.get 4
      i32.const 0
      i32.load offset=5928
      local.tee 5
      i32.store offset=40
    end
    local.get 8
    local.get 7
    i32.add
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 9
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 11
                  i32.sub
                  local.set 13
                  local.get 9
                  i32.const -16
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 12
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=4232
                      local.get 7
                      i32.add
                      local.tee 1
                      i32.const 2047
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 1
                      local.get 11
                      i32.const 3
                      i32.shr_u
                      i32.lt_u
                      br_if 1 (;@8;)
                    end
                    local.get 1
                    i32.const 15
                    i32.add
                    i32.const -16
                    i32.and
                    local.set 11
                    br 2 (;@6;)
                  end
                  i32.const 0
                  local.set 12
                  local.get 8
                  i32.const 0
                  i32.load offset=4232
                  i32.sub
                  local.tee 9
                  local.get 7
                  i32.sub
                  local.set 14
                  block  ;; label = @8
                    local.get 1
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 14
                    i32.const 0
                    local.get 1
                    memory.fill
                  end
                  block  ;; label = @8
                    local.get 8
                    br_if 0 (;@8;)
                    local.get 14
                    local.set 8
                    br 2 (;@6;)
                  end
                  i32.const 0
                  local.get 7
                  i32.sub
                  local.set 1
                  i32.const 0
                  local.set 5
                  br 2 (;@5;)
                end
                i32.const 0
                local.set 8
                local.get 7
                local.get 11
                i32.add
                i32.const 0
                i32.load offset=4232
                i32.add
                i32.const 15
                i32.add
                i32.const -16
                i32.and
                local.get 5
                i32.const 15
                i32.add
                i32.const -16
                i32.and
                local.tee 12
                i32.add
                local.set 11
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 6
                  i32.load offset=20
                  local.tee 1
                  i32.const 0
                  i32.load offset=4836
                  i32.eq
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.const 0
                    local.get 1
                    i32.atomic.rmw.cmpxchg offset=4836
                    local.tee 9
                    i32.eqz
                    br_if 0 (;@8;)
                    loop  ;; label = @9
                      i32.const 4836
                      i32.const 5936
                      local.get 9
                      i32.const 0
                      call $__wait
                      i32.const 0
                      i32.const 0
                      local.get 1
                      i32.atomic.rmw.cmpxchg offset=4836
                      local.tee 9
                      br_if 0 (;@9;)
                    end
                  end
                  i32.const 0
                  i32.load offset=5932
                  local.set 9
                  br 1 (;@6;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=5932
                i32.const 1
                i32.add
                local.tee 9
                i32.store offset=5932
              end
              i32.const 0
              i32.load offset=5940
              call $free
              i32.const 0
              i32.const 0
              i32.store offset=5940
              block  ;; label = @6
                block  ;; label = @7
                  local.get 9
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 9
                  i32.const -1
                  i32.add
                  i32.store offset=5932
                  br 1 (;@6;)
                end
                loop  ;; label = @7
                  i32.const 0
                  i32.load offset=4836
                  local.tee 9
                  i32.const 0
                  local.get 9
                  i32.const 0
                  i32.atomic.rmw.cmpxchg offset=4836
                  i32.ne
                  br_if 0 (;@7;)
                end
                i32.const 0
                i32.load offset=5936
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.const 1
                memory.atomic.notify offset=4836
                drop
              end
              local.get 11
              call $malloc
              local.tee 5
              i32.eqz
              br_if 1 (;@4;)
              local.get 5
              local.get 11
              i32.add
              i32.const 0
              i32.load offset=4232
              i32.sub
              local.set 9
              block  ;; label = @6
                i32.const 0
                i32.load offset=4232
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 9
                i32.const 0
                local.get 1
                memory.fill
              end
              i32.const 0
              local.get 7
              i32.sub
              local.set 1
              block  ;; label = @6
                local.get 8
                i32.eqz
                br_if 0 (;@6;)
                local.get 8
                local.set 14
                br 1 (;@5;)
              end
              local.get 5
              local.get 12
              i32.add
              local.set 13
              local.get 9
              local.get 1
              i32.add
              local.set 14
            end
            local.get 6
            local.get 10
            i32.sub
            local.get 9
            local.get 1
            i32.add
            call $__copy_tls
            local.tee 8
            i32.add
            local.tee 1
            local.get 1
            i32.store
            local.get 1
            i32.const 3
            i32.const 2
            local.get 4
            i32.load offset=32
            select
            i32.store offset=28
            local.get 1
            local.get 6
            i64.load offset=12 align=4
            i64.store offset=12 align=4
            local.get 1
            local.get 1
            i32.const 72
            i32.add
            i32.store offset=72
            local.get 1
            local.get 12
            i32.store offset=56
            local.get 1
            local.get 11
            i32.store offset=44
            local.get 1
            local.get 5
            i32.store offset=40
            local.get 1
            i32.const 4852
            i32.store offset=92
            local.get 1
            local.get 9
            i32.store offset=68
            local.get 1
            local.get 14
            i32.const -16
            i32.add
            local.tee 9
            i32.const -4
            i32.and
            local.tee 7
            local.get 13
            i32.sub
            i32.store offset=52
            local.get 1
            local.get 9
            i32.const -16
            i32.and
            local.tee 9
            i32.store offset=48
            local.get 7
            local.get 3
            i32.store offset=12
            local.get 7
            local.get 2
            i32.store offset=8
            local.get 7
            local.get 9
            i32.store
            local.get 7
            local.get 8
            i32.store offset=4
            local.get 6
            i32.load offset=20
            local.tee 11
            i32.const 0
            i32.load offset=4836
            i32.eq
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            local.get 11
            i32.atomic.rmw.cmpxchg offset=4836
            local.tee 9
            i32.eqz
            br_if 2 (;@2;)
            loop  ;; label = @5
              i32.const 4836
              i32.const 5936
              local.get 9
              i32.const 0
              call $__wait
              i32.const 0
              i32.const 0
              local.get 11
              i32.atomic.rmw.cmpxchg offset=4836
              local.tee 9
              br_if 0 (;@5;)
              br 3 (;@2;)
            end
          end
          call $dummy_0
          i32.const 6
          local.set 9
          br 2 (;@1;)
        end
        i32.const 0
        i32.const 0
        i32.load offset=5932
        i32.const 1
        i32.add
        i32.store offset=5932
      end
      i32.const 0
      i32.const 0
      i32.load offset=4848
      local.tee 9
      i32.const 1
      i32.add
      i32.store offset=4848
      block  ;; label = @2
        local.get 9
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=4845
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          call $__wasi_thread_spawn
          local.tee 11
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          local.get 1
          local.get 11
          i32.atomic.store offset=20
          local.get 1
          local.get 6
          i32.store offset=4
          local.get 6
          i32.load offset=8
          local.tee 9
          local.get 1
          i32.store offset=4
          local.get 1
          local.get 9
          i32.store offset=8
          local.get 1
          i32.load offset=4
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        i32.const 0
        i32.const 0
        i32.load offset=4848
        i32.const -1
        i32.add
        local.tee 9
        i32.store offset=4848
        i32.const -6
        local.set 11
        local.get 9
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store8 offset=4845
      end
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=5932
          local.tee 9
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.get 9
          i32.const -1
          i32.add
          i32.store offset=5932
          br 1 (;@2;)
        end
        loop  ;; label = @3
          i32.const 0
          i32.load offset=4836
          local.tee 9
          i32.const 0
          local.get 9
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=4836
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 0
        i32.load offset=5936
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        memory.atomic.notify offset=4836
        drop
      end
      call $dummy_0
      block  ;; label = @2
        local.get 11
        i32.const -1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 5
        call $free
        i32.const 0
        local.get 11
        i32.sub
        local.set 9
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      i32.store
      i32.const 0
      local.set 9
    end
    local.get 4
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 9)
  (func $__pthread_join (type 6) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.const 0
    call $__pthread_timedjoin_np)
  (func $__pthread_timedjoin_np (type 2) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    call $__pthread_testcancel
    i32.const 1
    local.get 3
    i32.const 12
    i32.add
    call $__pthread_setcancelstate
    drop
    block  ;; label = @1
      local.get 3
      i32.load offset=12
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $__pthread_setcancelstate
      drop
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=28
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 28
            i32.add
            local.set 5
            loop  ;; label = @5
              local.get 4
              i32.const 3
              i32.ge_s
              br_if 2 (;@3;)
              local.get 5
              local.get 4
              i32.const 1752
              local.get 2
              i32.const 1
              call $__timedwait_cp
              local.set 6
              block  ;; label = @6
                local.get 5
                i32.load
                local.tee 4
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.const 73
                i32.eq
                br_if 0 (;@6;)
                local.get 6
                i32.const 28
                i32.ne
                br_if 1 (;@5;)
              end
            end
            local.get 3
            i32.load offset=12
            i32.const 0
            call $__pthread_setcancelstate
            drop
            local.get 6
            i32.const 28
            i32.eq
            br_if 3 (;@1;)
            local.get 6
            i32.const 73
            i32.eq
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 3
          i32.load offset=12
          i32.const 0
          call $__pthread_setcancelstate
          drop
          br 1 (;@2;)
        end
        unreachable
      end
      local.get 0
      call $__tl_sync
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.load offset=60
        i32.store
      end
      i32.const 0
      local.set 6
      local.get 0
      i32.load offset=40
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      call $free
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 6)
  (func $__pthread_key_create (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      global.get $__tls_base
      i32.const 4
      i32.add
      local.tee 2
      i32.load offset=68
      br_if 0 (;@1;)
      local.get 2
      i32.const 5952
      i32.store offset=68
    end
    i32.const 6464
    call $__pthread_rwlock_wrlock
    drop
    local.get 1
    i32.const 8
    local.get 1
    select
    local.set 3
    i32.const 0
    i32.load offset=6496
    local.tee 4
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 2
          i32.shl
          local.tee 2
          i32.load offset=6512
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store
          local.get 2
          i32.const 6512
          i32.add
          local.get 3
          i32.store
          i32.const 0
          local.set 2
          i32.const 0
          local.get 1
          i32.store offset=6496
          br 2 (;@1;)
        end
        local.get 1
        i32.const 1
        i32.add
        i32.const 127
        i32.and
        local.tee 1
        local.get 4
        i32.ne
        br_if 0 (;@2;)
      end
      i32.const 6
      local.set 2
    end
    i32.const 6464
    call $__pthread_rwlock_unlock
    drop
    local.get 2)
  (func $nodtor (type 0) (param i32))
  (func $__pthread_tsd_run_dtors (type 1)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      global.get $__tls_base
      i32.const 4
      i32.add
      local.tee 0
      i32.load8_u offset=38
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        i32.const 6464
        call $__pthread_rwlock_rdlock
        drop
        local.get 0
        local.get 0
        i32.load8_u offset=38
        i32.const 254
        i32.and
        i32.store8 offset=38
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 6512
          i32.add
          i32.load
          local.set 3
          local.get 0
          i32.load offset=68
          local.get 2
          i32.add
          local.tee 4
          i32.load
          local.set 5
          local.get 4
          i32.const 0
          i32.store
          block  ;; label = @4
            local.get 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 8
            i32.eq
            br_if 0 (;@4;)
            i32.const 6464
            call $__pthread_rwlock_unlock
            drop
            local.get 5
            local.get 3
            call_indirect (type 0)
            i32.const 6464
            call $__pthread_rwlock_rdlock
            drop
          end
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.const 512
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 6464
        call $__pthread_rwlock_unlock
        drop
        local.get 0
        i32.load8_u offset=38
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.const 3
        i32.lt_u
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end)
  (func $__pthread_mutex_lock (type 4) (param i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 15
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        local.get 0
        i32.const 0
        i32.const 10
        i32.atomic.rmw.cmpxchg offset=4
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 0
      call $__pthread_mutex_timedlock
      local.set 1
    end
    local.get 1)
  (func $__pthread_mutex_timedlock (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.const 15
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        local.get 0
        i32.const 0
        i32.const 10
        i32.atomic.rmw.cmpxchg offset=4
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.set 3
      end
      local.get 0
      call $__pthread_mutex_trylock
      local.tee 4
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      local.get 3
      i32.const -1
      i32.xor
      i32.const 128
      i32.and
      local.set 5
      local.get 0
      i32.const 4
      i32.add
      local.set 6
      i32.const -100
      local.set 7
      block  ;; label = @2
        loop  ;; label = @3
          local.get 6
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=8
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 6
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=8
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 7
          i32.const 2
          i32.add
          local.tee 7
          br_if 0 (;@3;)
        end
      end
      local.get 0
      call $__pthread_mutex_trylock
      local.tee 4
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      global.get $__tls_base
      i32.const 4
      i32.add
      local.set 8
      local.get 3
      i32.const 4
      i32.and
      i32.eqz
      local.set 9
      local.get 3
      i32.const 3
      i32.and
      i32.const 2
      i32.ne
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load
            local.tee 4
            i32.const 1073741823
            i32.and
            local.tee 7
            br_if 0 (;@4;)
            local.get 4
            i32.const 0
            i32.ne
            local.get 9
            i32.and
            i32.eqz
            br_if 1 (;@3;)
          end
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 7
            local.get 8
            i32.load offset=20
            i32.ne
            br_if 0 (;@4;)
            i32.const 16
            local.set 4
            br 3 (;@1;)
          end
          loop  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 7
            local.get 0
            local.get 7
            local.get 7
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=8
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 6
          local.get 4
          local.get 4
          i32.const -2147483648
          i32.or
          local.tee 7
          i32.atomic.rmw.cmpxchg
          drop
          local.get 6
          local.get 7
          i32.const 1752
          local.get 1
          local.get 5
          call $__timedwait
          local.set 4
          loop  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 7
            local.get 0
            local.get 7
            local.get 7
            i32.const -1
            i32.add
            i32.atomic.rmw.cmpxchg offset=8
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const 27
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          br_if 2 (;@1;)
        end
        local.get 0
        call $__pthread_mutex_trylock
        local.tee 4
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $__pthread_mutex_trylock_owner (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__tls_base
    i32.const 4
    i32.add
    local.tee 1
    i32.load offset=20
    local.set 2
    local.get 0
    i32.load offset=4
    local.set 3
    local.get 0
    i32.load
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 3
            i32.const 1073741823
            i32.and
            local.tee 5
            i32.ne
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 4
              i32.const 8
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=20
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 0
              i32.const 0
              i32.store offset=20
              local.get 3
              i32.const 1073741824
              i32.and
              local.set 3
              br 2 (;@3;)
            end
            local.get 4
            i32.const 3
            i32.and
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load offset=20
              local.tee 3
              i32.const 2147483646
              i32.le_u
              br_if 0 (;@5;)
              i32.const 6
              return
            end
            local.get 0
            local.get 3
            i32.const 1
            i32.add
            i32.store offset=20
            i32.const 0
            return
          end
          i32.const 10
          local.set 6
          local.get 5
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 4
            i32.and
            i32.eqz
            br_if 3 (;@1;)
          end
          block  ;; label = @4
            local.get 4
            i32.const 128
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 1
              i32.load offset=76
              br_if 0 (;@5;)
              local.get 1
              i32.const -12
              i32.store offset=76
            end
            local.get 0
            i32.load offset=8
            local.set 5
            local.get 1
            local.get 0
            i32.const 16
            i32.add
            i32.store offset=80
            local.get 2
            i32.const -2147483648
            i32.or
            local.get 2
            local.get 5
            select
            local.set 2
          end
          block  ;; label = @4
            local.get 0
            local.get 3
            local.get 2
            local.get 3
            i32.const 1073741824
            i32.and
            i32.or
            i32.atomic.rmw.cmpxchg offset=4
            local.get 3
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const 0
            i32.store offset=80
            local.get 4
            i32.const 12
            i32.and
            i32.const 12
            i32.ne
            br_if 3 (;@1;)
            local.get 0
            i32.load offset=8
            i32.eqz
            br_if 3 (;@1;)
            i32.const 56
            return
          end
          local.get 4
          i32.const 8
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 0
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.store offset=80
        i32.const 56
        i32.const 10
        local.get 4
        i32.const 4
        i32.and
        select
        return
      end
      local.get 0
      local.get 1
      i32.load offset=72
      local.tee 4
      i32.store offset=16
      local.get 0
      local.get 1
      i32.const 72
      i32.add
      local.tee 5
      i32.store offset=12
      local.get 0
      i32.const 16
      i32.add
      local.set 2
      block  ;; label = @2
        local.get 4
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        local.get 4
        i32.const -4
        i32.add
        local.get 2
        i32.store
      end
      local.get 1
      local.get 2
      i32.store offset=72
      i32.const 0
      local.set 6
      local.get 1
      i32.const 0
      i32.store offset=80
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=20
      i32.const 62
      local.set 6
    end
    local.get 6)
  (func $__pthread_mutex_trylock (type 4) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load8_u
      i32.const 15
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 10
      i32.atomic.rmw.cmpxchg offset=4
      i32.const 10
      i32.and
      return
    end
    local.get 0
    call $__pthread_mutex_trylock_owner)
  (func $__pthread_mutex_unlock (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load
    local.tee 1
    i32.const 128
    i32.and
    local.set 2
    local.get 0
    i32.load offset=8
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 15
          i32.and
          local.tee 4
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        i32.const 63
        local.set 5
        local.get 0
        i32.load offset=4
        local.tee 6
        i32.const 1073741823
        i32.and
        global.get $__tls_base
        i32.const 4
        i32.add
        local.tee 7
        i32.load offset=20
        i32.ne
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=20
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 5
          i32.const -1
          i32.add
          i32.store offset=20
          i32.const 0
          return
        end
        local.get 6
        i32.const 1
        i32.shl
        local.get 1
        i32.const 29
        i32.shl
        i32.and
        i32.const 31
        i32.shr_s
        local.set 1
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 7
          local.get 0
          i32.const 16
          i32.add
          i32.store offset=80
        end
        local.get 1
        i32.const 2147483647
        i32.and
        local.set 5
        local.get 0
        i32.load offset=12
        local.tee 6
        local.get 0
        i32.load offset=16
        local.tee 1
        i32.store
        local.get 1
        local.get 7
        i32.const 72
        i32.add
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        i32.const -4
        i32.add
        local.get 6
        i32.store
      end
      local.get 0
      i32.const 4
      i32.add
      local.set 0
      loop  ;; label = @2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        local.get 1
        local.get 5
        i32.atomic.rmw.cmpxchg
        i32.ne
        br_if 0 (;@2;)
      end
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 7
        i32.const 0
        i32.store offset=80
      end
      i32.const 0
      local.set 5
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 1 (;@1;)
      end
      local.get 0
      i32.const 1
      memory.atomic.notify
      drop
    end
    local.get 5)
  (func $__pthread_rwlock_rdlock (type 4) (param i32) (result i32)
    local.get 0
    i32.const 0
    call $__pthread_rwlock_timedrdlock)
  (func $__pthread_rwlock_timedrdlock (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      call $__pthread_rwlock_tryrdlock
      local.tee 3
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      i32.const -100
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 0
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 4
          i32.const 2
          i32.add
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      local.get 0
      call $__pthread_rwlock_tryrdlock
      local.tee 3
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 3
          i32.const 2147483647
          i32.and
          i32.const 2147483647
          i32.ne
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 0
            local.get 4
            local.get 4
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=4
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 0
          local.get 3
          i32.const -1
          i32.atomic.rmw.cmpxchg
          drop
          local.get 0
          i32.const -1
          i32.const 1752
          local.get 1
          local.get 0
          i32.load offset=8
          i32.const 128
          i32.xor
          call $__timedwait
          local.set 3
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 0
            local.get 4
            local.get 4
            i32.const -1
            i32.add
            i32.atomic.rmw.cmpxchg offset=4
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 27
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 0
        call $__pthread_rwlock_tryrdlock
        local.tee 3
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $__pthread_rwlock_tryrdlock (type 4) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          i32.const 6
          local.set 1
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 2
            i32.const 2147483647
            i32.and
            i32.const -2147483646
            i32.add
            br_table 3 (;@1;) 2 (;@2;) 0 (;@4;)
          end
          local.get 0
          local.get 2
          local.get 2
          i32.const 1
          i32.add
          i32.atomic.rmw.cmpxchg
          local.get 2
          i32.ne
          br_if 0 (;@3;)
        end
        i32.const 0
        return
      end
      i32.const 10
      local.set 1
    end
    local.get 1)
  (func $__pthread_rwlock_unlock (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32)
    loop  ;; label = @1
      local.get 0
      i32.load
      local.set 1
      local.get 0
      i32.load offset=4
      local.set 2
      local.get 1
      local.get 0
      local.get 1
      i32.const 0
      i32.const 0
      local.get 1
      i32.const -1
      i32.add
      local.get 1
      i32.const 2147483647
      i32.and
      local.tee 3
      i32.const 1
      i32.eq
      select
      local.get 3
      i32.const 2147483647
      i32.eq
      select
      local.tee 4
      i32.atomic.rmw.cmpxchg
      i32.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 4
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        local.get 1
        i32.const -1
        i32.gt_s
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 3
      memory.atomic.notify
      drop
    end
    i32.const 0)
  (func $__pthread_rwlock_trywrlock (type 4) (param i32) (result i32)
    i32.const 10
    i32.const 0
    local.get 0
    i32.const 0
    i32.const 2147483647
    i32.atomic.rmw.cmpxchg
    select)
  (func $__pthread_rwlock_timedwrlock (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      call $__pthread_rwlock_trywrlock
      local.tee 3
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      i32.const -100
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 0
          i32.load
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          br_if 1 (;@2;)
          local.get 2
          i32.const 0
          i32.store offset=12
          local.get 2
          i32.const 0
          i32.const 0
          i32.atomic.rmw.cmpxchg offset=12
          drop
          local.get 4
          i32.const 2
          i32.add
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      local.get 0
      call $__pthread_rwlock_trywrlock
      local.tee 3
      i32.const 10
      i32.ne
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 0
            local.get 4
            local.get 4
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=4
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 0
          local.get 3
          local.get 3
          i32.const -2147483648
          i32.or
          local.tee 4
          i32.atomic.rmw.cmpxchg
          drop
          local.get 0
          local.get 4
          i32.const 1752
          local.get 1
          local.get 0
          i32.load offset=8
          i32.const 128
          i32.xor
          call $__timedwait
          local.set 3
          loop  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 0
            local.get 4
            local.get 4
            i32.const -1
            i32.add
            i32.atomic.rmw.cmpxchg offset=4
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 27
          i32.ne
          br_if 2 (;@1;)
        end
        local.get 0
        call $__pthread_rwlock_trywrlock
        local.tee 3
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $__pthread_rwlock_wrlock (type 4) (param i32) (result i32)
    local.get 0
    i32.const 0
    call $__pthread_rwlock_timedwrlock)
  (func $__pthread_setcancelstate (type 6) (param i32 i32) (result i32)
    (local i32)
    i32.const 28
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.gt_u
      br_if 0 (;@1;)
      global.get $__tls_base
      i32.const 4
      i32.add
      local.set 2
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.load8_u offset=36
        i32.store
      end
      local.get 2
      local.get 0
      i32.store8 offset=36
      i32.const 0
      local.set 2
    end
    local.get 2)
  (func $pthread_setspecific (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      global.get $__tls_base
      i32.const 4
      i32.add
      local.tee 2
      i32.load offset=68
      local.get 0
      i32.const 2
      i32.shl
      i32.add
      local.tee 0
      i32.load
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store
      local.get 2
      local.get 2
      i32.load8_u offset=38
      i32.const 1
      i32.or
      i32.store8 offset=38
    end
    i32.const 0)
  (func $__pthread_testcancel (type 1)
    call $__testcancel)
  (func $__testcancel (type 1))
  (func $wasi_thread_start (type 11) (param i32 i32)
    local.get 1
    i32.load
    global.set $__stack_pointer
    local.get 1
    i32.load offset=4
    global.set $__tls_base
    local.get 0
    local.get 1
    call $__wasi_thread_start_C
    i32.const 4836
    i32.const 0
    i32.atomic.store
    i32.const 4836
    i32.const 1
    memory.atomic.notify
    drop)
  (table (;0;) 9 9 funcref)
  (global $__stack_pointer (mut i32) (i32.const 72576))
  (global $__tls_base (mut i32) (i32.const 0))
  (global $__tls_size i32 (i32.const 112))
  (global $__tls_align i32 (i32.const 4))
  (global $GOT.data.internal.__memory_base i32 (i32.const 0))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "wasi_thread_start" (func $wasi_thread_start))
  (start $__wasm_init_memory)
  (elem (;0;) (i32.const 1) func $void*_std::__2::__thread_proxy_abi:ne210104_<std::__2::tuple<std::__2::unique_ptr<std::__2::__thread_struct__std::__2::default_delete<std::__2::__thread_struct>>__main::$_0>>_void*_ $std::__2::__thread_specific_ptr<std::__2::__thread_struct>::__at_thread_exit_void*_ $abort $__stdio_close $__stdio_write $__stdio_seek $__stdout_write $nodtor)
  (data $.tdata "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data $.rodata "%s failed to release mutex\00%s failed to acquire mutex\00-+   0X0x\00-0X+0X 0X-0x+0x 0x\00%s failed to broadcast\00nan\00inf\00__cxa_guard_release\00__cxa_guard_acquire\00bad_alloc was thrown in -fno-exceptions mode\00terminate_handler unexpectedly returned\00thread constructor failed\00__thread_specific_ptr construction failed\00thread::join failed\00mutex lock failed\00NAN\00INF\00.\00(null)\00system_error was thrown in -fno-exceptions mode with error %i and message \22%s\22\00libc++abi: \00Starting\0a\00Done\0a\00A C++11 thread\0a\00Support for formatting long double values is currently disabled.\0aTo enable it, add -lc-printscan-long-double to the link command.\0a\00\00\00\00\00x\0f\00\00Success\00Illegal byte sequence\00Domain error\00Result not representable\00Not a tty\00Permission denied\00Operation not permitted\00No such file or directory\00No such process\00File exists\00Value too large for data type\00No space left on device\00Out of memory\00Resource busy\00Interrupted system call\00Resource temporarily unavailable\00Invalid seek\00Cross-device link\00Read-only file system\00Directory not empty\00Connection reset by peer\00Operation timed out\00Connection refused\00Host is unreachable\00Address in use\00Broken pipe\00I/O error\00No such device or address\00No such device\00Not a directory\00Is a directory\00Text file busy\00Exec format error\00Invalid argument\00Argument list too long\00Symbolic link loop\00Filename too long\00Too many open files in system\00No file descriptors available\00Bad file descriptor\00No child process\00Bad address\00File too large\00Too many links\00No locks available\00Resource deadlock would occur\00State not recoverable\00Previous owner died\00Operation canceled\00Function not implemented\00No message of desired type\00Identifier removed\00Link has been severed\00Protocol error\00Bad message\00Not a socket\00Destination address required\00Message too large\00Protocol wrong type for socket\00Protocol not available\00Protocol not supported\00Not supported\00Address family not supported by protocol\00Address not available\00Network is down\00Network unreachable\00Connection reset by network\00Connection aborted\00No buffer space available\00Socket is connected\00Socket not connected\00Operation already in progress\00Operation in progress\00Stale file handle\00Quota exceeded\00Multihop attempted\00Capabilities insufficient\00\00\00u\02N\00\d6\01\e2\04\b9\04\18\01\8e\05\ed\02\16\04\f2\00\97\03\01\038\05\af\01\82\01O\03/\04\1e\00\d4\05\a2\00\12\03\1e\03\c2\01\de\03\08\00\ac\05\00\01d\02\f1\01e\054\02\8c\02\cf\02-\03L\04\e3\05\9f\02\f8\04\1c\05\08\05\b1\02K\05\15\02x\00R\02<\03\f1\03\e4\00\c3\03}\04\cc\00\aa\03y\05$\02n\01m\03\22\04\ab\04D\00\fb\01\ae\00\83\03`\00\e5\01\07\04\94\04^\04+\00X\019\01\92\00\c2\05\9b\01C\02F\01\f6\05\00\00\00\00\00\00\19\00\0b\00\19\19\19\00\00\00\00\05\00\00\00\00\00\00\09\00\00\00\00\0b\00\00\00\00\00\00\00\00\19\00\0a\0a\19\19\19\03\0a\07\00\01\1b\09\0b\18\00\00\09\06\0b\00\00\0b\00\06\19\00\00\00\19\19\19\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0e\00\00\00\00\00\00\00\00\19\00\0b\0d\19\19\19\00\0d\00\00\02\00\09\0e\00\00\00\09\00\0e\00\00\0e\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\00\13\00\00\00\00\09\0c\00\00\00\00\00\0c\00\00\0c\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0f\00\00\00\04\0f\00\00\00\00\09\10\00\00\00\00\00\10\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\00\00\00\00\11\00\00\00\00\11\00\00\00\00\09\12\00\00\00\00\00\12\00\00\12\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\1a\00\00\00\1a\1a\1a\00\00\00\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\17\00\00\00\00\17\00\00\00\00\09\14\00\00\00\00\00\14\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\15\00\00\00\00\09\16\00\00\00\00\00\16\00\00\16\00\000123456789ABCDEF")
  (data $.data "\03\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\06\00\00\00 \13\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00x\0f\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\06\00\00\00(\13\00\00\00\04\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\ff\ff\ff\ff\0a\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\02\00\00\02\00\00"))
