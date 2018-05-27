VERSION    = 00.60.00.1
CVSVERSION = "$Experimental work Michel Xhaard && Reza Jelveh 03/02/2004"
DEFINES    =

###
# The following flags enable experimental features.
# By default, these are enabled for development versions of the driver, and
# disabled for release versions.

# Optional: Enable driver debugging
DEFINES   += -DSPCA50X_ENABLE_DEBUG

# Optional: Enable direct register read/write for PAC207 development
#DEFINES   += -DSPCA5XX_ENABLE_REGISTERPLAY

###
# The following flags enable features that aren't yet implemented, and
# therefore are disabled by default.

# Optional: Enable compression
DEFINES   += -DSPCA50X_ENABLE_COMPRESSION

###
# Rest of Makefile follows here. You probably won't need to touch this.

# Setup defines
DEFINES   += -DCONFIG_USB_SPCA5XX_MODULE=1 -DMODULE -D__KERNEL__
DEFINES   += -DVID_HARDWARE_SPCA5XX=0xFF -DSPCA5XX_VERSION=\"$(VERSION)\"

ifneq ($(shell uname -r | cut -d. -f1,2), 2.4)

ifneq ($(KERNELRELEASE),)   # We were called by kbuild
CFLAGS += $(DEFINES) 
obj-m += spca5xx.o
spca5xx-objs := drivers/usb/spca5xx.o drivers/usb/spcadecoder.o 

else   # We were called from command line

KERNEL_VERSION = `uname -r`
KERNELDIR := /lib/modules/$(KERNEL_VERSION)/build
PWD  := $(shell pwd)
MODULE_INSTALLDIR = /lib/modules/$(KERNEL_VERSION)/kernel/drivers/usb/media/

# Targets, don't change!
default:
	@echo '   Building SPCA5XX driver for 2.5/2.6 kernel.'
	@echo '   Remember: you must have read/write access to your kernel source tree.'
	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) CC=$(CC) modules

install:
	mkdir -p $(MODULE_INSTALLDIR)
	rm -f $(MODULE_INSTALLDIR)spca50x.ko
	rm -f $(MODULE_INSTALLDIR)et61x.ko
	install -c -m 0644 spca5xx.ko $(MODULE_INSTALLDIR)
	/sbin/depmod -ae

uninstall:
	rm -f $(MODULE_INSTALLDIR)/spca5xx.ko
	/sbin/depmod -aq

endif

else   # kernel version test

#############################################################################
# For Linux 2.4 users.
# Change the following lines according to your system configuration.
# It is important to configure your particular source tree ("make dep") before
# compiling this module!
#############################################################################
###
# This makefile will build the spca50x driver module external to the kernel
# source tree. It makes it easier to swap kernels.


KERNEL_VERSION = `uname -r`

###
# Location of the header files (most importantly the config files)
# for the kernel you want to build the module against.
# This should be correct for the currently installed kernel on your machine.
KINCLUDE   = /lib/modules/$(KERNEL_VERSION)/build/include
KERNEL_ACFILE = $(KINCLUDE)/linux/autoconf.h
KERNEL_MODVERSIONSFILE = $(KINCLUDE)/linux/modversions.h
MODULE_INSTALLDIR = /lib/modules/$(KERNEL_VERSION)/kernel/drivers/usb/

# Detect module versioning support
ifneq ($(strip $(shell grep 'define CONFIG_MODVERSIONS 1' $(KERNEL_ACFILE))),)
	DEFINES += -DMODVERSIONS -include $(KERNEL_MODVERSIONSFILE)
endif

# Detect SMP support
ifneq ($(strip $(shell grep 'define CONFIG_SMP 1' $(KERNEL_ACFILE))),)
	DEFINES += -D__SMP__ -DSMP
endif

# Setup the tools
CC         = gcc
LD         = ld

# Setup compiler warnings
WARNINGS   = -Wall -Wpointer-arith
WARNINGS  += -Wcast-align -Wwrite-strings -Wstrict-prototypes
WARNINGS  += -Wuninitialized -Wreturn-type -Wunused -Wparentheses

# Setup compiler flags
CFLAGS     = -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe
CFLAGS    += -mpreferred-stack-boundary=2 
CFLAGS    += -I$(KINCLUDE) -Idrivers/usb

