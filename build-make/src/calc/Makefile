SRCS = calc.c
PROG = calculator
LIBS = ../libmath/libmath.a ../libprint/libprint.a
CC = gcc
CFLAGS = -g
OBJS = $(SRCS:.c=.o)

$(PROG): $(OBJS) $(LIBS)
	$(CC) -o $@ $^
