#!/bin/bash

libops :: interact.c
	${CC} -c -DENTRY interact.c
	ar -r $@ interact.o
	rm -f interact.o

libops :: sched.c
	${CC} -c -DRECRD sched.c
	ar -r $@ sched.o
	rm -f sched.o

clean :
	rm -f *.o
	rm -f libops
