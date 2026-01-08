(module
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))
  (import "wasi_snapshot_preview1" "fd_readdir" (func $fd_readdir (param i32 i32 i32 i64 i32) (result i32)))
  (memory 1)
  (export "memory" (memory 0))

  (data (i32.const 0) "Entry: ") ;; 7 bytes
  (data (i32.const 8) "\n")      ;; 1 byte

  ;; Buffer for fd_write iovec
  ;; 16: iov_base for "Entry: "
  ;; 20: iov_len for "Entry: "
  ;; 24: iov_base for Name
  ;; 28: iov_len for Name
  ;; 32: iov_base for "\n"
  ;; 36: iov_len for "\n"

  ;; Buffer for readdir entries starts at 1024
  (global $buf_ptr i32 (i32.const 1024))
  (global $buf_len i32 (i32.const 4096))
  (global $bufused_ptr i32 (i32.const 1020))

  (func $print_entry (param $name_ptr i32) (param $name_len i32)
    (local $iovs_ptr i32)
    (local $nwritten_ptr i32)
    
    (local.set $iovs_ptr (i32.const 16))
    (local.set $nwritten_ptr (i32.const 100))

    ;; Setup iovs
    ;; iov[0] = "Entry: "
    (i32.store (i32.const 16) (i32.const 0))
    (i32.store (i32.const 20) (i32.const 7))

    ;; iov[1] = Name
    (i32.store (i32.const 24) (local.get $name_ptr))
    (i32.store (i32.const 28) (local.get $name_len))

    ;; iov[2] = "\n"
    (i32.store (i32.const 32) (i32.const 8))
    (i32.store (i32.const 36) (i32.const 1))

    (call $fd_write
      (i32.const 1)     ;; fd=1 (stdout)
      (local.get $iovs_ptr)
      (i32.const 3)     ;; iovs_len=3
      (local.get $nwritten_ptr)
    )
    drop
  )

  (func $start (export "_start")
    (local $res i32)
    (local $offset i32)
    (local $end i32)
    (local $namelen i32)
    (local $name_ptr i32)
    (local $rec_len i32)

    ;; Call fd_readdir(3, buf, len, 0, bufused_ptr)
    (call $fd_readdir
      (i32.const 3)           ;; fd=3 (preopen .)
      (global.get $buf_ptr)
      (global.get $buf_len)
      (i64.const 0)           ;; cookie=0
      (global.get $bufused_ptr)
    )
    local.set $res

    (if (i32.ne (local.get $res) (i32.const 0))
      (then return)
    )

    ;; Iterate buffer
    ;; bufused is at 1020
    (local.set $end (i32.add (global.get $buf_ptr) (i32.load (global.get $bufused_ptr))))
    (local.set $offset (global.get $buf_ptr))

    (loop $iter
      (if (i32.ge_u (local.get $offset) (local.get $end))
        (then return)
      )

      ;; dirent structure:
      ;; 0: d_next (8)
      ;; 8: d_ino (8)
      ;; 16: d_namlen (4)
      ;; 20: d_type (1)
      ;; 21: pad (3)
      ;; 24: name...

      ;; Read d_namlen from offset+16
      (local.set $namelen (i32.load (i32.add (local.get $offset) (i32.const 16))))
      
      ;; Name starts at offset+24
      (local.set $name_ptr (i32.add (local.get $offset) (i32.const 24)))

      ;; Print entry
      (call $print_entry (local.get $name_ptr) (local.get $namelen))

      ;; Next entry starts at offset + 24 + namelen
      (local.set $offset (i32.add (local.get $offset) (i32.add (i32.const 24) (local.get $namelen))))

      (br $iter)
    )
  )
)
