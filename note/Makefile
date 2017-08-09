TARGET = main

SRCS := main.c lib.c
OBJS := $(SRCS:.c=.o)
LIB := libs.a

all : $(TARGET)

$(TARGET) : $(OBJS) $(LIB)
	$(CC) -o $@ $? $(LIB)

$(LIB) : $(OBJS)
	$(AR) -cr $@ $?

clean:
	rm -rf *.o
