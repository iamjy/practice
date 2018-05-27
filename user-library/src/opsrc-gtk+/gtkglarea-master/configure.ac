dnl Process this file with autoconf to produce a configure script.
AC_INIT([gtkgl],
        [3.0.0],
        [https://bugzilla.gnome.org/enter_bug.cgi?product=gtkglarea],
        [gtkglarea],
        [http://mono-project.com/GtkGLArea])

AC_CONFIG_AUX_DIR(.auto)
AC_CONFIG_HEADER(config.h)
AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([1.11 -Wall no-define no-dist-gzip dist-xz])
AM_MAINTAINER_MODE([enable])
# Support silent build rules, requires at least automake 1.11. Disable
# by either passing --disable-silent-rules to configure or passing V=1
# to make
AM_SILENT_RULES([yes])

#shared library versioning
GTKGL_LIBRARY_VERSION=2:0:0
#                     | | |
#              +------+ | +---+
#              |        |     |
#           current:revision:age
#              |        |     |
#              |        |     +- increment if interfaces have been added
#              |        |        set to zero if interfaces have been removed or changed
#              |        +- increment if source code has changed
#              |           set to zero if current is incremented
#              +- increment if interfaces have been added, removed or changed
# 
# Value of current - age. Used by libtool in Win32 DLL names. We need
# to know the DLL name to build MSVC import libraries.
LT_CURRENT_MINUS_AGE=1

AC_SUBST(GTKGL_LIBRARY_VERSION)
AC_SUBST(LT_CURRENT_MINUS_AGE)
AC_SUBST(VERSION)

dnl Checks for programs.
AC_PROG_CC
AC_PROG_CPP

dnl Initialize libtool
LT_PREREQ([2.2.6])
LT_INIT([win32-dll])

dnl Find an appropriate libm
LT_LIB_M

dnl
dnl  Check for the operating system
dnl
AC_MSG_CHECKING([for Win32])
case "$host" in
  *mingw* | pw32* | *cygwin*)
    native_win32=yes
    ;;
  *)
    native_win32=no
    ;;
esac
AC_MSG_RESULT([$native_win32])
AM_CONDITIONAL(OS_WIN32, test "$native_win32" = "yes")

if test "$native_win32" = "yes"; then
  AC_CHECK_PROG(ms_librarian, lib.exe, yes, no)
fi
AM_CONDITIONAL(MS_LIB_AVAILABLE, test x$ms_librarian = xyes)

dnl
dnl  Check for GTK libraries
dnl
GTK_REQUIRED_VERSION=3.0.0
GLIB_REQUIRED_VERSION=2.22
PKG_CHECK_MODULES(GTK, gtk+-3.0 >= $GTK_REQUIRED_VERSION gmodule-2.0 >= $GLIB_REQUIRED_VERSION)

dnl
dnl  Check for EPOXY library
dnl
EPOXY_REQUIRED_VERSION=1.0
PKG_CHECK_MODULES([GL],[
	epoxy >= $EPOXY_REQUIRED_VERSION
])

saved_LIBS="$LIBS"
AC_MSG_CHECKING([OpenGL shaders])
LIBS="$saved_LIBS $GL_LIBS"
AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <epoxy/gl.h>]],
                                [[glCreateShader(GL_VERTEX_SHADER);]])],
               [have_shaders=yes],[have_shaders=no])
AC_MSG_RESULT($have_shaders)
LIBS="$saved_LIBS"
AM_CONDITIONAL(HAVE_SHADERS, test "$have_shaders" = "yes")


AC_CONFIG_FILES([
  Makefile
  gtkgl-3.0.pc
  gtkgl/Makefile
  gtkgl/makefile.mingw
  docs/Makefile
  examples/Makefile
  examples/makefile.mingw
])
AC_OUTPUT


echo "---"
echo "Configuration summary"
echo ""
echo "   * Installation prefix: $prefix"
echo "   * Win32:               $native_win32"
echo ""
echo "---"
