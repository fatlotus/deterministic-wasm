use walrus::ModuleConfig;
use anyhow::Result;

pub fn transform_wasm(input_bytes: &[u8]) -> Result<Vec<u8>> {
    let config = ModuleConfig::new();
    // Ensure we parse everything we need, though defaults are usually fine
    let mut module = config.parse(input_bytes)?;

    // 1. Inject imports
    let futex_wait_type = module.types.add(&[walrus::ValType::I32, walrus::ValType::I32, walrus::ValType::I64], &[walrus::ValType::I32]);
    let futex_wait_id = module.add_import_func("model-checker", "futex_wait", futex_wait_type).0;

    let futex_wait64_type = module.types.add(&[walrus::ValType::I32, walrus::ValType::I64, walrus::ValType::I64], &[walrus::ValType::I32]);
    let futex_wait64_id = module.add_import_func("model-checker", "futex_wait64", futex_wait64_type).0;

    let futex_notify_type = module.types.add(&[walrus::ValType::I32, walrus::ValType::I32], &[walrus::ValType::I32]);
    let futex_notify_id = module.add_import_func("model-checker", "futex_notify", futex_notify_type).0;

    // 2. Replace instructions
    for (_, func) in module.funcs.iter_local_mut() {
        let entry = func.entry_block();
        let mut collector = IdCollector { ids: vec![entry] };
        walrus::ir::dfs_in_order(&mut collector, func, entry);

        for seq_id in collector.ids {
            let block = func.block_mut(seq_id);
            let mut new_instrs = Vec::new();
            let mut modified = false;

            for (instr, loc) in &block.instrs {
                match instr {
                    walrus::ir::Instr::AtomicWait(wait) => {
                         if !wait.sixty_four {
                             new_instrs.push((walrus::ir::Instr::Call(walrus::ir::Call { func: futex_wait_id }), *loc));
                             modified = true;
                         } else {
                             new_instrs.push((walrus::ir::Instr::Call(walrus::ir::Call { func: futex_wait64_id }), *loc));
                             modified = true;
                         }
                    }
                    walrus::ir::Instr::AtomicNotify(_) => {
                        new_instrs.push((walrus::ir::Instr::Call(walrus::ir::Call { func: futex_notify_id }), *loc));
                        modified = true;
                    }
                    _ => {
                        new_instrs.push((instr.clone(), *loc));
                    }
                }
            }

            if modified {
                block.instrs = new_instrs;
            }
        }
    }

    Ok(module.emit_wasm())
}

struct IdCollector {
    ids: Vec<walrus::ir::InstrSeqId>,
}

impl walrus::ir::Visitor<'_> for IdCollector {
    fn visit_instr_seq_id(&mut self, instr_seq_id: &walrus::ir::InstrSeqId) {
        self.ids.push(*instr_seq_id);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_transform_notify() -> Result<()> {
        let wat = r#"
            (module
                (memory 1 1 shared)
                (func (export "test") (param i32 i32) (result i32)
                    local.get 0
                    local.get 1
                    memory.atomic.notify
                )
            )
        "#;
        let wasm = wat::parse_str(wat)?;
        let transformed = transform_wasm(&wasm)?;
        
        let config = ModuleConfig::new();
        let module = config.parse(&transformed)?;
        
        // Check imports
        let import = module.imports.find("model-checker", "futex_notify");
        assert!(import.is_some(), "futex_notify import not found");
        
        // Verify that the function calls futex_notify
        for (_, func) in module.funcs.iter_local() {
            let mut found_call = false;
            let mut found_notify = false;
            
            // We need to traverse the function body to find instructions
            // For this simple test, we can just look at the entry block assuming flat structure
            // or we use the same traversal logic as the transform, but let's just inspect the entry block
            // as the test case is simple.
            
            // Actually, we can use a visitor or just iterate if we know the structure.
            // But walrus instructions are in blocks.
            // Let's use the dfs_in_order to find all instructions.
            
            struct InstrFinder {
                found_call: bool,
                found_notify: bool,
                target_func: Option<walrus::FunctionId>,
            }
            
            impl walrus::ir::Visitor<'_> for InstrFinder {
                 fn visit_call(&mut self, instr: &walrus::ir::Call) {
                     if Some(instr.func) == self.target_func {
                         self.found_call = true;
                     }
                 }
                 fn visit_atomic_notify(&mut self, _instr: &walrus::ir::AtomicNotify) {
                     self.found_notify = true;
                 }
            }
            
            let mut finder = InstrFinder {
                found_call: false,
                found_notify: false,
                target_func: None,
            };
            
            if let Some(import_id) = import {
                 let import = module.imports.get(import_id);
                 if let walrus::ImportKind::Function(fid) = import.kind {
                     finder.target_func = Some(fid);
                 }
            }

            walrus::ir::dfs_in_order(&mut finder, func, func.entry_block());
            
            assert!(finder.found_call, "Function should call futex_notify");
            assert!(!finder.found_notify, "Function should NOT contain memory.atomic.notify");
        }
        
        Ok(())
    }
}
