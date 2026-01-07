package main

import (
	"crypto/rand"
	"fmt"
)

func main() {
	// crypto/rand uses the system random number generator (WASI random_get).
	b := make([]byte, 5)
	_, err := rand.Read(b)
	if err != nil {
		panic(err)
	}

	fmt.Println("Random numbers:")
	for _, v := range b {
		fmt.Println(int(v) % 100)
	}
}
