#!/bin bash

CUR_DIR := .
UP_DIR  := ..
#COMMON_DIR := 
SRC_DIR := $(CUR_DIR)/src
INC_DIR := $(CUR_DIR)/include
OBJ_DIR := $(CUR_DIR)/obj
BIN_DIR := $(CUR_DIR)/bin

INCLUDE := \
	-I$(COMMON_DIR)include \
	-I$(INC_DIR) \

SRCS := \
	$(SRC_DIR)/main.c \
	$(SRC_DIR)/api.c

INCS := \
	$(INC_DIR)/main.h \
	$(INC_DIR)/api.h

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
	@-rm $(OBJ_DIR)*.o
	@-rm *.[iso]

$(OBJS): $(INCS)
