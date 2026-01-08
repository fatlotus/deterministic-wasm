package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) < 1 {
		fmt.Printf("Error: os.Args is empty\n")
		os.Exit(1)
	}
	if os.Args[0] != "/main.wasm" {
		fmt.Printf("Error: os.Args[0] is %q, expected \"/main.wasm\"\n", os.Args[0])
		os.Exit(1)
	}
	fmt.Printf("Success: os.Args[0] is \"/main.wasm\"\n")
}
