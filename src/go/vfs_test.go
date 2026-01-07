package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	fmt.Println("--- VFS Test ---")

	filesToTest := []string{"/test.txt", "test.txt", "./test.txt"}

	for _, path := range filesToTest {
		fmt.Printf("Testing path: %s\n", path)
		file, err := os.Open(path)
		if err == nil {
			scanner := bufio.NewScanner(file)
			if scanner.Scan() {
				fmt.Printf("Successfully read: %s\n", scanner.Text())
			} else {
				fmt.Println("File is empty or could not read line.")
			}
			file.Close()
		} else {
			fmt.Printf("Failed to open %s\n", path)
		}
	}
}
