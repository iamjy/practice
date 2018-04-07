include ../../build/make_rule/compiler.mk
include ../../build/make_rule/compilepath.mk

TARGET = signal

SRCS = ex7-12.c
OBJS = $(SRCS:.c=.o)

CFLAGS = -g

all: $(OBJS)
	$(CC) -o $(TARGET) $^

install:
	@cp -rf $(TARGET) /export/DTK4412-NFS

clean:
	rm -rf *.o
	rm -rf $(TARGET)
