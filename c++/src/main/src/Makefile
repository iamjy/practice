#!/bin bash

include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
OBJ_DIR := $(UP_DIR)/obj
BIN_DIR := $(UP_DIR)/bin
TARGET_INSTALL := /export

TARGET := cplus-test
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__

CPPSRCS := \
	$(SRC_DIR)/stl.cpp \
	$(SRC_DIR)/api.cpp \
	$(SRC_DIR)/cppsyntax.cpp \
	$(SRC_DIR)/main.cpp \

CSRCS := \
	$(SRC_DIR)/csyntax.c

OBJS := $(CPPSRCS:.cpp=.o)
OBJS += $(CSRCS:.c=.o)

INCLUDE := \
	-I$(COMMON_DIR)/include \
	-I$(INC_DIR)

INCS := \
	$(INC_DIR)/stl.hpp \
	$(INC_DIR)/api.hpp \
	$(INC_DIR)/csyntax.h \
	$(INC_DIR)/cppsyntax.hpp \
	$(INC_DIR)/main.hpp

LIBRARY := \
	-L$(USR_LIB_DIR)/common/lib

LIBS := \
	-lcommon \
	-lpthread \
	-lrt \
	-ldl \
	-lm

CPPFLAGS += -g --save-temps
CFLAGS   += -g --save-temps
CPPFLAGS += $(TARGET_DEFS) $(INCLUDE) $(LIBRARY)
CFLAGS   += $(TARGET_DEFS) $(INCLUDE) $(LIBRARY)
LDFLAGS  += $(INCLUDE) $(LIBRARY) $(LIBS)

$(TARGET) : $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -c $< $(CFLAGS)

%.o: %.cpp
	$(CXX) -c $< $(CPPFLAGS)

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
