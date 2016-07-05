all: hello.o is_triangle.o

hello.o : hello.s
	gcc  hello.s -o hello.o

is_triangle.o : is_triangle.s
	gcc  is_triangle.s -o is_triangle.o

clean:
	rm -rf *.o 

.PHONY: all clean
