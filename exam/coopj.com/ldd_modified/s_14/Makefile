### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, coop@linuxfoundation.org 2/2003 - 1/2012 ####
### License: GPLv2 ###

obj-m +=  lab2_proc.o lab3_proc_solA.o lab3_proc_solB.o lab4_proc_sig_solA.o lab4_proc_sig_solB.o lab5_seqfile.o

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
	 lab4_proc_sig_test

clean: kernel_clean
	rm -rf  lab4_proc_sig_test  Module.symvers modules.order
