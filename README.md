# Deterministic WASM Sandbox

A high-performance, deterministic WebAssembly sandbox built on [Wasmtime](https://github.com/bytecodealliance/wasmtime). This host environment ensures that WASM programs (including multi-threaded ones) execute with absolute predictability by controlling time, randomness, and scheduling.

## Features

- **Deterministic Multi-threading**: Custom cooperative scheduler for WASI threads.
- **Virtual Time**: `clock_time_get` returns a deterministic virtual clock that only advances when threads sleep or yield.
- **Deterministic Randomness**: `random_get` produces a fixed, predictable byte sequence.
- **Deterministic Sleep**: `poll_oneoff` is implemented via a virtual timeline, allowing programs to "sleep" without consuming real-world time.
- **Shared Memory Support**: Full support for atomic operations and shared memory across deterministic threads.

## Code Structure

The project is modularized for clarity and maintainability:

- **[main.rs](src/main.rs)**: The entry point. Handles Wasmtime engine configuration, module loading, and initial instantiation.
- **[scheduler.rs](src/scheduler.rs)**: The heart of the sandbox. Implements the `Scheduler` which manages `paused_threads` and `delayed_threads`.
- **[wasi_builtins.rs](src/wasi_builtins.rs)**: Contains the hand-rolled WASI snapshot preview1 implementation.
- **[memory.rs](src/memory.rs)**: Provides safe abstractions for WASM memory access.
- **[src/cpp/](src/cpp/)**: C++ test cases and their deterministic expectations.
- **[src/go/](src/go/)**: Go test cases compiled to WASM.
- **[src/wat/](src/wat/)**: Handwritten WebAssembly Text (WAT) tests.

## Usage

### 1. Build and Test with Bazel (Preferred)
The project is built and tested with Bazel for absolute reproducibility across Rust, Go, and C++.

```bash
# Build all components (Rust host, Go WASM, C++ tests)
bazel build //...

# Run all tests
bazel test //...

# Run the host binary directly
bazel run //:deterministic-wasm -- src/wat/proc_exit_test.wat

# Run a specific C++ test via Bazel
bazel test //src/cpp:threads_cpp_test
```

### 2. Manual Build (Legacy)
#### Build the host
```bash
cargo build
```

#### Compile tests
Tests are now compiled using Bazel. Using `compile-tests.sh` is deprecated and the script has been removed.
```bash
bazel build //src/cpp:model_checker_test_wasm
```

#### Run a WASM module
```bash
cargo run -- src/wat/proc_exit_test.wat
```

#### Passing Environment Variables
You can set environment variables for the WASM simulation using the `--env` flag. Multiple variables can be set by repeating the flag.

```bash
cargo run -- --env KEY1=value1 --env KEY2=value2 src/wat/env_test.wat
```

#### Tracing WASI Calls
You can print every WASI system call as it happens using the `--trace-wasi` flag. This is useful for debugging guest applications.

```bash
cargo run -- --trace-wasi src/wat/hello_wasi.wat
```

## Model Checker

The deterministic sandbox includes a built-in model checker that can systematically explore different execution paths in multi-threaded programs. This is particularly useful for finding race conditions and other concurrency bugs.

### How it Works
The model checker finds bugs by exploring different thread interleavings. It achieves this by:
1.  **WASM Transformation**: Is automatically runs a `transform_wasm` pass on your code to replace standard atomic instructions (`memory.atomic.wait32`, `memory.atomic.notify`) with calls to the model checker's built-in functions.
2.  **Deterministic Interleaving**: These built-ins yield control back to the scheduler, allowing it to pause threads and explore different wake-up orders.
3.  **Explicit Choices**: Programs can also use `model_checker_select(num_options)` to explicitly branch execution.

Programs can use the `model_checker_select(num_options)` WASI builtin (imported from the `wasi` module) to indicate a non-deterministic choice. 

When run with the `--model-check` flag, the host will:
1.  Execute the program multiple times.
2.  Each time `model_checker_select` is called, the host chooses one of the available options.
3.  The host maintains a queue of unexplored execution traces and continues running until all paths have been explored.

### Example: Finding a Race Condition
See `tests/model_checker_test.cpp` for a complete example. This test simulates two threads incrementing a shared variable without locking. By placing a `model_checker_select` call between the read and write operations, the model checker can force interleavings that reveal the race condition.

```bash
# Compile the test
bazel build //src/cpp:model_checker_test_wasm

# Run with the model checker
cargo run -- --model-check bazel-bin/src/cpp/model_checker_test.wasm
```

If a bug is found (e.g., the final value is incorrect), the program can `abort()`, which the host will report.

### Reproducing Bugs
When running with `--model-check`, the host prints a reproduction command for each execution trace. You can use this command to run just that specific interleaving:

```bash
# Example reproduction command
cargo run -- bazel-bin/src/cpp/model_checker_test.wasm --trace 1,0
```

The `--trace` argument takes a comma-separated list of choices for the `model_checker_select` calls.

## Testing

The sandbox uses a unified test harness. Tests are defined in `src/cpp/`, `src/go/`, and `src/wat/`. Each test consists of a source file and a corresponding `.stdout` file containing the expected deterministic output.

### Running Tests
```bash
# Run all tests using Bazel (recommended)
bazel test //...

# Run all tests using Cargo
cargo test
```

### Adding New Tests
1. Add your source file to the appropriate directory (`src/cpp/`, `src/go/`, or `src/wat/`).
2. Build the project with `bazel build //...`.
3. Create an expected `.stdout` file for your test. For C++ tests, use the naming convention `[name]_cpp.stdout`.
4. The Bazel build will automatically detect and create test targets using the `wasm_test` macro.

## How it Works

Instead of using the standard `wasmtime-wasi` crate, which inherits host-system non-determinism, this project implements a custom "Linker" that maps WASI syscalls to deterministic host functions. 

When a thread calls `poll_oneoff` (sleep) or `sched_yield`, it is placed into a queue. The host scheduler then picks the next available thread to run. If no threads are ready, virtual time is advanced to the next scheduled wake-up time in the `delayed_threads` priority queue.
