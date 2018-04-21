#!/bin/bash

full_test:
	make trac.o "CFLAGS = -DSTATS -DBSD"
	make main.o "CFLAGS = -DBSD"
	${CC} -o $@ trac.o main.o

rebuild:
	make trac.o FRC=force_rebuild

force_rebuild:

trac.o : ${FRC}
