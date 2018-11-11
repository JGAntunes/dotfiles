package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	relative := os.Args[1]
	path := os.Args[2]
	relPath, err := filepath.Rel(path, relative)
	if err != nil {
		fmt.Println('.')
	}
	if !strings.HasPrefix(relPath, "../") {
		relPath = "./" + relPath
	}
	fmt.Println(relPath)
}
