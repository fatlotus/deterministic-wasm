#include <cassert>
#include <cstdint>
#include <cstdio>
#include <unistd.h>

extern "C" {
__attribute__((import_module("wasi"), import_name("thread-spawn"))) int32_t
spawn_a_thread(void *thread_data);
}

int magic_number = 0;

[[clang::export_name("wasi_thread_start")]] void wasi_thread_start(int32_t tid,
                                                                   int *arg) {
  printf("Running on a thread. tid=%d, arg=%p, magic_number=%d\n", tid, arg,
         magic_number);
}

int main() {
  magic_number += 1;
  sleep(1);
  int thread_data;
  printf("thread_data=%p\n", &thread_data);
  int tid = spawn_a_thread(&thread_data);
  assert(tid > 0);
  sleep(1);
  printf("After\n");
}