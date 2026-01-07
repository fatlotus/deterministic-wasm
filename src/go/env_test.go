package main

import (
	"fmt"
	"os"
)

func main() {
	user := os.Getenv("USER")
	if user != "" {
		fmt.Printf("USER=%s\n", user)
	} else {
		fmt.Println("USER not set")
	}
}
