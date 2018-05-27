KERNEL_VERSION	:= `uname -r`
KERNEL_DIR	:= /lib/modules/$(KERNEL_VERSION)/build
INSTALL_MOD_DIR	:= usb/media

PWD		:= $(shell pwd)

obj-m		:= uvcvideo.o
uvcvideo-objs   := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o

all: uvcvideo

uvcvideo:
	@echo "Building USB Video Class driver..."
	@(cd $(KERNEL_DIR) && make -C $(KERNEL_DIR) SUBDIRS=$(PWD) modules)

install:
	@echo "Installing USB Video Class driver..."
	@(cd $(KERNEL_DIR) && make -C $(KERNEL_DIR) SUBDIRS=$(PWD) INSTALL_MOD_DIR=$(INSTALL_MOD_DIR) modules_install)
	depmod -ae

clean:
	-rm -f *.o *.ko .*.cmd .*.flags *.mod.c Modules.symvers
	-rm -rf .tmp_versions

