#!/bin bash

TARGET := function
SRCS := main.c function.c fileIO.c
LIB := 
CFLAGS += -g --save-temps
OBJS := $(SRCS:.c=.o)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^

clean:
	rm $(TARGET)
	rm *.[iso]

$(OBJS): function.h fileIO.h
