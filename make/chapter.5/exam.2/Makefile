#!/bin/bash

OBJS = trac.o main.o
OBJS_STATS = trac_stats.o main_stats.o

trac : ${OBJS}
	${CC} -o $@ ${OBJS}

full_test : ${OBJS_STATS}
	${CC} -o $@ ${OBJS_STATS}

trac_stats.o : trac.c
	${CC} ${CFLAGS} -DSTATS -DBSD -c $?
	mv trac.o $@

main_stats.o : main.c
	${CC} ${CFLAGS} -DSTATS -DBSD -c $?
	mv main.o $@