# Setup link flags
LDFLAGS    = --strip-debug -r

# Setup the list of files to be included in a distribution
DIST_FILES = CHANGELOG \
             README \
             Makefile \
             drivers/usb/Config.in \
             drivers/usb/spcadecoder.c \
             drivers/usb/spcadecoder.h \
	     drivers/usb/spcagamma.h \
	     drivers/usb/spcaCompat.h \
	     drivers/usb/spcausb.h \
             drivers/usb/spca500_init.h \
             drivers/usb/spca501_init.h \
	     drivers/usb/sp5xxfw2.dat \
             drivers/usb/sp5xxfw2.h \
             drivers/usb/spca505_init.h \
             drivers/usb/spca506.h \
             drivers/usb/spca508_init.h \
	     drivers/usb/spca561.h \
	     drivers/usb/sonix.h \
             drivers/usb/cs2102.h \
             drivers/usb/hv7131b.h \
	     drivers/usb/icm105a.h \
             drivers/usb/hv7131c.h \
	     drivers/usb/hdcs2020.h \
             drivers/usb/pb0330.h \
	     drivers/usb/tas5130c.h \
	     drivers/usb/zc3xx.h\
	     drivers/usb/tv8532.h\
	     drivers/usb/cxlib.h\
	     drivers/usb/sn9cxxx.h\
	     drivers/usb/cx11646.h\
	     drivers/usb/pac207.h\
	     drivers/usb/spca5xx.c \
             drivers/usb/spca5xx.h 

OBJS       = drivers/usb/spcadecoder.o \
             drivers/usb/spca5xx.o

BINARY     = spca5xx.o

###
# Targets follow here

binary:	$(OBJS)
	@echo Linking $(BINARY)
	@$(LD) $(LDFLAGS) -o $(BINARY) $(OBJS)

install: binary
	@echo Installing.. Your root password may be required.
	su -c "make install-root"

install-root:
	@echo Installing..
	@mkdir -p /lib/modules/`uname -r`/kernel/drivers/usb
	@rm -f /lib/modules/`uname -r`/kernel/drivers/usb/spca50x.o
	@rm -f /lib/modules/`uname -r`/kernel/drivers/usb/et61x.o
	@cp spca5xx.o /lib/modules/`uname -r`/kernel/drivers/usb/spca5xx.o
	@/sbin/depmod

dist:	clean binary
	@echo Making distributable archives
	@rm -f spca5xx-src-$(VERSION).tar.gz
	@tar zcf spca5xx-src-$(VERSION).tar.gz $(DIST_FILES)
	@rm -f spca5xx-module-$(VERSION).tar.gz
	@cp $(BINARY) spca5xx-$(VERSION).o
	@tar zcf spca5xx-module-$(VERSION).tar.gz spca5xx-$(VERSION).o README
	@rm spca5xx-$(VERSION).o

.c.o:	Makefile $*.c
	@echo Compiling $*.c
	@$(CC) $(CFLAGS) $(WARNINGS) $(DEFINES) -c $*.c -o $*.o

###
# Dependencies follow here

drivers/usb/spca5xx.o: drivers/usb/spca5xx.h \
		       drivers/usb/spcaCompat.h \
		       drivers/usb/spcausb.h \
		       drivers/usb/sonix.h \
                       drivers/usb/spca500_init.h \
                       drivers/usb/spca501_init.h \
		       drivers/usb/sp5xxfw2.h \
                       drivers/usb/spca505_init.h \
		       drivers/usb/spca506.h \
                       drivers/usb/spca508_init.h \
		       drivers/usb/spca561.h \
		       drivers/usb/zc3xx.h\
		       drivers/usb/tv8532.h\
		       drivers/usb/cx11646.h\
		       drivers/usb/mr97311.h\
		       drivers/usb/sn9cxxx.h\
		       drivers/usb/pac207.h\
                       

drivers/usb/spcadecoder.o: drivers/usb/spcadecoder.h \
			   drivers/usb/spcagamma.h \
                          

endif  # End kernel version test


############################################################################## 
# OTHER TARGETS 
##############################################################################
clean:
	rm -r -f drivers/usb/*.o drivers/usb/.spcadecoder.o.cmd \
	drivers/usb/.spca5xx.o.cmd  *.o *.ko *.mod.* .[a-z]* core *.i
	
############################################################################## 
