package main

import (
	"fmt"
	"sync"
	"time"
)

//go:wasmimport wasi model_checker_select
//go:noescape
func make_a_choice(options int32) int32

func MaybeSleep() {
	if make_a_choice(2) == 1 {
		time.Sleep(1 * time.Second)
	}
}

func main() {
	cnt := 0
	wg := &sync.WaitGroup{}
	wg.Go(func() {
		x := cnt
		MaybeSleep()
		cnt = x + 1
	})
	wg.Go(func() {
		x := cnt
		MaybeSleep()
		cnt = x + 1
	})
	wg.Wait()

	fmt.Printf("Total: %d\n", cnt)
}
