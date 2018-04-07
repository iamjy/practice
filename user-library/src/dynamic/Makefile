##
include ../../build/make_rule/compiler.mk
include ../../build/make_rule/compilepath.mk

TARGET := libshared.so
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__
TARGET_INSTALL := /export/DTK4412-NFS

SRCS := $(strip $(shell cat src_list))
OBJS := $(strip $(shell cat obj_list))

INCLUDE := \
	   -I../include

CFLAGS := $(TARGET_DEFS)
LDFLAGS := -lpthread -lrt -ldl -lm

BUILD_ALL = BUILD $(TARGET)

all: $(BUILD_ALL)

BUILD: $(SRCS)
	$(CC) -fPIC $(CFLAGS) $(INCLUDE) $(LDFLAGS) -c $^

$(TARGET): $(OBJS)
	$(CC) -shared -Wl,-soname,$(TARGET) -o $(TARGET) $(OBJS)

install:
	if [ ! -d "$(TARGET_INSTALL)" ];then \
		mkdir -p $(TARGET_INSTALL); \
	fi
	@cp -f $(TARGET) $(TARGET_INSTALL)

clean:
	@rm -f ./$(TARGET)
	@rm -f ./*.o
