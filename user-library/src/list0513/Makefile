##
include ../../build/make_rule/compiler.mk
include ../../build/make_rule/compilepath.mk

TARGET := list0513
TARGET_DEFS := -D__ARM__ -D__LINUX_OS__
TARGET_INSTALL := /export/DTK4412-NFS

SRCS := $(strip $(shell cat src_list))
OBJS := $(strip $(shell cat obj_list))

INCLUDE := \
	   -I../include

LIBS := -lpthread -ldl

CFLAGS := $(TARGET_DEFS) -g
LDFLAGS := -L./ -llist0513

BUILD_ALL = $(TARGET)

all: $(BUILD_ALL)
$(TARGET): $(OBJS)
	     $(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS) $(INCLUDE) $(LIBS)

.c.o:
	$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS) $(INCLUDE)

install:
	if [ ! -d "$(TARGET_INSTALL)" ];then \
		mkdir -p $(TARGET_INSTALL); \
	fi
	@cp -f $(TARGET) $(TARGET_INSTALL)

clean:
	@rm -f ./$(TARGET)
	@rm -f ./*.o
