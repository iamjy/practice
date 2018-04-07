#ifndef _LAB_CHAR_H
#define _LAB_CHAR_H

#include <linux/module.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/sched.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/device.h>

static struct class *foo_class;

#define MYDEV_NAME "mycdrv"

static char *ramdisk;
static size_t ramdisk_size = (4 * PAGE_SIZE);
static dev_t first;
static unsigned int count = 1;
static struct cdev *my_cdev;
static const struct file_operations mycdrv_fops;

static inline int
mycdrv_generic_open(struct inode *inode, struct file *file)
{
	return 0;
}

static inline int
mycdrv_generic_release(struct inode *inode, struct file *file)
{
	return 0;
}

static inline ssize_t
mycdrv_generic_read(struct file *file, char __user *buf, size_t lbuf, loff_t *ppos)
{
	int nBytes;

	return nBytes;
}

static inline ssize_t
mycdrv_generic_write(struct file *file, const char __user *buf, size_t lbuf, loff_t *ppos)
{
	int nBytes;

	return nBytes;
}

static inline loff_t
mycdrv_generic_lseek(struct file *file, loff_t offset, int orig)
{
	loff_t pos;

	return pos;
}

static inline int __init
my_generic_init(void)
{
	return 0;
}

static inline void __exit
my_generic_exit(void)
{

}

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("CLDD 1.0: lab_char.h");
MODULE_LICENSE("GPS v2");
#endif

