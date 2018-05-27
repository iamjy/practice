#!/bin bash

include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
OBJ_DIR := $(UP_DIR)/obj
BIN_DIR := $(UP_DIR)/bin

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR) \

SRCS := \
	$(SRC_DIR)/macro.c \
	$(SRC_DIR)/main.c

INCS := \
	$(INC_DIR)/macro.h \
	$(INC_DIR)/main.h

LIBRARY := \
	-L$(USR_LIB_DIR)/common/lib

LIBS := \
	-lcommon

OBJS := $(SRCS:.c=.o)

TARGET := macro
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE)
LFLAGS += $(LIBRARY) $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)
	@cp $(SRC_DIR)/*.o $(OBJ_DIR)

install:
	@cp $(TARGET) $(BIN_DIR)
	strip $(BIN_DIR)/$(TARGET)

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(OBJ_DIR)/*.o
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
