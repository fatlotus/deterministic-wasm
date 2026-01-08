use deterministic_wasm::{run_wasm, compile_module};
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
    // Check if we are running a specific test via environment variables
    if let (Ok(wasm_path), Ok(stdout_path)) = (std::env::var("WASM_PATH"), std::env::var("STDOUT_PATH")) {
        run_single_test(Path::new(&wasm_path), Path::new(&stdout_path)).await;
        return;
    }

    let mut tests_found = 0;
    
    // 1. Look for .wat files in the src/wat directory
    if let Ok(entries) = fs::read_dir("src/wat") {
        for entry in entries {
            let entry = entry.expect("failed to read entry");
            let path = entry.path();
            if path.extension().and_then(|s| s.to_str()) == Some("wat") {
                let stdout_path = path.with_extension("stdout");
                if stdout_path.exists() {
                    run_single_test(&path, &stdout_path).await;
                    tests_found += 1;
                }
            }
        }
    }

    // 2. Look for specific .wasm files in known locations (e.g., src/go, src/cpp)
    let wasm_tests = vec![
        ("src/go/model_checker_go.wasm", "src/go/model_checker_go.stdout"),
        ("src/go/vfs_test_go.wasm", "src/go/vfs_test_go.stdout"),
        ("src/go/env_test_go.wasm", "src/go/env_test_go.stdout"),
        ("src/go/random_test_go.wasm", "src/go/random_test_go.stdout"),
        ("src/go/threads_test_go.wasm", "src/go/threads_test_go.stdout"),
        ("src/cpp/vfs_test.wasm", "src/cpp/vfs_test_cpp.stdout"),
        ("src/cpp/env.wasm", "src/cpp/env_cpp.stdout"),
        ("src/cpp/random.wasm", "src/cpp/random_cpp.stdout"),
        ("src/cpp/threads.wasm", "src/cpp/threads_cpp.stdout"),
        ("src/cpp/model_checker_test.wasm", "src/cpp/model_checker_test_cpp.stdout"),
    ];

    for (wasm_path_str, stdout_path_str) in wasm_tests {
        let path = Path::new(wasm_path_str);
        let stdout_path = Path::new(stdout_path_str);
        if path.exists() && stdout_path.exists() {
            run_single_test(path, stdout_path).await;
            tests_found += 1;
        }
    }

    assert!(tests_found > 0, "No tests were found or run!");
}

async fn run_single_test(path: &Path, stdout_path: &Path) {
    println!("Running test: {:?}", path);
    let output_vec = Arc::new(Mutex::new(Vec::new()));
    let buffer = Buffer(output_vec.clone());
    
    let (tx, _rx) = tokio::sync::mpsc::unbounded_channel();
    let wasm_module = compile_module(path).expect("failed to compile wasm");
    run_wasm(
        wasm_module,
        Arc::new(Mutex::new(Box::new(buffer) as Box<dyn Write + Send>)),
        vec![],
        vec![], // envs
        Some(Path::new("test_data")),
        None,
        tx
    )
    .await
    .expect("failed to run wasm");

    let expected_output = fs::read_to_string(stdout_path).expect("failed to read expected output");
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
