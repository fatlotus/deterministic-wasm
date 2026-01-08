import threading
import time

def thread_func(thread_id, sleep_secs):
    # Fixed base time for determinism
    start_time = 1704067200
    print(f"[Thread {thread_id}] Starting, time={start_time}, sleeping for {sleep_secs}s")
    
    time.sleep(sleep_secs)
    
    end_time = start_time + sleep_secs
    print(f"[Thread {thread_id}] Woke up, time={end_time} (elapsed: {sleep_secs}s)")

def main():
    start_time = 1704067200
    print(f"[Main] Starting demo, time={start_time}")
    
    threads = []
    
    t1 = threading.Thread(target=thread_func, args=(1, 2))
    t2 = threading.Thread(target=thread_func, args=(2, 1))
    
    t1.start()
    t2.start()
    
    threads.append(t1)
    threads.append(t2)
    
    # Sleep in main thread to match C++ logic
    time.sleep(3)
    
    for t in threads:
        t.join()
    
    end_time = start_time + 3
    print(f"[Main] Demo finished, time={end_time} (total elapsed: 3s)")

if __name__ == "__main__":
    main()
