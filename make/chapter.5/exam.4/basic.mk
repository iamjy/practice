#!/bin/bash

OBJS = parse.o search_file.o global.o find_token.o
SOURCES = ${OBJS:.o=.c}

parse: ${FRC}
	${MAKE} "CFLAGS=${CFLAGS}" "FRC=${FRC}" makefile
	${MAKE} "cflags=${CFLAGS}" "FRC=${FRC}" ${OBJS}
	${CC} ${LDFLAGS} -o $@ ${OBJS}

makefile : ${FRC}
	rm -rf $@
	cp basic.mk $@
	echo '# 자동으로 생성된 의존 항목 리스트:' >> $@
	${CC} ${CFLAGS} -M ${SOURCES} >> $@
	chmod -w $@

force_build :
