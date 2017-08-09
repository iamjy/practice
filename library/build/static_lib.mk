$(STATIC_LIB): $(OBJS)
	$(AR) cr $(STATIC_LIB) $^

