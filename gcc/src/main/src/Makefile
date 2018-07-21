#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
BIN_DIR := $(UP_DIR)/bin
TARGET_INSTALL := /export

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR) \

SRCS := \
	$(SRC_DIR)/main.c \
	$(SRC_DIR)/c-extensions.c \
	$(SRC_DIR)/func-attr.c \
	$(SRC_DIR)/inline-asm.c \
	$(SRC_DIR)/builtin-prefetch.c \
	$(SRC_DIR)/trace.c

INCS := \
	$(INC_DIR)/main.h \
	$(INC_DIR)/c-extensions.h \
	$(INC_DIR)/func-attr.h \
	$(INC_DIR)/inline-asm.h \
	$(INC_DIR)/builtin-prefetch.h \
	$(INC_DIR)/trace.h

LIBRARY := \
	-L$(COMMON_DIR)/lib

LIBS := \
	-lcommon -lrt

OBJS := $(SRCS:.c=.o)

TARGET := gcc-test
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE) $(LIBRARY)
LFLAGS += $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)

install:
	@cp $(TARGET) $(BIN_DIR)
	$(STRIP) $(BIN_DIR)/$(TARGET)
	@if [ -d "$(TARGET_INSTALL)" ]; then \
		for search in $(TARGET_INSTALL)/*; \
		do \
			if [ -d "$$search" ]; then \
				[ -f $(BIN_DIR)/$(TARGET) ] && sudo cp -f "$(BIN_DIR)/$(TARGET)" "$$search"; \
			fi \
		done \
	fi

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
