#!/bin/bash -ex

WASI_SYSROOT="/Users/jeremyarcher/Downloads/wasi-sdk-29.0-arm64-macos/share/wasi-sysroot"
CLANG="/opt/homebrew/opt/llvm/bin/clang++"

for cpp_file in src/cpp/*.cpp; do
  [ -e "$cpp_file" ] || continue
  basename=$(basename "$cpp_file" .cpp)
  wasm_file="tests/$basename.wasm"
  echo "Compiling $cpp_file to $wasm_file..."
  $CLANG -O2 -Wl,--import-memory,--export-memory -Wl,--max-memory=$((1<<32)) \
    --std=c++20 -fno-exceptions -g --target=wasm32-wasip1-threads \
    --sysroot="$WASI_SYSROOT" \
    "$cpp_file" -o "$wasm_file"
  # Transform the WASM file to use model-checker builtins for futexes
  cargo run --quiet --bin transform_wasm -- "$wasm_file" --output "$wasm_file"
  
  wasm2wat --enable-all "$wasm_file" -o "tests/$basename.wat"
  rm "$wasm_file"
done
