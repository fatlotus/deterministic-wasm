load("@rules_rust//rust:defs.bzl", "rust_test")

def wasm_test(name, wasm, stdout, **kwargs):
    rust_test(
        name = name,
        srcs = ["//:tests/test_wasm.rs"],
        deps = [
            "//:deterministic_wasm_lib",
            "@crates//:tokio",
            "@crates//:similar",
        ],
        data = [
            wasm,
            stdout,
            "//:test_data",
        ],
        env = {
            "WASM_PATH": "$(rootpath %s)" % wasm,
            "STDOUT_PATH": "$(rootpath %s)" % stdout,
        },
        **kwargs
    )
