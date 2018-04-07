TARGET = sem_test
SRCS = sem_test.c
OBJS = $(SRCS:.c=.o)

CFLAGS = -g
LDFLAGS = -pthread

all: $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)
