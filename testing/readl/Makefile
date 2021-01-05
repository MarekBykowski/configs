CFLAGS=-ggdb -std=gnu99 -O2 -pthread -Wall --save-temps

OBJ = main.o
SRC = $(OBJ:.o=.c)

all: main

$(OBJ): $(SRC)
	gcc $(CFLAGS) -c $(SRC)

main: $(OBJ)
	gcc $(OBJ) -o $@

.PHONY: clean
clean:
	rm -rf main
