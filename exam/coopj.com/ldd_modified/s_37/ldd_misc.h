/* **************** LDD_BASE:1.0 ldd_base.h **************** */
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

#ifndef __LDD_MISCDEV_H__
#define __LDD_MISCDEV_H__

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/mm.h>   /* vm_area_struct, vm_operations_struct */

#define _MISC_DEV_NAME "misc_dev"

extern const struct file_operations misc_fops;

extern __s32 miscfunc(__s32 var) /* EXPORT_SYMBOL */
{
    pr_info("%s is called by other mopdule", __FUNCTION__);
    return 0;
}

static inline __s32 
_open(struct inode *inode, struct file *file)
{
    static __s32 open_cnt = 0;

    pr_info("Attempting to open device: %s:\n", _MISC_DEV_NAME);
    pr_info("MAJOR = %d, MINOR = %d\n", imajor(inode), iminor(inode));

#ifdef MULTI_PROCESS
    filep->private_data = kamlloc(sizeof(0/* Data */), GFP_KERNEL);
#endif

    open_cnt++;

    pr_info("Successfully open device: %s:\n\n", _MISC_DEV_NAME);
    pr_info("I have been opened %d times since being loaded\n", open_cnt);
    pr_info("ref=%d\n", (__s32)module_refcount(THIS_MODULE));

    return 0;
}

static inline __s32
_release(struct inode *inode, struct file *file)
{
    pr_info("Closing %s device\n", _MISC_DEV_NAME);

#ifdef MULTI_PROCESS
    kfree(filep->private_data);
#endif

	return 0;
}

static inline ssize_t
_read(struct file *file, char __user * buf, size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes = 0;
    return nbytes;
}

static inline ssize_t
_write(struct file *file, const char __user * buf, size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes = 0;
    return nbytes;
}

static inline loff_t
_lseek(struct file *file, loff_t offset, __s32 orig)
{
    loff_t pos = 0;
    return pos;
}

static struct miscdevice misc_device = {
    .minor = MISC_DYNAMIC_MINOR,
    .name  = _MISC_DEV_NAME,
    .fops  = &misc_fops,
};

static __s32 __devinit generic_init(void)
{
    if (misc_register(&misc_device)) {
        pr_err("Failed to register %s device\n", _MISC_DEV_NAME);
        return -EBUSY;
    }

    pr_info("Succeeded in registering %s device\n", _MISC_DEV_NAME);
    return 0;
}

static void __devexit generic_exit(void)
{
    misc_deregister(&misc_device);
    pr_info("%s device unregistered\n", _MISC_DEV_NAME);
    return;
}

EXPORT_SYMBOL(miscfunc);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Misc Device Driver Header File");
MODULE_LICENSE("GPL v2");

#endif
