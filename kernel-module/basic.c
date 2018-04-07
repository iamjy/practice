#include <linux/module.h>
#include <linux/init.h>
#include <linux/delay.h>

static int my_loop(void);

static int my_loop (void)
{
	static int nCnt = 0;
	msleep(100);
	return 0;
}

static int __init my_init (void)
{
	printk(KERN_INFO "Hello: module loaded at 0x%p\n", my_init);

	while (1)
	{
		my_loop();
	}

	return 0;
}

static void __exit my_exit (void)
{
	printk(KERN_INFO "Bye: module unloaded from 0x%p\n", my_exit);
}

module_init (my_init);
module_exit (my_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_LICENSE("GPL v2");
