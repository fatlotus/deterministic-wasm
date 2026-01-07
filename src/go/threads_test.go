package main

import (
	"fmt"
	"sync"
	"time"
)

func threadFunc(id int, sleepSecs int) {
	// WASI doesn't have a real time(NULL) that behaves exactly like C's time() in a deterministic VM
	// if we are mocking it. But we'll follow the C++ structure.
	start := time.Unix(1704067200, 0) // Fixed base time for determinism
	fmt.Printf("[Thread %d] Starting, time=%d, sleeping for %ds\n", id, start.Unix(), sleepSecs)

	time.Sleep(time.Duration(sleepSecs) * time.Second)

	end := start.Add(time.Duration(sleepSecs) * time.Second)
	fmt.Printf("[Thread %d] Woke up, time=%d (elapsed: %ds)\n", id, end.Unix(), sleepSecs)
}

func main() {
	start := time.Unix(1704067200, 0)
	fmt.Printf("[Main] Starting demo, time=%d\n", start.Unix())

	wg := &sync.WaitGroup{}

	wg.Go(func() {
		threadFunc(1, 2)
	})

	wg.Go(func() {
		threadFunc(2, 1)
	})

	// In the deterministic VM, we don't need to sleep to wait for threads
	// if we use a WaitGroup or if the scheduler handles it.
	// But to match the C++ logic:
	time.Sleep(3 * time.Second)

	end := start.Add(3 * time.Second)
	fmt.Printf("[Main] Demo finished, time=%d (total elapsed: %ds)\n", end.Unix(), 3)
}
