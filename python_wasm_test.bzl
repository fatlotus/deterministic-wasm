"""Custom Bazel rule for Python WASM tests."""

load("//:wasm_test.bzl", "wasm_test")

def python_wasm_test(name, script, stdout):
    """
    Creates a WASM test for a Python script.
    
    Args:
        name: Name of the test target
        script: Python script file to test
        stdout: Expected stdout file
    """
    # Copy the Python script to test_data so it's available via VFS
    native.genrule(
        name = name + "_copy_script",
        srcs = [script],
        outs = [name + "_script.py"],
        cmd = "cp $< $@",
    )
    
    # Create a custom wasm_test that uses the Python runtime
    # The test harness will need to be modified to pass the script path as an argument
    wasm_test(
        name = name,
        wasm = "@python_wasi//:python.wasm",
        stdout = stdout,
        data = [":" + name + "_copy_script"],
    )
