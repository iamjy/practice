CFLAGS= -O2 -Wall -pedantic
CPPFLAGS = -I.

all: lab1_hello lab2_hello

lab1_hello: lab1_hello.c

lab2_hello: lab2_hello_main.c lab2_hello_sub.c lab2_hello.h
-e 	gcc $(CPPFLAGS) $(CFLAGS) lab2*.c -o lab2_hello

clean:
-e 	rm -f lab1_hello lab2_hello *.o
