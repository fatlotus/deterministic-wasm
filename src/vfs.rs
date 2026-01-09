use std::collections::HashMap;
use std::path::Path;
use std::sync::{Arc, Mutex};
use std::io::Read;
use anyhow::{Result, anyhow};

#[derive(Debug, Clone)]
pub enum VfsNode {
    File(Vec<u8>),
    Directory,
}

pub struct VirtualFileSystem {
    pub nodes: Mutex<HashMap<String, VfsNode>>,
}

impl VirtualFileSystem {
    pub fn new() -> Self {
        let mut nodes = HashMap::new();
        nodes.insert("/".to_string(), VfsNode::Directory);
        nodes.insert(".".to_string(), VfsNode::Directory);
        Self { nodes: Mutex::new(nodes) }
    }

    pub fn add_file(&self, path: &str, content: Vec<u8>) {
        self.nodes.lock().unwrap().insert(path.to_string(), VfsNode::File(content));
    }

    pub fn from_host_path(host_path: &Path) -> Result<Self> {
        let vfs = Self::new();
        if !host_path.is_dir() {
            return Err(anyhow!("Path is not a directory: {:?}", host_path));
        }

        fn walk_dir(vfs: &VirtualFileSystem, current_host_path: &Path, current_vfs_path: &str) -> Result<()> {
            for entry in std::fs::read_dir(current_host_path)? {
                let entry = entry?;
                let path = entry.path();
                let name = entry.file_name().into_string().map_err(|_| anyhow!("Invalid filename"))?;
                let vfs_path = if current_vfs_path.is_empty() {
                    format!("/{}", name)
                } else {
                    format!("{}/{}", current_vfs_path, name)
                };

                if path.is_dir() {
                    vfs.nodes.lock().unwrap().insert(vfs_path.clone(), VfsNode::Directory);
                    walk_dir(vfs, &path, &vfs_path)?;
                } else {
                    let mut content = Vec::new();
                    std::fs::File::open(&path)?.read_to_end(&mut content)?;
                    vfs.nodes.lock().unwrap().insert(vfs_path.clone(), VfsNode::File(content.clone()));
                    if current_vfs_path.is_empty() {
                        vfs.nodes.lock().unwrap().insert(name.clone(), VfsNode::File(content.clone()));
                        vfs.nodes.lock().unwrap().insert(format!("./{}", name), VfsNode::File(content));
                    }
                }
            }
            Ok(())
        }

        walk_dir(&vfs, host_path, "")?;
        Ok(vfs)
    }
}

pub struct OpenFile {
    pub path: String,
    pub offset: u64,
}

pub struct WasiFs {
    pub vfs: Arc<VirtualFileSystem>,
    pub open_files: Mutex<HashMap<u32, OpenFile>>,
    pub next_fd: Mutex<u32>,
}

impl WasiFs {
    pub fn new(vfs: Arc<VirtualFileSystem>) -> Self {
        let mut open_files = HashMap::new();
        // FD 0, 1, 2 are reserved for stdin, stdout, stderr
        open_files.insert(0, OpenFile {
            path: "<stdin>".to_string(),
            offset: 0,
        });
        open_files.insert(1, OpenFile {
            path: "<stdout>".to_string(),
            offset: 0,
        });
        open_files.insert(2, OpenFile {
            path: "<stderr>".to_string(),
            offset: 0,
        });
        // FD 3 is often the pre-opened root directory
        open_files.insert(3, OpenFile {
            path: ".".to_string(),
            offset: 0,
        });

        Self {
            vfs,
            open_files: Mutex::new(open_files),
            next_fd: Mutex::new(4),
        }
    }
}
