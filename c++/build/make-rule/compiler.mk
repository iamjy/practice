##
#CROSS_PREFIX := /opt/toolchain/arm/linux/linaro/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
CROSS_PREFIX :=

##
CC      := $(CROSS_PREFIX)g++
ASM     := $(CROSS_PREFIX)as
LD      := $(CROSS_PREFIX)ld
AR      := $(CROSS_PREFIX)ar
OBJCOPY := $(CROSS_PREFIX)objcopy
READELF := $(CROSS_PREFIX)readelf
