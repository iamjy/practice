##
include ../../build/make_rule/compiler.mk
include ../../build/make_rule/compilepath.mk

TARGET := libfoo.a
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__
TARGET_INSTALL := /export/DTK4412-NFS

SRCS := $(strip $(shell cat src_list))
OBJS := $(strip $(shell cat obj_list))

INCLUDE := \
	   -I./include

CFLAGS := $(TARGET_DEFS)
LDFLAGS := -lpthread -lrt -ldl -lm

BUILD_ALL = BUILD $(TARGET)

all: $(BUILD_ALL)

BUILD: $(SRCS)
	$(CC) -c $(CFLAGS) $^ $(LDFLAGS) $(INCLUDE)

$(TARGET): $(OBJS)
	$(AR) rscv $@ $^ 

install:
	if [ ! -d "$(TARGET_INSTALL)" ];then \
		mkdir -p $(TARGET_INSTALL); \
	fi
	@cp -f $(TARGET) $(TARGET_INSTALL)

clean:
	@rm -f ./$(TARGET)
	@rm -f ./*.o
