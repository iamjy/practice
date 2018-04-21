##

$(DYNAMIC_LIB) : $(OBJS)
	$(CC) -shared -W1,-soname,$(DYNAMIC_LINK) -o $(DYNAMIC_LIB) $(OBJS)
	@cp -f $(DYNAMIC_LIB) $(LIB_DIR)
