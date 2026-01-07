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
- **[scheduler.rs](src/scheduler.rs)**: The heart of the sandbox. Implements the `Scheduler` which manages `paused_threads` and `delayed_threads` (priority queue for sleeps).
- **[builtins.rs](src/builtins.rs)**: Contains the hand-rolled WASI snapshot preview1 implementation. This is where `fd_write`, `clock_time_get`, `poll_oneoff`, and `thread-spawn` are defined.
- **[memory.rs](src/memory.rs)**: Provides safe abstractions for reading and writing to both standard and shared WASM memory.

## Usage

### 1. Build the host
```bash
cargo build
```

### 2. Compile tests
Compile all C++ files in the `tests/` directory:
```bash
./compile-tests.sh
```

### 3. Run a WASM module
```bash
cargo run -- tests/example-cpp.wasm
```

## Testing

The sandbox includes an integration test harness that automatically runs all `.wasm` files in the `tests/` directory and compares their `stdout` against expected `.stdout` files.

### Running Tests
```bash
cargo test
```

### Adding New Tests
1. Add your `.cpp` file to the `tests/` directory.
2. Run `./compile-tests.sh` to generate the `.wasm` file.
3. Create a corresponding `.stdout` file with the expected output, or use the "bless" utility to generate it from the current execution:
```bash
cargo run --example bless tests/your-test.wasm
```

## How it Works

Instead of using the standard `wasmtime-wasi` crate, which inherits host-system non-determinism, this project implements a custom "Linker" that maps WASI syscalls to deterministic host functions. 

When a thread calls `poll_oneoff` (sleep) or `sched_yield`, it is placed into a queue. The host scheduler then picks the next available thread to run. If no threads are ready, virtual time is advanced to the next scheduled wake-up time in the `delayed_threads` priority queue.
