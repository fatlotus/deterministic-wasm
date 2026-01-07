#include <sched.h>
#include <stdio.h>
#include <thread>
#include <time.h>
#include <unistd.h>

void thread_func(int id, int sleep_secs) {
  time_t start = time(NULL);
  printf("[Thread %d] Starting, time=%ld, sleeping for %ds\n", id, (long)start,
         sleep_secs);
  sleep(sleep_secs);
  time_t end = time(NULL);
  printf("[Thread %d] Woke up, time=%ld (elapsed: %lds)\n", id, (long)end,
         (long)(end - start));
}

int main() {
  time_t start = time(NULL);
  printf("[Main] Starting demo, time=%ld\n", (long)start);

  // Spawn thread 1: sleeps for 2 seconds
  std::thread t1([]() { thread_func(1, 2); });
  t1.detach();

  // Spawn thread 2: sleeps for 1 second
  std::thread t2([]() { thread_func(2, 1); });
  t2.detach();

  // Yield to let threads start
  sched_yield();

  // Sleep for 3 seconds to let child threads finish
  sleep(3);

  time_t end = time(NULL);
  printf("[Main] Demo finished, time=%ld (total elapsed: %lds)\n", (long)end,
         (long)(end - start));

  return 0;
}