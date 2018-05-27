## examples directory

EXTRA_DIST = README penguin.lwo alien.lwo makefile.mingw makefile.mingw.in

if HAVE_SHADERS
shader_programs = shaders
endif

noinst_PROGRAMS = simple zktor viewlw $(shader_programs) gtkglarea_demo

AM_CPPFLAGS = -I$(top_srcdir)
AM_CFLAGS = $(GTK_CFLAGS) $(GL_CFLAGS)
LDADD = $(top_builddir)/gtkgl/libgtkgl-3.0.la $(GTK_LIBS) $(GL_LIBS) $(LIBM)

simple_SOURCES   = simple.c
zktor_SOURCES    = zktor.c
viewlw_SOURCES   = viewlw.c lw.h lw.c trackball.h trackball.c
shaders_SOURCES  = shaders.c
gtkglarea_demo_SOURCES = gtkglarea_demo.c
