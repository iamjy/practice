##
#CROSSPREFIX :=
CROSSPREFIX := /opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

##
CC      := $(CROSSPREFIX)gcc
ASM     := $(CROSSPREFIX)as
LD      := $(CROSSPREFIX)ld
AR      := $(CROSSPREFIX)ar
OBJCOPY := $(CROSSPREFIX)objcopy
READELF := $(CROSSPREFIX)readelf
