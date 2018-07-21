##
include ../../../build/make-rule/compiler.mk
include ../../../build/make-rule/compile-option.mk
include ../../../build/make-rule/compile-path.mk

SRC_DIR := $(CUR_DIR)
INC_DIR := $(UP_DIR)/include
LIB_DIR := $(UP_DIR)/lib
TARGET_INSTALL := /export

STATIC_LIB   := libcommon.a
DYNAMIC_LIB  := libcommon.so.0.0.0
DYNAMIC_LINK := libcommon.so
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__

CSRCS := $(strip $(shell ls $(SRC_DIR)/*.c))
CPPSRCS += $(strip $(shell ls $(SRC_DIR)/*.cpp))
OBJS := $(CSRCS:.c=.o)
OBJS += $(CPPSRCS:.cpp=.o)

INCLUDE := \
	   -I$(INC_DIR)

LIBS := \
	-lpthread \
	-lrt \
	-ldl \
	-lm

ifeq ($(STATIC_BUILD), y)
CFLAGS   +=
CPPFLAGS +=
else
CFLAGS   += -fPIC
CPPFLAGS += -fPIC
endif
CFLAGS   += $(TARGET_DEFS) $(INCLUDE) $(LIBS)
CPPFLAGS += $(TARGET_DEFS) $(INCLUDE) $(LIBS)
LDFLAGS  +=

ifeq ($(STATIC_BUILD), y)
BUILD_ALL = $(STATIC_LIB)
else
BUILD_ALL = $(DYNAMIC_LIB)
endif

all: $(BUILD_ALL)

$(STATIC_LIB): $(OBJS)
	$(AR) cr $(STATIC_LIB) $^
	@mv -f $(STATIC_LIB) $(LIB_DIR)

$(DYNAMIC_LIB): $(OBJS)
	$(CXX) -shared -Wl,-soname,$(DYNAMIC_LINK) -o $(DYNAMIC_LIB) $(OBJS)
	@[ -d $(LIB_DIR) ] || mkdir $(LIB_DIR)
	@mv -f $(DYNAMIC_LIB) $(LIB_DIR)
	@[ -f $(LIB_DIR)/$(DYNAMIC_LINK) ] || ln -s $(LIB_DIR)/$(DYNAMIC_LIB) $(LIB_DIR)/$(DYNAMIC_LINK)

%.o: %.c
	$(CC) -c $< $(CFLAGS)

%.o: %.cpp
	$(CXX) -c $< $(CPPFLAGS)

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
