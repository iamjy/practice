#include <linux/module.h>
#include "lab_char.h"
#include <linux/timer.h>

static struct timer_list my_timer;

static void
my_timer_function(unsigned long ptr)
{

}

static ssize_t
mycdrv_write(struct file *file, const char __user *buf, size_t lbuf, loff_t *ppos)
{
	return lbuf;
}

static const struct file_operations mycdrv_fops = {
	.owner = THIS_MODULE,
	.read = mycdrv_generic_read,
	.write = mycdrv_write,
	.open = mycdrv_generic_open,
	.release = mycdrv_generic_release,
};

static void __exit
my_exit(void)
{

}

module_init(my_generic_init);
module_exit(my_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("CLDD 1.0: lab1_timer.c");
MODULE_LICENSE("GPL v2");

