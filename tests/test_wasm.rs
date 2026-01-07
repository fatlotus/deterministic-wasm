use deterministic_wasm::run_wasm;
use std::fs;
use std::sync::{Arc, Mutex};
use std::io::Write;
use std::path::Path;

struct Buffer(Arc<Mutex<Vec<u8>>>);
impl Write for Buffer {
    fn write(&mut self, buf: &[u8]) -> std::io::Result<usize> {
        self.0.lock().unwrap().write(buf)
    }
    fn flush(&mut self) -> std::io::Result<()> {
        self.0.lock().unwrap().flush()
    }
}

#[tokio::test]
async fn run_all_wasm_tests() {
    let mut tests_found = 0;
    let entries = fs::read_dir("tests").expect("failed to read tests directory");

    for entry in entries {
        let entry = entry.expect("failed to read entry");
        let path = entry.path();

        if path.extension().and_then(|s| s.to_str()) == Some("wat") {
            let stdout_path = path.with_extension("stdout");
            if stdout_path.exists() {
                println!("Running test: {:?}", path);
                tests_found += 1;

                let output_vec = Arc::new(Mutex::new(Vec::new()));
                let buffer = Buffer(output_vec.clone());
                
                run_wasm(&path, Arc::new(Mutex::new(Box::new(buffer) as Box<dyn Write + Send>)), vec![], Some(Path::new("test_data")))
                    .await
                    .expect("failed to run wasm");

                let expected_output = fs::read_to_string(&stdout_path).expect("failed to read expected output");
                let actual_output = output_vec.lock().unwrap();
                let actual_output_str = String::from_utf8_lossy(&actual_output);

                if actual_output_str != expected_output {
                    use similar::{ChangeTag, TextDiff};
                    let diff = TextDiff::from_lines(expected_output.as_str(), &actual_output_str);
                    let mut diff_str = String::new();
                    for change in diff.iter_all_changes() {
                        let sign = match change.tag() {
                            ChangeTag::Delete => "-",
                            ChangeTag::Insert => "+",
                            ChangeTag::Equal => " ",
                        };
                        diff_str.push_str(&format!("{}{}", sign, change));
                    }

                    panic!(
                        "Test failed: {:?}\n\n--- EXPECTED (BEFORE) ---\n{}\n--- ACTUAL (AFTER) ---\n{}\n--- DIFF ---\n{}\n----------------",
                        path, expected_output, actual_output_str, diff_str
                    );
                }
            }
        }
    }

    assert!(tests_found > 0, "No tests were found or run!");
}
