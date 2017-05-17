### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, coop@linuxfoundation.org 2/2003 - 1/2012 ####
### License: GPLv2 ###

obj-m +=  lab1_copytofrom.o lab1_putget.o lab2_usermap.o lab2_usermap_fast.o lab3_mmap.o lab4_relay_module.o

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
	 lab1_read_write lab2_read_aligned lab2_write_aligned lab3_mmap_test lab4_relay_mmap lab4_relay_read

clean: kernel_clean
	rm -rf  lab1_read_write lab2_read_aligned lab2_write_aligned lab3_mmap_test lab4_relay_mmap lab4_relay_read  Module.symvers modules.order
