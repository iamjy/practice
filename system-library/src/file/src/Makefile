#!/bin bash

include ../../../build/path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
OBJ_DIR := $(UP_DIR)/obj
BIN_DIR := $(UP_DIR)/bin

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR) \

SRCS := \
	$(SRC_DIR)/main.c \
	$(SRC_DIR)/file.c

INCS := \
	$(INC_DIR)/main.h \
	$(INC_DIR)/file.h

LIBS := \

OBJS := $(SRCS:.c=.o)

TARGET := base
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE)
LFLAGS += $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LFLAGS)
	@cp $(SRC_DIR)/*.o $(OBJ_DIR)
	@cp $(TARGET) $(BIN_DIR)
	strip $(BIN_DIR)/$(TARGET)

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(OBJ_DIR)/*.o
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
