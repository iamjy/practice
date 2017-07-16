#!/bin/bash
include ../../build/lib.mk

SRCS := clock.c abort.c
LIBS := libstd.a
CFLAGS += -g
OBJS := $(SRCS:.c=.o)

$(LIBS): $(OBJS)
	$(AR) -cr $(LIBS) $^

clock.c:
	$(CC) -c $@

abort.c:
	$(CC) -c $@

$(OBJS): common.h
