"""Bazel extension for downloading Python WASI build."""

def _python_wasi_repository_impl(repository_ctx):
    """Download and extract Python WASI build."""
    repository_ctx.download_and_extract(
        url = "https://github.com/brettcannon/cpython-wasi-build/releases/download/v3.13.11/python-3.13.11-wasi_sdk-24.zip",
        sha256 = "e99a617738ade87cd263aa46cace7173faa91b5de994499c83e49d132c40bb77",
    )
    
    # Create a BUILD file for the Python WASI runtime
    repository_ctx.file(
        "BUILD.bazel",
        content = """
exports_files([
    "python.wasm",
], visibility = ["//visibility:public"])

filegroup(
    name = "python_runtime",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "python_wasm",
    srcs = ["python.wasm"],
    visibility = ["//visibility:public"],
)
""",
    )

_python_wasi_repository = repository_rule(
    implementation = _python_wasi_repository_impl,
)

def _python_wasi_extension_impl(module_ctx):
    """Extension to register the Python WASI repository."""
    _python_wasi_repository(name = "python_wasi")
    return module_ctx.extension_metadata(
        reproducible = True,
        root_module_direct_deps = ["python_wasi"],
        root_module_direct_dev_deps = [],
    )

python_wasi = module_extension(
    implementation = _python_wasi_extension_impl,
)
