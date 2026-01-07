#include <pthread.h>
#include <stdio.h>
#include <thread>

void *thread_func(void *arg) {
  printf("The thread is running!\n");
  return NULL;
}

int main() {
  printf("Starting\n");
  std::thread thd([] { printf("A C++11 thread\n"); });
  thd.join();
  printf("Done\n");

  //   pthread_t thread;
  //   pthread_attr_t attr;
  //   pthread_attr_init(&attr);
  //   // pthread_attr_setstacksize(&attr, 2048);
  //   if (pthread_create(&thread, &attr, thread_func, NULL) != 0) {
  //     perror("pthread_create");
  //     return 1;
  //   }
  //   pthread_join(thread, NULL);
  //   printf("Done\n");
  return 0;
}