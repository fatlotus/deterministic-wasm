use wasmtime::Linker;
use crate::scheduler::DeterministicThread;
use crate::memory::{read_mem, write_mem};
use crate::vfs::VfsNode;
use anyhow::{Result, anyhow};
use std::io::Write;

pub fn register_wasi_fs_builtins(linker: &mut Linker<DeterministicThread>) -> Result<()> {
    // fd_write: Used for printing to stdout/stderr or writing to files
    linker.func_wrap("wasi_snapshot_preview1", "fd_write", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, iovs_ptr: i32, iovs_len: i32, nwritten_ptr: i32| -> i32 {
        if fd == 1 || fd == 2 {
            // Handle stdout/stderr
            return (|| -> Result<i32> {
                let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
                let mut total_written = 0;
                let mut iovs_data = vec![0u8; (iovs_len * 8) as usize];
                read_mem(&caller, &export, iovs_ptr as usize, &mut iovs_data)?;

                for i in 0..iovs_len as usize {
                    let base = u32::from_le_bytes(iovs_data[i*8..i*8+4].try_into().unwrap()) as usize;
                    let len = u32::from_le_bytes(iovs_data[i*8+4..i*8+8].try_into().unwrap()) as usize;
                    let mut slice = vec![0u8; len];
                    read_mem(&caller, &export, base, &mut slice)?;

                    if fd == 1 {
                        let mut stdout = caller.data().stdout.lock().unwrap();
                        let _ = stdout.write_all(&slice);
                    } else {
                        eprint!("{}", String::from_utf8_lossy(&slice));
                    }
                    total_written += len;
                }

                let total_written_bytes = (total_written as u32).to_le_bytes();
                write_mem(&mut caller, &export, nwritten_ptr as usize, &total_written_bytes)?;
                Ok(0)
            })().unwrap_or_else(|e| {
                eprintln!("[Host] Error in fd_write: {}", e);
                29 // EIO
            });
        }
        
        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8,
        };

        let (path, mut offset) = {
            let open_files = wasi_fs.open_files.lock().unwrap();
            match open_files.get(&(fd as u32)) {
                Some(open_file) => (open_file.path.clone(), open_file.offset),
                None => return 8, // EBADF
            }
        };

        return (|| -> Result<i32> {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            let total_written;
            let mut iovs_data = vec![0u8; (iovs_len * 8) as usize];
            read_mem(&caller, &export, iovs_ptr as usize, &mut iovs_data)?;

            let mut all_data = Vec::new();
            for i in 0..iovs_len as usize {
                let base = u32::from_le_bytes(iovs_data[i*8..i*8+4].try_into().unwrap()) as usize;
                let len = u32::from_le_bytes(iovs_data[i*8+4..i*8+8].try_into().unwrap()) as usize;
                let mut slice = vec![0u8; len];
                read_mem(&caller, &export, base, &mut slice)?;
                all_data.extend_from_slice(&slice);
            }

            {
                let mut nodes = wasi_fs.vfs.nodes.lock().unwrap();
                let node = nodes.get_mut(&path).ok_or_else(|| anyhow!("File not found"))?;
                if let VfsNode::File(data) = node {
                    let end = offset as usize + all_data.len();
                    if end > data.len() {
                        data.resize(end, 0);
                    }
                    data[offset as usize..end].copy_from_slice(&all_data);
                    total_written = all_data.len();
                    offset += total_written as u64;
                } else {
                     return Ok(28); // EISDIR
                }
            }

            // Update offset back in open_files
            {
                let mut open_files = wasi_fs.open_files.lock().unwrap();
                if let Some(open_file) = open_files.get_mut(&(fd as u32)) {
                    open_file.offset = offset;
                }
            }

            let total_written_bytes = (total_written as u32).to_le_bytes();
            write_mem(&mut caller, &export, nwritten_ptr as usize, &total_written_bytes)?;
            Ok(0)
        })().unwrap_or_else(|e| {
            eprintln!("[Host] Error in fd_write: {}", e);
            29 // EIO
        });
    })?;

    // fd_read: Read from file descriptor
    linker.func_wrap("wasi_snapshot_preview1", "fd_read", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, iovs_ptr: i32, iovs_len: i32, nread_ptr: i32| -> i32 {
        if fd == 0 {
            let export = match caller.get_export("memory") {
                Some(e) => e,
                None => return 29, // EIO
            };
            // For stdin, we return 0 bytes (EOF) for now to allow initialization
            if write_mem(&mut caller, &export, nread_ptr as usize, &0u32.to_le_bytes()).is_ok() {
                return 0;
            }
            return 29;
        }

        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8,
        };
        let (path, mut offset) = {
            let open_files = wasi_fs.open_files.lock().unwrap();
            match open_files.get(&(fd as u32)) {
                Some(open_file) => (open_file.path.clone(), open_file.offset),
                None => return 8, // EBADF
            }
        };

        let result = (|| -> Result<i32> {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            let vfs = &wasi_fs.vfs;

            let nodes = vfs.nodes.lock().unwrap();
            let file_data = match nodes.get(&path) {
                Some(VfsNode::File(data)) => data,
                _ => return Ok(28), // EISDIR or similar
            };

            let mut total_read = 0;
            let mut iovs_data = vec![0u8; (iovs_len * 8) as usize];
            read_mem(&caller, &export, iovs_ptr as usize, &mut iovs_data)?;

            for i in 0..iovs_len as usize {
                let base = u32::from_le_bytes(iovs_data[i*8..i*8+4].try_into().unwrap()) as usize;
                let len = u32::from_le_bytes(iovs_data[i*8+4..i*8+8].try_into().unwrap()) as usize;

                let remaining = file_data.len().saturating_sub(offset as usize);
                let to_read = std::cmp::min(len, remaining);

                if to_read > 0 {
                    write_mem(&mut caller, &export, base, &file_data[offset as usize..offset as usize + to_read])?;
                    offset += to_read as u64;
                    total_read += to_read;
                }
                
                if to_read < len {
                    break;
                }
            }

            // Update offset back in open_files
            {
                let mut open_files = wasi_fs.open_files.lock().unwrap();
                if let Some(open_file) = open_files.get_mut(&(fd as u32)) {
                    open_file.offset = offset;
                }
            }

            let total_read_bytes = (total_read as u32).to_le_bytes();
            write_mem(&mut caller, &export, nread_ptr as usize, &total_read_bytes)?;
            Ok(0)
        })();

        match result {
            Ok(code) => code,
            Err(_) => 29, // EIO
        }
    })?;

    // fd_close: Closing a file descriptor
    linker.func_wrap("wasi_snapshot_preview1", "fd_close", |caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32| -> i32 {
        let wasi_fs = caller.data().wasi_fs.as_ref();
        if let Some(fs) = wasi_fs {
            let mut open_files = fs.open_files.lock().unwrap();
            if open_files.remove(&(fd as u32)).is_some() {
                return 0; // SUCCESS
            }
        }
        8 // EBADF
    })?;

    // fd_fdstat_get: Get file descriptor statistics
    linker.func_wrap("wasi_snapshot_preview1", "fd_fdstat_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, result_ptr: i32| -> i32 {
        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8, // EBADF
        };
        
        if fd == 0 || fd == 1 || fd == 2 {
            let export = caller.get_export("memory");
            if let Some(export) = export {
                let mut stat = [0u8; 24];
                stat[0] = 2; // Character device
                // Rights: 
                // FD_READ (2), FD_WRITE (64), FD_FDSTAT_SET_FLAGS (32), FD_FILESTAT_GET (2^25 = 33554432)
                let rights_base: u64 = if fd == 0 {
                    2 | 32 | 33554432
                } else {
                    64 | 32 | 33554432
                };
                stat[8..16].copy_from_slice(&rights_base.to_le_bytes());
                stat[16..24].copy_from_slice(&rights_base.to_le_bytes()); // rights_inheriting
                if write_mem(&mut caller, &export, result_ptr as usize, &stat).is_ok() {
                    return 0;
                }
            }
            return 29;
        }

        {
            let open_files = wasi_fs.open_files.lock().unwrap();
            if let Some(open_file) = open_files.get(&(fd as u32)) {
                let node_path = open_file.path.clone();
                drop(open_files); // Drop the lock early

                let export = caller.get_export("memory");
                if let Some(export) = export {
                    let mut stat = [0u8; 24];
                    let nodes = wasi_fs.vfs.nodes.lock().unwrap();
                    let node = nodes.get(&node_path);
                    stat[0] = match node {
                        Some(VfsNode::File(_)) => 4, // Regular file
                        Some(VfsNode::Directory) => 3, // Directory
                        _ => 0, // Unknown
                    };
                    
                    let rights_base: u64 = 0x2 | 0x40; // FD_READ | FD_WRITE (simplification)
                    stat[8..16].copy_from_slice(&rights_base.to_le_bytes());

                    if write_mem(&mut caller, &export, result_ptr as usize, &stat).is_ok() {
                        return 0;
                    }
                }
            }
        }
        8 // EBADF
    })?;

    // fd_prestat_get: Get preopen statistics
    linker.func_wrap("wasi_snapshot_preview1", "fd_prestat_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, result_ptr: i32| -> i32 {
        if fd == 3 {
             let export = caller.get_export("memory");
             if let Some(export) = export {
                 let mut prestat = [0u8; 8];
                 prestat[0] = 0; // preopentype_dir
                 let name_len: u32 = 1; // "." or "/" -> length 1
                 prestat[4..8].copy_from_slice(&name_len.to_le_bytes());
                 if write_mem(&mut caller, &export, result_ptr as usize, &prestat).is_ok() {
                     return 0;
                 }
             }
             return 29;
        }
        8 // EBADF
    })?;

    // fd_prestat_dir_name: Get preopen directory name
    linker.func_wrap("wasi_snapshot_preview1", "fd_prestat_dir_name", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, path_ptr: i32, path_len: i32| -> i32 {
        if fd == 3 {
             let export = caller.get_export("memory");
             if let Some(export) = export {
                 if path_len >= 1 {
                     if write_mem(&mut caller, &export, path_ptr as usize, b".").is_ok() {
                         return 0;
                     }
                 }
             }
             return 29;
        }
        8 // EBADF
    })?;
    // path_open: Open path
    linker.func_wrap("wasi_snapshot_preview1", "path_open", |mut caller: wasmtime::Caller<'_, DeterministicThread>, _dir_fd: i32, _dirflags: i32, path_ptr: i32, path_len: i32, _oflags: i32, _fs_rights_base: u64, _fs_rights_inheriting: u64, _fdflags: i32, result_ptr: i32| -> i32 {
        let (_path_str_out, new_fd) = (|| -> Result<(String, u32)> {
            let export = caller.get_export("memory").ok_or_else(|| anyhow::anyhow!("memory export not found"))?;
            let mut path_bytes = vec![0u8; path_len as usize];
            read_mem(&caller, &export, path_ptr as usize, &mut path_bytes)?;
            let path = String::from_utf8(path_bytes)?;

            let wasi_fs = caller.data().wasi_fs.as_ref().ok_or_else(|| anyhow::anyhow!("WASI FS not initialized"))?.clone();

            let dir_path = {
                let open_files = wasi_fs.open_files.lock().unwrap();
                match open_files.get(&(_dir_fd as u32)) {
                    Some(open_file) => open_file.path.clone(),
                    None => return Err(anyhow!("Bad dir_fd: {}", _dir_fd)),
                }
            };
            
            // Join dir_path and path
            // Handle cases where dir_path is "." (root)
            let mut resolved_path = if dir_path == "." {
                path.clone()
            } else {
                // simple slash join
                 format!("{}/{}", dir_path, path)
            };

            // Normalize: remove leading ./ or /
            if resolved_path.starts_with("./") {
                resolved_path = resolved_path[2..].to_string();
            }
            if resolved_path.starts_with('/') {
                resolved_path = resolved_path[1..].to_string();
            }
            // Simple normalization to remove duplicate slashes if any
            resolved_path = resolved_path.replace("//", "/");


            // Check if file exists in VFS
            let nodes = wasi_fs.vfs.nodes.lock().unwrap();
            if !nodes.contains_key(&resolved_path) {
                 return Err(anyhow!("File not found: {} (resolved: {})", path, resolved_path));
            }
            
            let final_path = resolved_path;
            drop(nodes);

            let mut next_fd = wasi_fs.next_fd.lock().unwrap();
            let fd = *next_fd;
            *next_fd += 1;

            let mut open_files = wasi_fs.open_files.lock().unwrap();
            open_files.insert(fd, crate::vfs::OpenFile {
                path: final_path,
                offset: 0,
            });

            Ok((fd.to_string(), fd))
        })().unwrap_or_else(|_e| {
            // eprintln!("[Host] Error in path_open: {}", _e);
            (String::new(), 0)
        });

        if new_fd == 0 {
            return 44; // ENOENT
        }

        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, result_ptr as usize, &new_fd.to_le_bytes()).unwrap();
        0
    })?;

    // fd_fdstat_set_flags: Set file descriptor flags (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_fdstat_set_flags", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _flags: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_seek: Seek in file descriptor
    linker.func_wrap("wasi_snapshot_preview1", "fd_seek", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, offset: i64, whence: i32, result_ptr: i32| -> i32 {
        if fd >= 0 && fd <= 2 {
            return 52; // ESPIPE - cannot seek on stdin/stdout/stderr
        }

        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8, // EBADF
        };

        let mut open_files = wasi_fs.open_files.lock().unwrap();
        let open_file = match open_files.get_mut(&(fd as u32)) {
            Some(f) => f,
            None => return 8, // EBADF
        };

        let nodes = wasi_fs.vfs.nodes.lock().unwrap();
        let file_size = match nodes.get(&open_file.path) {
            Some(VfsNode::File(data)) => data.len() as u64,
            Some(VfsNode::Directory) => 0,
            None => return 44, // ENOENT
        };

        let new_offset = match whence {
            0 => offset as u64, // SET
            1 => (open_file.offset as i64 + offset) as u64, // CUR
            2 => (file_size as i64 + offset) as u64, // END
            _ => return 28, // EINVAL
        };

        open_file.offset = new_offset;
        
        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, result_ptr as usize, &new_offset.to_le_bytes()).unwrap();
        0 // SUCCESS
    })?;

    // fd_filestat_get: Get file descriptor statistics
    linker.func_wrap("wasi_snapshot_preview1", "fd_filestat_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, result_ptr: i32| -> i32 {
        if fd == 0 || fd == 1 || fd == 2 {
            let mut stat = [0u8; 64];
            stat[16] = 2; // Character device
            let export = match caller.get_export("memory") {
                Some(e) => e,
                None => return 29,
            };
            if write_mem(&mut caller, &export, result_ptr as usize, &stat).is_ok() {
                return 0;
            }
            return 29;
        }

        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8, // EBADF
        };

        let open_files = wasi_fs.open_files.lock().unwrap();
        let open_file = match open_files.get(&(fd as u32)) {
            Some(f) => f,
            None => return 8, // EBADF
        };

        let nodes = wasi_fs.vfs.nodes.lock().unwrap();
        let (filetype, size) = match nodes.get(&open_file.path) {
            Some(VfsNode::File(data)) => (4, data.len() as u64),
            Some(VfsNode::Directory) => (3, 0),
            None => return 44, // ENOENT
        };

        let mut stat = [0u8; 64];
        stat[16] = filetype; // filetype
        stat[32..40].copy_from_slice(&size.to_le_bytes()); // size
        
        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, result_ptr as usize, &stat).unwrap();
        0 // SUCCESS
    })?;

    // fd_advise: Provide advice about an open file (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_advise", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _offset: i64, _len: i64, _advice: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_allocate: Allocate extra space for a file (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_allocate", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _offset: i64, _len: i64| -> i32 {
        0 // SUCCESS
    })?;

    // fd_datasync: Synchronize the data of a file to disk (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_datasync", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_fdstat_set_rights: Set the rights of a file descriptor (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_fdstat_set_rights", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _fs_rights_base: u64, _fs_rights_inheriting: u64| -> i32 {
        0 // SUCCESS
    })?;

    // fd_filestat_set_size: Adjust the size of an open file (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_filestat_set_size", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _size: i64| -> i32 {
        0 // SUCCESS
    })?;

    // fd_filestat_set_times: Adjust the times of an open file (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_filestat_set_times", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _atim: i64, _mtim: i64, _fst_flags: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_pread: Read from a file descriptor at a given offset (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_pread", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _iovs_ptr: i32, _iovs_len: i32, _offset: i64, _nread_ptr: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_pwrite: Write to a file descriptor at a given offset (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_pwrite", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _iovs_ptr: i32, _iovs_len: i32, _offset: i64, _nwritten_ptr: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_readdir: Read directory entries from a directory (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_readdir", |mut caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _buf_ptr: i32, _buf_len: i32, _cookie: i64, bufused_ptr: i32| -> i32 {
        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, bufused_ptr as usize, &0u32.to_le_bytes()).unwrap();
        0 // SUCCESS
    })?;

    // fd_renumber: Atomically replace a file descriptor (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_renumber", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _to: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_sync: Synchronize the data and metadata of a file to disk (stub)
    linker.func_wrap("wasi_snapshot_preview1", "fd_sync", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32| -> i32 {
        0 // SUCCESS
    })?;

    // fd_tell: Return the current offset of a file descriptor
    linker.func_wrap("wasi_snapshot_preview1", "fd_tell", |mut caller: wasmtime::Caller<'_, DeterministicThread>, fd: i32, result_ptr: i32| -> i32 {
        let wasi_fs = match caller.data().wasi_fs.as_ref() {
            Some(fs) => fs.clone(),
            None => return 8, // EBADF
        };

        let open_files = wasi_fs.open_files.lock().unwrap();
        let open_file = match open_files.get(&(fd as u32)) {
            Some(f) => f,
            None => return 8, // EBADF
        };

        let offset = open_file.offset;
        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, result_ptr as usize, &offset.to_le_bytes()).unwrap();
        0 // SUCCESS
    })?;

    // path_create_directory: Create a directory (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_create_directory", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _path_ptr: i32, _path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_filestat_get: Return the attributes of a file or directory
    linker.func_wrap("wasi_snapshot_preview1", "path_filestat_get", |mut caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _flags: i32, path_ptr: i32, path_len: i32, result_ptr: i32| -> i32 {
        let (filetype, size) = (|| -> Result<(u8, u64)> {
            let export = caller.get_export("memory").ok_or_else(|| anyhow!("memory export not found"))?;
            let mut path_bytes = vec![0u8; path_len as usize];
            read_mem(&caller, &export, path_ptr as usize, &mut path_bytes)?;
            let path = String::from_utf8(path_bytes)?;

            let wasi_fs = caller.data().wasi_fs.as_ref().ok_or_else(|| anyhow!("WASI FS not initialized"))?;
            
            let mut normalized_path = path.clone();
            if normalized_path.starts_with("./") {
                normalized_path = normalized_path[2..].to_string();
            }
            if normalized_path.starts_with('/') {
                normalized_path = normalized_path[1..].to_string();
            }

            let nodes = wasi_fs.vfs.nodes.lock().unwrap();
            let node = nodes.get(&normalized_path)
                .or_else(|| nodes.get(&path))
                .ok_or_else(|| anyhow!("File not found: {}", path))?;

            match node {
                VfsNode::File(data) => Ok((4, data.len() as u64)),
                VfsNode::Directory => Ok((3, 0)),
            }
        })().unwrap_or((0, 0));

        if filetype == 0 {
            return 44; // ENOENT
        }

        let mut stat = [0u8; 64];
        stat[16] = filetype;
        stat[32..40].copy_from_slice(&size.to_le_bytes());

        let export = caller.get_export("memory").unwrap();
        write_mem(&mut caller, &export, result_ptr as usize, &stat).unwrap();
        0 // SUCCESS
    })?;

    // path_filestat_set_times: Adjust the times of a file or directory (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_filestat_set_times", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _flags: i32, _path_ptr: i32, _path_len: i32, _atim: i64, _mtim: i64, _fst_flags: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_link: Create a hard link (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_link", |_caller: wasmtime::Caller<'_, DeterministicThread>, _old_fd: i32, _old_flags: i32, _old_path_ptr: i32, _old_path_len: i32, _new_fd: i32, _new_path_ptr: i32, _new_path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_readlink: Read the contents of a symbolic link (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_readlink", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _path_ptr: i32, _path_len: i32, _buf_ptr: i32, _buf_len: i32, _bufused_ptr: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_remove_directory: Remove a directory (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_remove_directory", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _path_ptr: i32, _path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_rename: Rename a file or directory (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_rename", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _old_path_ptr: i32, _old_path_len: i32, _new_fd: i32, _new_path_ptr: i32, _new_path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_symlink: Create a symbolic link (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_symlink", |_caller: wasmtime::Caller<'_, DeterministicThread>, _old_path_ptr: i32, _old_path_len: i32, _fd: i32, _new_path_ptr: i32, _new_path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    // path_unlink_file: Unlink a file (stub)
    linker.func_wrap("wasi_snapshot_preview1", "path_unlink_file", |_caller: wasmtime::Caller<'_, DeterministicThread>, _fd: i32, _path_ptr: i32, _path_len: i32| -> i32 {
        0 // SUCCESS
    })?;

    Ok(())
}
