package main

import (
	"flag"
	"fmt"
	"time"
)

func main() {
	flag.Parse()
	searchQuery := flag.Arg(0)
	inputFile := flag.Arg(1)
	if len(searchQuery) == 0 || len(inputFile) == 0 {
		fmt.Println("Usage: ./go-grep search_query filename.txt")
		return
	}
	start := time.Now() 

	Grep(searchQuery, inputFile)

	elapsed := time.Since(start)
	fmt.Println("Time taken:", elapsed)
}

 