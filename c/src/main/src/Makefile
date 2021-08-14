#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
BIN_DIR := $(UP_DIR)/bin
TARGET_INSTALL := /export

TARGET := c-test
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__

SRCS := \
	$(SRC_DIR)/api.c \
	$(SRC_DIR)/syntax.c \
	$(SRC_DIR)/main.c

OBJS := $(SRCS:.c=.o)

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR)

INCS := \
	$(INC_DIR)/api.h \
	$(INC_DIR)/syntax.h \
	$(INC_DIR)/main.h

LIBRARY := \
	-L$(COMMON_DIR)/lib

LIBS := \
	-lcommon

CFLAGS += -g
CFLAGS += --save-temps
CFLAGS += $(TARGET_DEFS) $(INCLUDE)
LFLAGS += $(LIBRARY) $(LIBS)

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
