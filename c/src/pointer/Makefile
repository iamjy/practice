#!/bin/bash

TARGET = pointer
SRCS := main.c pointer.c
CFLAGS += -g
LDFLAGS += 
OBJS := $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJS): pointer.h
