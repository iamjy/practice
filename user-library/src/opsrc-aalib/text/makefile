#				*Defines*
LIB_name=text

CPPFLAGS=@text.pth

MAKEDEPS=$(CC) -MM $(CPPFLAGS) $< | sed -e 's/$*\.o:*/$*\.o $@:/g' > $@

CC=gcc
CXX=gcc

ifdef DEB
ifdef OP

CFLAGS=-O2 -g -Wall
CXXFLAGS=-O2 -g -Wall

else

CFLAGS=-g -Wall
CXXFLAGS=-g -Wall

endif

else

CFLAGS=-O2 -Wall
CXXFLAGS=-O2 -Wall

GO=go32

endif

ifdef PROF

CFLAGS+=-pg
CXXFLAGS+=-pg
LDFLAGS+=-pg

endif

#               *Implicit Rules*
%.d: %.c
	$(MAKEDEPS)

%.d: %.s
	$(MAKEDEPS)

%.d: %.cc
	$(MAKEDEPS)

#               *List Macros*

LIB_sources=\
 textmode.s	\
 textfont.s	\
 txblit.c	\
 txcontex.c\
 txcursor.c	\
 txget---.c	\
 txinit.c	\
 txmode.c	\
 txput---.c

TEST_sources=\
 test.c


LIB_dependencies = $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(patsubst %.cc,%.o,$(LIB_sources))))
TEST_dependencies = $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(patsubst %.cc,%.o,$(TEST_sources))))


#               *Explicit Rules*

lib$(LIB_name).a: $(LIB_dependencies)
	ar rvus lib$(LIB_name).a $(LIB_dependencies)

test: lib$(LIB_name).a $(TEST_dependencies)
	gcc -o test test.o lib$(LIB_name).a ../vga/libvga.a

run: test
	-test

debug: test
	-edebug32 test

#               *Individual File Dependencies*

-include $(LIB_dependencies:.o=.d)
-include $(TEST_dependencies:.o=.d)
