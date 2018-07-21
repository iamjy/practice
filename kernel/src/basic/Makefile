CROSS = /opt/toolchain/arm/linux/code-sourcery/arm-2009q3-67/bin/arm-none-linux-gnueabi-

MODULE = lab_char
obj-m := $(MODULE).o

#KDIR := /home/iamjy1005/work/lab/project/soc/samsung/ap/exynos4412/board/dtk4412/src/DTK4412/Complete/Linux/Kernel/linux-3.6.9.git
KDIR := /home/iamjy1005/work/lab/buildroot-labs/buildroot-2018.02.git/output/build/linux-master
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) ARCH=arm CROSS_COMPILE=$(CROSS) M=$$PWD modules

install:
	$(MAKE) -C $(KDIR) ARCH=arm CROSS_COMPILE=$(CROSS) INSTALL_MOD_PATH=./output M=$$PWD modules_install

clean:
	rm -rf *.ko
	rm -rf *.mod.*
	rm -rf .*.cmd
	rm -rf *.o
