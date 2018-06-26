#ifndef _LAB_CHAR_H
#define _LAB_CHAR_H

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/fcntl.h>
#include <linux/timer.h>
#include <linux/cdev.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/sched.h>
#include <linux/device.h>

#define ENTER printk(KERN_INFO "%s - IN\n", __FUNCTION__)
#define LEAVE printk(KERN_INFO "%s - OUT\n", __FUNCTION__)

#define RDWR_DEV_NAME    "mycdrv_generic_dev"
#define RDWR_DEV_MAJOR   240

struct mycdrv_dev_st {
	struct cdev cdev;
};

#endif
