SRCS = banner.c center.c normal.c
LIB = libprint.a
CC = gcc
CFLAGS = -g
OBJS = $(SRCS:.c=.o)

$(LIB): $(OBJS)
	$(AR) cr $(LIB) $(OBJS)

$(OBJS): printers.h
