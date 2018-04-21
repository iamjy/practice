/* **************** LDD_BASE:1.0 ldd_char.h **************** */
/*
 * The code herein is: Copyright Jinyoung Park, 2012
 *
 * This Copyright is retained for the purpose of protecting free
 * redistribution of source.
 *
 *     URL:    https://sites.google.com/site/aboutlinuxkernel
 *     email:  iamjy1005@gmail.com
 *
 * The primary maintainer for this code is Jerry Cooperstein
 * The CONTRIBUTORS file (distributed with this
 * file) lists those known to have contributed to the source.
 *
 * This code is distributed under Version 2 of the GNU General Public
 * License, which you should have received with the source.
 *
 */

#ifndef __LDD_CHARDEV_H__
#define __LDD_CHARDEV_H__

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/cdev.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/mm.h>   /* vm_area_struct, vm_operations_struct */

#define _CHAR_DEV_NAME "char_dev"

const struct file_operations char_fops;
static dev_t        dev;
static __u32        dev_cnt = 1;    /* Number of dev_t needed */
static struct cdev  *chrdev;
static struct class *chrdev_class;

extern __u32 charfunc (__u32 var) /* EXPORT_SYMBOL */
{
    pr_info("%s is called by other mopdule", __FUNCTION__);
    return 0;
}

static inline __s32 
_open(struct inode *inode, struct file *file)
{
	static __s32 open_cnt = 0;

	pr_info("Attempting to open device: %s:\n", _CHAR_DEV_NAME);
	pr_info("MAJOR = %d, MINOR = %d\n", imajor(inode), iminor(inode));

	open_cnt++;

	pr_info("Successfully open device: %s:\n\n", _CHAR_DEV_NAME);
	pr_info("I have been opened %d times since being loaded\n", open_cnt);
	pr_info("ref=%d\n", (__s32)module_refcount(THIS_MODULE));

	return 0;
}

static inline __s32
_release(struct inode *inode, struct file *file)
{
	pr_info("Closing [_] device: %s:\n\n", _CHAR_DEV_NAME);
	return 0;
}

static inline ssize_t
_read(struct file *file, char __user * buf, size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes;
    return nbytes;
}

static inline ssize_t
_write(struct file *file, const char __user * buf, size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes;
    return nbytes;
}

static inline loff_t
_lseek(struct file *file, loff_t offset, __s32 orig)
{
    loff_t pos;
    return pos;
}

static __s32 __devinit generic_init(void)
{
#if 1
    if (alloc_chrdev_region(&dev, 0, dev_cnt, _CHAR_DEV_NAME) < 0) {
		pr_err("Failed to allocate character device region\n");
		return -1;
	}
#else /* Either of these will work */
    dev = MKDEV(my_major, my_minor);
	if (register_chrdev_region(dev, dev_cnt, _CHAR_DEV_NAME) < 0) {
		pr_err("Failed to register character device region\n");
		return -1;
	}
#endif
	if (!(chrdev = cdev_alloc())) {
		pr_err("cdev_alloc() failed\n");
		unregister_chrdev_region(dev, dev_cnt);
		return -1;
	}

	cdev_init(chrdev, &char_fops);

	if (cdev_add(chrdev, dev, dev_cnt) < 0) {
		pr_err("cdev_add() failed\n");
		cdev_del(chrdev);
		unregister_chrdev_region(dev, dev_cnt);
		return -1;
	}

	chrdev_class = class_create(THIS_MODULE, "cdev_class");
	device_create(chrdev_class, NULL, dev, NULL, "%s", "cdev");

	pr_info("Succeeded in registering [_] device %s\n", _CHAR_DEV_NAME);
	pr_info("Major = %d, Minor = %d\n", MAJOR(dev), MINOR(dev));
    pr_info("Succeeded in registering [_] device %s\n", _CHAR_DEV_NAME);

    return 0;
}

static void __devexit generic_exit(void)
{
#if 1
	device_destroy(chrdev_class, dev);
	class_destroy(chrdev_class);
#endif
    if (chrdev)
		cdev_del(chrdev);

	unregister_chrdev_region(dev, dev_cnt);
    pr_info("[_] device unregistered\n");
    return;
}

EXPORT_SYMBOL(charfunc);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Device Driver CHARDEV");
MODULE_LICENSE("GPL v2");

#endif

