CFLAGS=-ggdb -std=gnu99 -O2 -pthread -Wall #--save-temps

OBJ = main.o
SRC = $(OBJ:.o=.c)
CPP = $(OBJ:.o=.i)


all: main

$(OBJ): $(SRC)
	gcc $(CFLAGS) -c $(SRC)

main: $(OBJ)
	gcc $(OBJ) -o $@

cpp: $(SRC)
	gcc -E $(SRC) -o $(CPP)

.PHONY: list
list:
	@ls $(SRC)


.PHONY: clean
clean:
	rm -rf main main.i main.o main.s
