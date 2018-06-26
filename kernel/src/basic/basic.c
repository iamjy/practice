#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/fcntl.h>

#include <asm/uaccess.h>
#include <asm/io.h>

#define ENTER printk(KERN_INFO "%s - IN", __FUNCTION__)
#define LEAVE printk(KERN_INFO "%s - OUT", __FUNCTION__)

static int
my_open(struct inode *inode, struct file *fp)
{
	return 0;
}

static int
my_release (struct inode *inode, struct file *fp)
{
	return 0;
}

static ssize_t
my_read (struct file *fp, const char __user *buf, size_t lbuf, loff_t *f_pos)
{
	return 0;
}

static ssize_t
my_write (struct file *fp, const char __user *buf, size_t lbuf, loff_t *f_pos)
{
	return 0;
}

static loff_t
mycdrv_generic_llseek(struct file *file, loff_t offset, int orig)
{
	loff_t pos;

	return pos;
}

struct file_operations my_fops = {
	.owner = THIS_MODULE,
	.read = mycdrv_generic_read,
	.write = mycdrv_generic_rite,
	.llseek = mycdrv_generic_llseek,
	.open = mycdrv_generic_pen,
	.release = mycdrv_generic_elease
};

static int __init
mycdrv_generic_init (void)
{
	printk(KERN_INFO "Hello: module loaded at 0x%p\n", my_init);

	return 0;
}

static void __exit
mycdrv_generic_exit (void)
{
	printk(KERN_INFO "Bye: module unloaded from 0x%p\n", my_exit);
}

module_init (mycdrv_generic_init);
module_exit (mycdrv_generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_LICENSE("GPL v2");
