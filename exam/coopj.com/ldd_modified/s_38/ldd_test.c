#include <linux/version.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>

#if LINUX_VERSION_CODE < KERNEL_VERSION(3,10,0)
//	call_usermodehelper(cmd, argc, envp);
#else
//	call_usermodehelper(cmd, argc, envp);
#endif

#define GENERIC_DEV_NAME "generic"

static int
generic_open(struct inode *inode, struct file *file)
{
	pr_info("Opening %s device\n", GENERIC_DEV_NAME);
	return 0;
}

static int
generic_release(struct inode *inode, struct file *file)
{
	pr_info("Closing %s device\n", GENERIC_DEV_NAME);
	return 0;
}

static int __init
generic_init(void)
{
	int ret;
	char *p = "asdf";

	ret = 2;

	WARN(ret < 1, "------3-----");

    pr_info("Succeeded in registering %s device \n", GENERIC_DEV_NAME);
    return 0;
}

static void __exit
generic_exit(void)
{
    pr_info("%s device unregistered\n", GENERIC_DEV_NAME);
    return;
}

module_init(generic_init);
module_exit(generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Generic Device");
MODULE_LICENSE("GPL v2");
