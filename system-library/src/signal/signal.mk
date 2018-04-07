TARGET = signal

SRCS = ex7-12.c
OBJS = $(SRCS:.c=.o)

CFLAGS = -g

all: $(OBJS)
	$(CC) -o $(TARGET) $^

install:
	@echo install

clean:
	rm -rf *.o
	rm -rf $(TARGET)
