#!/bin/bash

OBJS = trac.o main.o
OBJS_STATS = trac.p main.p
CFLAGS = -DBSD

.SUFFIXES : .p
.c.p :
	${CC} ${CFLAGS} -DSTATS -p -c $<
	mv $*.o $@

trac : ${OBJS}
	${CC} -o $@ ${OBJS}

full_test : ${OBJS_STATS}
	${CC} -o $@ -p ${OBJS_STATS}
