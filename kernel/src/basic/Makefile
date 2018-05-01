CROSS = arm-none-linux-gnueabi-

MODULE = basic
obj-m := $(MODULE).o

KDIR := /mnt/vbox/work/lab/project/samsung/exynos4412/src/DTK4412/Complete/Linux/Kernel/linux-3.6.9.git
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
