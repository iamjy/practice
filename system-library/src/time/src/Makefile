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
	$(SRC_DIR)/clock_gettime.c \
	$(SRC_DIR)/time.c \
	$(SRC_DIR)/main.c

INCS := \
	$(INC_DIR)/clock_gettime.h \
	$(INC_DIR)/time.h \
	$(INC_DIR)/main.h

LIBRARY := \
	-L$(USR_LIB_DIR)/common/lib

LIBS := \
	-lcommon

OBJS := $(SRCS:.c=.o)

TARGET := time
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE)
LFLAGS += $(LIBRARY) $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)

install :
	@cp $(TARGET) $(BIN_DIR)
	strip $(BIN_DIR)/$(TARGET)

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
