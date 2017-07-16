#!/bin/bash

TARGET = keyword
SRCS := main.c structure.c
CFLAGS += -g
LDFLAGS += 
OBJS := $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(CC) -o $^ $@

$(OBJS): common-keyword.h structure.h
