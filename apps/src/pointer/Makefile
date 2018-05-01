#!/bin bash

TARGET := pointer

SRCS := \
	main.c \
	pointer.c

INCLUDE := \
	main.h \
	pointer.h

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
