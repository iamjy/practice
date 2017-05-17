obj-m := trouble_list.o

KDIR := /lib/modules/$(shell uname -r)/build

all:
	make -C $(KDIR) SUBDIRS=$(PWD) modules

clean:
	make -C $(KDIR) SUBDIRS=$(PWD) clean
