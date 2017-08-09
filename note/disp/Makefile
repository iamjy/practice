OBJS =	fig/fill.o \
	fig/rotat.o \
	structops/allocate.o \
	structops/delete.o \
	main.o

disp: fig_obj struct_obj main.o
	${CC} ${LDFLAGS} -o $@ ${OBJS}

fig_obj:
	cd fig; $(MAKE) all

struct_obj:
	cd structops; $(MAKE) all

dummy: /usr/local/bin /usr/bin/nice
	@echo ${<D}
	@echo ${<F}

clean:
	rm -rf *.o
	cd fig; rm -rf *.o
	cd structops; rm -rf *.o
