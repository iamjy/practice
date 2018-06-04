#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
BIN_DIR := $(UP_DIR)/bin

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR) \

SRCS := \
	$(SRC_DIR)/i2c.c \
	$(SRC_DIR)/main.c

INCS := \
	$(INC_DIR)/i2c.h \
	$(INC_DIR)/main.h

LIBS := \

OBJS := $(SRCS:.c=.o)

TARGET := bus
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE)
LFLAGS += $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)

install:
	@cp $(TARGET) $(BIN_DIR)
	@cp $(BIN_DIR)/$(TARGET) $(NFS_DIR)
	$(STRIP) $(BIN_DIR)/$(TARGET)

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
