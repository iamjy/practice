TARGET = process
SRCS = main.c process.c
OBJS = $(SRCS:.c=.o)
CC = arm-none-linux-gnueabi-gcc
CFLAGS = -g -c

all: ${OBJS}
	${CC} -g -o ${TARGET} ${OBJS}

clean:
	rm -f ${TARGET} ${OBJS}
