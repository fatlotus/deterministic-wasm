#include <iostream>
#include <map>
#include <source_location>
#include <thread>
#include <unistd.h>

extern "C" {
__attribute__((import_module("wasi"), import_name("model_checker_select"))) //
int model_checker_select(int num_options);

__attribute__((import_module("wasi"), import_name("must_reach_underlying"))) //
void must_reach_underlying(const char* module, int lineno, int column_no);
}

void must_reach(
    std::source_location location = std::source_location::current()) {
  must_reach_underlying(location.file_name(), location.line(),
                        location.column());
}

// 1. Write a helper function that sleeps for one second if
// model_checker_select() returns 1.
void maybe_sleep() {
  if (model_checker_select(2) == 1) {
    sleep(1);
    printf("sleeping for one second\n");
  }
}

// 2. Write a basic C++ "database" using a map, with some integer keys.
std::map<int, int> db;
const int KEY = 42;

// Two threads trying to read the same key, increment it, and save it back,
// without having appropriate locking.
void worker() {
  // Read
  int val = db[KEY];

  // 3. Add conditional sleeps after each thread has read the value from the
  // map. That way, the model checker can control the ordering of the reads and
  // writes.
  maybe_sleep();

  // Increment and write back
  db[KEY] = val + 1;
}

int main() {
  db[KEY] = 0;

  // Start two threads that will try to concurrently edit the database.
  std::thread t1(worker);
  std::thread t2(worker);

  t1.join();
  t2.join();

  std::cout << "Final value: " << db[KEY] << std::endl;

  // 4. If the model checker finds an ordering that causes the value to be 1
  // (the bug), we'll abort to signal a failure.
  if (db[KEY] != 2) {
    must_reach(); // It fails!
    std::cout << "BUG FOUND: value is " << db[KEY] << std::endl;
  } else {
    must_reach(); // But not always!
  }

  return 0;
}
