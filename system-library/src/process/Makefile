TARGET = main

SRCS = \
	process.c \
	main.c
OBJS = $(SRCS:.c=.o)

INCLUDE = \
	process.h \
	main.h

CFLAGS = -g
LDFLAGS = -pthread

all: $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)
