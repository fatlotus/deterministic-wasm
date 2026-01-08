package main

import (
	"fmt"
	"os"
)

func main() {
	fmt.Println("--- ReadDir Test ---")
	entries, err := os.ReadDir(".")
	if err != nil {
		fmt.Println("Error reading dir:", err)
		return
	}

	for _, e := range entries {
		fmt.Println("Entry:", e.Name())
	}
}
