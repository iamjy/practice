#!/bin/bash

TARGET = keyword
SRCS := main.c structure.c macro.c
CFLAGS += -g --save-temps
LDFLAGS += 
OBJS := $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJS): common-keyword.h structure.h macro.h
