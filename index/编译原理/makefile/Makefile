

all: helloworld clean

helloworld: test.o hello.o 
		gcc -o helloworld test.o hello.o

hello.o: hello.c hello.h
		gcc -c hello.c

test.o: test.c hello.h
		gcc -c test.c

clean:
		rm -f test.o hello.o
