##
include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include

LIB_DIR := $(UP_DIR)/lib
TARGET_INSTALL := /export

STATIC_LIB   := libbase.a
DYNAMIC_LIB  := libbase.so.0.0.0
DYNAMIC_LINK := libbase.so
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__

SRCS := $(strip $(shell ls $(SRC_DIR)/*.c))
OBJS := $(SRCS:.c=.o)

INCLUDE := \
	   -I$(INC_DIR)

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

ifeq ($(STATIC_BUILD), y)
BUILD_ALL = BUILD $(STATIC_LIB)
else
BUILD_ALL = BUILD $(DYNAMIC_LIB)
endif

all: $(BUILD_ALL)

BUILD: $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) -c $^ $(INCLUDE) $(LIBS)

$(STATIC_LIB): $(OBJS)
	$(AR) cr $(STATIC_LIB) $^
	@mv -f $(STATIC_LIB) $(LIB_DIR)

$(DYNAMIC_LIB): $(OBJS)
	$(CC) -shared -Wl,-soname,$(DYNAMIC_LINK) -o $(DYNAMIC_LIB) $(OBJS)
	@[ -d $(LIB_DIR) ] || mkdir $(LIB_DIR)
	@mv -f $(DYNAMIC_LIB) $(LIB_DIR)
	@[ -f $(LIB_DIR)/$(DYNAMIC_LINK) ] || ln -s $(LIB_DIR)/$(DYNAMIC_LIB) $(LIB_DIR)/$(DYNAMIC_LINK)

install:
	@if [ -d "$(TARGET_INSTALL)" ]; then \
		for search in $(TARGET_INSTALL)/*; \
		do \
			if [ -d "$$search" ]; then \
				[ -f $(LIB_DIR)/$(STATIC_LIB) ] && sudo cp -f "$(LIB_DIR)/$(STATIC_LIB)" "$$search"; \
				[ -f $(LIB_DIR)/$(DYNAMIC_LIB) ] && sudo cp -f "$(LIB_DIR)/$(DYNAMIC_LIB)" "$$search"; \
			fi \
		done \
	fi

clean:
	-@rm -f $(CUR_DIR)/$(STATIC_LIB)
	-@rm -f $(LIB_DIR)/$(STATIC_LIB)
	-@rm -f $(CUR_DIR)/$(DYNAMIC_LIB)
	-@rm -f $(LIB_DIR)/$(DYNAMIC_LIB)
	-@rm -f $(LIB_DIR)/$(DYNAMIC_LINK)
	-@rm -f $(CUR_DIR)/*.[iso]
