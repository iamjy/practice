TARGET := body_2_4_2
MAIN := ${TARGET}_main.c
SUB := ${TARGET}_sub.c
HEAD := ${TARGET}_sub.h

${TARGET} : ${MAIN} ${SUB}
	${CC} -o $@ $^ ${DEBUG}
	@echo "${MAIN:.c=.o}"

${TARGET} : ${HEAD}

