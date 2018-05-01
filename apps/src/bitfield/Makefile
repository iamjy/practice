#!/bin bash

TARGET := bitfield
SRCS := main.c
LIB := 
CFLAGS += -g --save-temps
OBJS := $(SRCS:.c=.o)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^

$(OBJS): main.h
