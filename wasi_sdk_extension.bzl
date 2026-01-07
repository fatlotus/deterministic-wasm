load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _wasi_sdk_extension_impl(ctx):
    http_archive(
        name = "wasi_sdk_linux",
        urls = ["https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-29/wasi-sdk-29.0-x86_64-linux.tar.gz"],
        sha256 = "87d1d1a2879d139cdc624b968efad3d4a97b8078cdff95e63ac88ecafd1a0171",
        strip_prefix = "wasi-sdk-29.0-x86_64-linux",
        build_file_content = """
filegroup(
    name = "all_files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
""",
    )
    http_archive(
        name = "wasi_sdk_macos_arm64",
        urls = ["https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-29/wasi-sdk-29.0-arm64-macos.tar.gz"],
        sha256 = "e11552913e3f99e834d7fe7da1bd081abaf764759ed76b6097a34c63fc83665e",
        strip_prefix = "wasi-sdk-29.0-arm64-macos",
        build_file_content = """
filegroup(
    name = "all_files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
""",
    )
    http_archive(
        name = "wasi_sdk_macos_x86_64",
        urls = ["https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-29/wasi-sdk-29.0-x86_64-macos.tar.gz"],
        sha256 = "d0de2fd3ea5c57060efa87e4356c164bec3689972f2386f0c9a89c58e10cec8d",
        strip_prefix = "wasi-sdk-29.0-x86_64-macos",
        build_file_content = """
filegroup(
    name = "all_files",
    srcs = glob(["**/*"]),
    visibility = ["//visibility:public"],
)
""",
    )

wasi_sdk = module_extension(
    implementation = _wasi_sdk_extension_impl,
)
