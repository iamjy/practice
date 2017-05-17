TARGET         := libmytime.so.0.0.0
TARGET_SONAME  := libmytime.so.0
TARGET_LIB     := libmytime.so
TARGET_DEFS    := -D_arm_ -D_LINUX_OS_
TARGET_INSTALL := $(TARGET_OUT)/usr/lib

CUR_DIR := .
SRC_DIR := $(CUR_DIR)/src

SRCS := $(SRC_DIR)/clock_gettime.c
OBJS := $(SRCS:.c=.o)
OBJS := $(OBJS:.cpp=.o)

INCS := -I$(CUR_DIR)/include
LIBS := -L$(TARGET_INSTALL)

CCFLAGS    := -fPIC $(TARGET_DEFS)
CPPFLAGS   := $(CCFLAGS)
LDFLAGS    := -lrt
LDLIBFLAGS := -shared -W1,

BUILD_LIB_TIME := $(OBJS)   \
		  $(TARGET) \
		  install

all: $(BUILD_LIB_TIME)

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $< $(INCS)

.cpp.o:
	$(CXX) -c $(CPPFLAGS) -o $@ $< $(INCS)

$(TARGET): $(OBJS)
	$(CC) $(LDLIBFLAGS) -o $@ $? $(LIBS) $(LDFLAGS)

install:
	@cp -f $(TARGET) $(TARGET_INSTALL)
	@ln -sf $(TARGET) $(TARGET_INSTALL)/$(TARGET_SONAME)
	@ln -sf $(TARGET) $(TARGET_INSTALL)/$(TARGET_LIB)

clean:
	@rm -rf $(TARGET) $(OBJS)
