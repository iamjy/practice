#!/bin bash

TARGET := macro

SRCS := \
	main.c \
	macro.c

INCLUDE := \
	main.h \
	macro.h

LIB := 

OBJS := $(SRCS:.c=.o)

CFLAGS += -g --save-temps
LFLAGS += 

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^

clean:
	-rm $(TARGET)
	-rm *.[iso]

$(OBJS): $(INCLUDE)
