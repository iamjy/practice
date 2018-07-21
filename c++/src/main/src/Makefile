#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
OBJ_DIR := $(UP_DIR)/obj
BIN_DIR := $(UP_DIR)/bin
TARGET_INSTALL := /export

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR)

SRCS := \
	$(SRC_DIR)/stl.cpp \
	$(SRC_DIR)/api.cpp \
	$(SRC_DIR)/syntax.cpp \
	$(SRC_DIR)/main.cpp

INCS := \
	$(INC_DIR)/stl.hpp \
	$(INC_DIR)/api.hpp \
	$(INC_DIR)/syntax.hpp \
	$(INC_DIR)/main.hpp

LIBRARY := \
	-L$(USR_LIB_DIR)/common/lib

LIBS := \
	-lcommon

OBJS := $(SRCS:.cpp=.o)

TARGET := cplus-test
CPPFLAGS += -g --save-temps
CPPFLAGS += $(INCLUDE) $(LIBRARY)
LDFLAGS += $(LIBS)

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^ $(CPPFLAGS) $(LDFLAGS)

%.o: %.cpp
	$(CC) -c $< $(CPPFLAGS)

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
	@-rm $(SRC_DIR)/*.ii

$(OBJS): $(INCS)
