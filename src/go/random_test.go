package main

import (
	"fmt"
	"math/rand"
)

func main() {
	// math/rand in Go requires a Source for determinism.
	// We'll use the same seed as the C++ test (0).
	r := rand.New(rand.NewSource(0))
	fmt.Println("Random numbers:")
	for i := 0; i < 5; i++ {
		fmt.Println(r.Intn(100))
	}
}
