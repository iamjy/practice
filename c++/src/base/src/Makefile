#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
OBJ_DIR := $(UP_DIR)/obj
BIN_DIR := $(UP_DIR)/bin

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR)

SRCS := \
	$(SRC_DIR)/api.cpp \
	$(SRC_DIR)/main.cpp

INCS := \
	$(INC_DIR)/api.h \
	$(INC_DIR)/main.h

LIBRARY := \
	-L$(USR_LIB_DIR)/common/lib

LIBS := \
	-lcommon

OBJS := $(SRCS:.cpp=.o)

TARGET := base
CFLAGS += -g --save-temps
CFLAGS += $(INCLUDE)
CPPFLAGS += -g --save-temps
CPPFLAGS += $(INCLUDE)
LDFLAGS += $(LIBRARY) $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)
	@cp $(SRC_DIR)/*.o $(OBJ_DIR)

install :
	@cp $(TARGET) $(BIN_DIR)
	strip $(BIN_DIR)/$(TARGET)

clean:
	@-rm $(TARGET)
	@-rm $(BIN_DIR)/$(TARGET)
	@-rm $(OBJ_DIR)/*.o
	@-rm $(OBJ_DIR)/*.ii
	@-rm $(SRC_DIR)/*.[iso]

$(OBJS): $(INCS)
