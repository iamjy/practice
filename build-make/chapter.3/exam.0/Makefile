#!/bin/bash

libops : interact.o sched.o gen.o
	ar r $@ $?

prog : prog_call.o libops(interact.o)
	${CC} -o $@ $^

clean:
	rm -f *.o
	-rm libops
	-rm prog
