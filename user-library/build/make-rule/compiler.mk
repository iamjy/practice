##
#CROSSPREFIX := /opt/toolchain/arm/linux/linaro/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
CROSSPREFIX :=

CC      := $(CROSSPREFIX)gcc         # GNU c compiler
ASM     := $(CROSSPREFIX)as          # GNU assembler
LD      := $(CROSSPREFIX)ld          # GNU linker
AR      := $(CROSS_PREFIX)ar
STRIP   := $(CROSS_PREFIX)strip
OBJCOPY := $(CROSSPREFIX)objcopy
READELF := $(CROSSPREFIX)readelf
