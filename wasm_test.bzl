load("@rules_rust//rust:defs.bzl", "rust_test")

def wasm_test(name, wasm, stdout, args = [], data = [], **kwargs):
    env = {
        "WASM_PATH": "$(rootpath %s)" % wasm,
        "STDOUT_PATH": "$(rootpath %s)" % stdout,
    }
    
    # If args are provided, pass them as a comma-separated list
    if args:
        env["WASM_ARGS"] = ",".join(args)
    
    # Merge additional data with default test_data
    all_data = [
        wasm,
        stdout,
        "//:test_data",
    ] + data
    
    rust_test(
        name = name,
        srcs = ["//:tests/test_wasm.rs"],
        deps = [
            "//:deterministic_wasm_lib",
            "@crates//:tokio",
            "@crates//:similar",
        ],
        data = all_data,
        env = env,
        **kwargs
    )
