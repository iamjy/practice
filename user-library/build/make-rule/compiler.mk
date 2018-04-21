##
CROSSPREFIX := arm-none-linux-gnueabi-

CC      := $(CROSSPREFIX)gcc#         # GNU c compiler
ASM     := $(CROSSPREFIX)as#          # GNU assembler
LD      := $(CROSSPREFIX)ld#          # GNU linker
OBJCOPY := $(CROSSPREFIX)objcopy#     # GNU objcopy
READELF := $(CROSSPREFIX)readelf#
