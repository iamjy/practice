#!/bin/bash

ENTER_OBJS = parse.o find_token.o global.o

TESTEX_OBJS = parse.o find_token.o global.o interact.o
LIBRARIES = -lm

all :
	make enter testex "CFLAGS=${CFLAGS}" "FRC=${FRC}"

enter : ${FRC}
	make ${ENTER_OBJS} "CFLAGS=${CFLAGS}" "FRC=${FRC}"
	${CC} -o $@ ${ENTER_OBJS} ${LIBRARIES}

testex : ${FRC}
	make ${TESTEX_OBJS} "CFLAGS=${CFLAGS}" "FRC=${FRC}"
	${CC} -o $@ ${TESTEX_OBJS} ${LIBRARIES}

parse.o find_token.o interact.o : parse_defs.h ${FRC}
global.o : parse_defs.h extra_defs.h ${FRC}

force_rebuild :

