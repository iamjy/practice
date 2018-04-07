#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>

static s32 __init
generic_init(void)
{
    u32 i = 0;

    for (i = 0; i < 100; i++) {
        if (printk_ratelimit())
            printk(KERN_INFO "A messages\n");
    }
    printk(KERN_INFO "another messages\n");

    pr_info("tgid: %d\n", current->tgid);
    pr_info("pid: %d\n", current->pid);

    return 0;
}

static void __exit
generic_exit(void)
{
    printk(KERN_INFO "exit moduln");
}

module_init(generic_init);
module_exit(generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Platform Module");
MODULE_LICENSE("GPL v2");

