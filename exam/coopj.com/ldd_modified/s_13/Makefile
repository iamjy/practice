### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, coop@linuxfoundation.org 2/2003 - 1/2012 ####
### License: GPLv2 ###

obj-m +=  lab1_ioctl_data.o lab2_ioctl_vardata.o lab3_ioctl_signal.o

export KROOT=/lib/modules/3.13.0-79-generic/build

allofit:  userprogs modules
modules:
	@$(MAKE) -C $(KROOT) M=$(PWD) modules
modules_install:
	@$(MAKE) -C $(KROOT) M=$(PWD) modules_install
kernel_clean:
	@$(MAKE) -C $(KROOT) M=$(PWD) clean

userprogs:
	@$(MAKE) \
		CFLAGS="-O2 -Wall -pedantic" \
	 lab1_ioctl_data_test lab2_ioctl_vardata_test lab3_ioctl_signal_test

clean: kernel_clean
	rm -rf  lab1_ioctl_data_test lab2_ioctl_vardata_test lab3_ioctl_signal_test  Module.symvers modules.order
