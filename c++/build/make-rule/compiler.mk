
##
CROSS_PREFIX := 
#CROSS_PREFIX := /opt/toolchain/arm/linux/code-sourcery/arm-2009q3-67/bin/arm-none-linux-gnueabi-

##
CC      := $(CROSS_PREFIX)g++
ASM     := $(CROSS_PREFIX)as
LD      := $(CROSS_PREFIX)ld
AR      := $(CROSS_PREFIX)ar
STRIP   := $(CROSS_PREFIX)strip
OBJCOPY := $(CROSS_PREFIX)objcopy
READELF := $(CROSS_PREFIX)readelf
