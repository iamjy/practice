#!/bin/bash

OBJS = parse.o search_file.o global.o find_token.o

parse: ${OBJS}
	${CC} ${LDFLAGS} -o $@ ${OBJS}

parse_xdb:
	${CC} ${LDFLAGS} -o $@ ${OBJS} /usr/lib/end.o

${OBJS}: parse.h

clean:
	-rm -f *.o core a.out parse parse_xdb

