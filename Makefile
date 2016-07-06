all: printff.o hello.o is_triangle.o multiplication_table.o

hello.o : hello.s
	@gcc  hello.s -o hello.o

is_triangle.o : is_triangle.s
	@gcc  is_triangle.s -o is_triangle.o

multiplication_table.o : multiplication_table.s
	@gcc  multiplication_table.s -o multiplication_table.o

printff.o : printff.s
	@gcc printff.s -o printff.o
clean:
	@rm -rf *.o 

.PHONY: all clean
