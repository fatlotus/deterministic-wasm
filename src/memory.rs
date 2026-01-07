use crate::scheduler::DeterministicThread;
use anyhow::{Result, anyhow};

pub fn read_mem(caller: &wasmtime::Caller<'_, DeterministicThread>, export: &wasmtime::Extern, offset: usize, buffer: &mut [u8]) -> Result<()> {
    if let Some(memory) = export.clone().into_memory() {
        memory.read(caller, offset, buffer).map_err(|e| anyhow!("Memory read failed: {}", e))?;
    } else if let Some(shared_memory) = export.clone().into_shared_memory() {
        unsafe {
            let data = shared_memory.data().as_ptr() as *const u8;
            std::ptr::copy_nonoverlapping(data.add(offset), buffer.as_mut_ptr(), buffer.len());
        }
    } else {
        return Err(anyhow!("Memory export is not memory or shared memory"));
    }
    Ok(())
}

pub fn write_mem(caller: &mut wasmtime::Caller<'_, DeterministicThread>, export: &wasmtime::Extern, offset: usize, buffer: &[u8]) -> Result<()> {
    if let Some(memory) = export.clone().into_memory() {
        memory.write(caller, offset, buffer).map_err(|e| anyhow!("Memory write failed: {}", e))?;
    } else if let Some(shared_memory) = export.clone().into_shared_memory() {
        unsafe {
            let data = shared_memory.data().as_ptr() as *mut u8;
            std::ptr::copy_nonoverlapping(buffer.as_ptr(), data.add(offset), buffer.len());
        }
    } else {
        return Err(anyhow!("Memory export is not memory or shared memory"));
    }
    Ok(())
}
