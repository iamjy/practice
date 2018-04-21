##

$(STATIC_LIB): $(OBJS)
	$(AR) cr $(STATIC_LIB) $^
	@cp -f $(STATIC_LIB/$(LIB_DIR)

