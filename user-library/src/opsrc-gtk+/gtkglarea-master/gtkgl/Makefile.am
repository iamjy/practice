## gtkgl directory

if OS_WIN32
export_symbols = -export-symbols gtkgl.def

install-libtool-import-lib:
	$(INSTALL) .libs/libgtkgl-3.0.dll.a $(DESTDIR)$(libdir)
uninstall-libtool-import-lib:
	-rm $(DESTDIR)$(libdir)/libgtkgl-3.0.dll.a
else
install-libtool-import-lib:
uninstall-libtool-import-lib:
endif

if MS_LIB_AVAILABLE
noinst_DATA = gtkgl-3.0.lib

install-ms-lib:
	$(INSTALL) gtkgl-3.0.lib $(DESTDIR)$(libdir)

uninstall-ms-lib:
	-rm $(DESTDIR)$(libdir)/gtkgl-3.0.lib
else
install-ms-lib:
uninstall-ms-lib:
endif

EXTRA_DIST = makefile.mingw makefile.mingw.in gtkgl.def

AM_CPPFLAGS = -I$(top_srcdir)
AM_CFLAGS = $(GTK_CFLAGS) $(GL_CFLAGS)

gtkglincludedir = $(includedir)/gtkgl-3.0/gtkgl

lib_LTLIBRARIES= libgtkgl-3.0.la

gtkglinclude_HEADERS= gdkgl.h gtkglarea.h
libgtkgl_3_0_la_SOURCES = gdkgl.c gtkglarea.c
libgtkgl_3_0_la_LDFLAGS = -version-info $(GTKGL_LIBRARY_VERSION) $(export_symbols) -no-undefined
libgtkgl_3_0_la_LIBADD = $(GTK_LIBS) $(GL_LIBS)

gtkgl-3.0.lib: libgtkgl-3.0.la gtkgl.def
	lib -name:libgtkgl-3.0-@LT_CURRENT_MINUS_AGE@.dll -def:gtkgl.def -out:$@

install-data-local: install-ms-lib install-libtool-import-lib

uninstall-local: uninstall-ms-lib uninstall-libtool-import-lib
