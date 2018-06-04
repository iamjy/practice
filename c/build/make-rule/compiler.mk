##
#CROSS_PREFIX := /opt/toolchain/arm/linux/linaro/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
CROSS_PREFIX := /opt/toolchain/arm/linux/linaro/latest-4/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

##
CC      := $(CROSS_PREFIX)gcc        # GNU c compiler
ASM     := $(CROSS_PREFIX)as         # GNU c assembler
LD      := $(CROSS_PREFIX)ld         # GNU c linker
AR      := $(CROSS_PREFIX)ar
STRIP   := $(CROSS_PREFIX)strip
OBJCOPY := $(CROSS_PREFIX)objcopy
READELF := $(CROSS_PREFIX)readelf
