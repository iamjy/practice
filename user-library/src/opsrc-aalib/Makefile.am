AUTOMAKE_OPTIONS = foreign #include-deps
lib_LTLIBRARIES=libaa.la
libaa_la_SOURCES= \
       aafont.c \
       aafonts.c \
       aavyhen.c \
       aamktabl.c \
       aamem.c \
       aaprintf.c \
       aahelp.c \
       aaslnkbd.c \
       aaslang.c \
       aafastre.c \
       aalinux.c \
       aax.c \
       aaxkbd.c \
       aaxmouse.c \
       fontgl.c \
       font16.c \
       font14.c \
       fontx16.c \
       fontx13.c \
       fontx13b.c \
       fontcour.c \
       aarec.c \
       font9.c \
       font8.c \
       fontline.c \
       aacurses.c \
       aacurkbd.c \
       aacurmou.c \
       aalib.c \
       aaflush.c \
       aarender.c \
       aaout.c \
       aain.c \
       aaedit.c \
       aaregist.c \
       aakbdreg.c \
       aagpm.c  \
       aamoureg.c \
       aasave.c \
       aastdout.c \
       aastdin.c \
       aaparse.c
libaa_la_LDFLAGS=@LDFLAGS@ -version-info 1:3:0
info_TEXINFOS=aalib.texinfo
bin_PROGRAMS=aainfo aatest aafire aasavefont

aainfo_LDADD= libaa.la
aainfo_LDFLAGS= @LDFLAGS@
aatest_LDADD= libaa.la
aatest_LDFLAGS= @LDFLAGS@
aafire_LDADD= libaa.la
aafire_LDFLAGS= @LDFLAGS@
aasavefont_LDADD= libaa.la
aasavefont_LDFLAGS= @LDFLAGS@


include_HEADERS=aalib.h

