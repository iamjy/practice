##

include ../../../build/make-rule/compilepath.mk

CUR_DIR := .
UP_DIR  := ..
SRC_DIR := $(CUR_DIR)
OBJ_DIR := $(UP_DIR)/obj
LIB_DIR := $(UP_DIR)/lib
TARGET_INSTALL := /export

STATIC_LIB   := libcommon.a
DYNAMIC_LIB  := libcommon.so.0.0.0
DYNAMIC_LINK := libcommon.so
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__

SRCS := $(strip $(shell ls $(SRC_DIR)/*.c))
OBJS := $(SRCS:.c=.o)

INCLUDE := \
	   -I$(CUR_DIR)/include

LIBS := \
	-lpthread \
	-lrt \
	-ldl \
	-lm

ifeq ($(STATIC_BUILD), y)
CFLAGS  +=
else
CFLAGS  += -fPIC 
endif
CFLAGS  += $(TARGET_DEFS)
LDFLAGS += 

BUILD_ALL = BUILD $(STATIC_LIB) $(DYNAMIC_LIB)

all: $(BUILD_ALL)

BUILD: $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) -c $^ $(INCLUDE) $(LIBS)
	@cp -f $(CUR_DIR)/*.o $(OBJ_DIR)

$(STATIC_LIB): $(OBJS)
	$(AR) cr $(STATIC_LIB) $^
	@mv -f $(STATIC_LIB) $(LIB_DIR)

$(DYNAMIC_LIB): $(OBJS)
	$(CC) -shared -Wl,-soname,$(DYNAMIC_LINK) -o $(DYNAMIC_LIB) $(OBJS)
	@mv -f $(DYNAMIC_LIB) $(LIB_DIR)

install:
	@if [ -d "$(TARGET_INSTALL)" ]; then \
		for search in $(TARGET_INSTALL)/*; \
		do \
			if [ -d "$$search" ]; then \
				sudo cp -f "$(LIB_DIR)/$(STATIC_LIB)" "$$search"; \
				sudo cp -f "$(LIB_DIR)/$(DYNAMIC_LIB)" "$$search"; \
			fi \
		done \
	fi

clean:
	-@rm -f $(CUR_DIR)/$(STATIC_LIB)
	-@rm -f $(LIB_DIR)/$(STATIC_LIB)
	-@rm -f $(CUR_DIR)/$(DYNAMIC_LIB)
	-@rm -f $(LIB_DIR)/$(DYNAMIC_LIB)
	-@rm -f $(CUR_DIR)/*.[iso]
	-@rm -f $(OBJ_DIR)/*.o
