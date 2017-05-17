### Automatic Makefile generation by 'genmake' script        ####
### Copyright, Jerry Cooperstein, coop@linuxfoundation.org 2/2003 - 1/2012 ####
### License: GPLv2 ###

obj-m +=  ldd_list.o ldd_printk.o ldd_queue.o ldd_sk.o

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
	 exam2_v4l2 exam_v4l2 ldd_chardev ldd_miscdev ldd_platformdev ldd_v4l2 ldd_v4l2_exam1 ldd_v4l2_exam2 poll v4l2_wrapper

clean: kernel_clean
	rm -rf  exam2_v4l2 exam_v4l2 ldd_chardev ldd_miscdev ldd_platformdev ldd_v4l2 ldd_v4l2_exam1 ldd_v4l2_exam2 poll v4l2_wrapper  Module.symvers modules.order
