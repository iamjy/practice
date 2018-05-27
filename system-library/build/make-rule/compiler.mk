##
#CROSSPREFIX := /opt/toolchain/arm/linux/buildroot/host-v6.4.0-2017.08.1-gnueabi/bin/arm-buildroot-linux-gnueabi-
CROSSPREFIX :=

##
CC      := $(CROSSPREFIX)gcc
ASM     := $(CROSSPREFIX)as
LD      := $(CROSSPREFIX)ld
AR      := $(CROSSPREFIX)ar
OBJCOPY := $(CROSSPREFIX)objcopy
READELF := $(CROSSPREFIX)readelf
