CFLAGS += -D_arm_
LDFLAGS +=

INCLUDE += \
	./

$(DYNAMIC_LIB) : $(OBJS)
	$(CC) -shared -W1,-soname,$(DYNAMIC_LIB) -o $(DYNAMIC_LIB) $(OBJS)
