CC=gcc
CFLAGS=-Wall -Wextra -pedantic -std=c11 -O2 -fopenmp 
LDFLAGS=-lm -pthread  

EXECUTABLE=para_grep

all: $(EXECUTABLE)

$(EXECUTABLE): para_grep.c
	$(CC) $(CFLAGS) -o $(EXECUTABLE) para_grep.c $(LDFLAGS)

.PHONY: clean test

clean:
	rm -f $(EXECUTABLE)

test: $(EXECUTABLE)
	@echo "Running test 1:"
	./$(EXECUTABLE) "sample" test.txt
	@echo "Running test 2:"
	./$(EXECUTABLE) "pattern" test.txt
	# Add more test cases as needed
