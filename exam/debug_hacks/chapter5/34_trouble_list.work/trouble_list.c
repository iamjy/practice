#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/kthread.h> // for kthread_run()
#include <linux/delay.h>   // for msleep()
#include <linux/list.h>    // for list
#include <linux/slab.h>    // for kmalloc()
#include <linux/spinlock.h>

/*
 * How to use this TP.
 * make -C <kernel source path> M=`pwd` modules
 * insmod trouble_list.ko
 * rmmod trouble_list
 */

DEFINE_SPINLOCK(trouble_lock);

struct k_trouble_list {
        struct list_head list;
        /* spinlock_t lock; */
};

static struct k_trouble_list trouble = {
	.list = LIST_HEAD_INIT(trouble.list)
	/* .lock = SPIN_LOCK_UNLOCKED */
};

struct k_entry {
	struct list_head list;
};

static int list_add_thread(void *data)
{
	int i;
	
	do {
		spin_lock(&trouble_lock);
	        printk(KERN_INFO "%s-1(%d)\n", __func__, get_cpu());
		for (i = 0; i < 100000; i++) {
			struct k_entry *entry;

			entry = kmalloc(sizeof(struct k_entry),GFP_ATOMIC);
			INIT_LIST_HEAD(&entry->list);
			list_add(&entry->list, &trouble.list);
			printk(KERN_INFO "%d\n", i);
		}
		spin_unlock(&trouble_lock);
        	printk(KERN_INFO "%s-2(%d)\n", __func__, get_cpu());
		msleep(200);
	} while (!kthread_should_stop());

	return 0;
}

static int list_release_thread(void *data)
{
	do {
		spin_lock(&trouble_lock);
		printk(KERN_INFO "%s-1(%d)\n", __func__, get_cpu());
		while (!list_empty(&trouble.list)) {
			struct k_entry *entry;

			entry = list_entry(trouble.list.next, struct k_entry, list);
			list_del(&entry->list);
			kfree(entry);
		}
		spin_unlock(&trouble_lock);
		printk(KERN_INFO "%s-2(%d)\n", __func__, get_cpu());
		msleep(100);
	} while (!kthread_should_stop());

	return 0;
}

static int list_del_thread(void *data)
{
	do {
		if (!list_empty(&trouble.list)){
			struct k_entry *entry;
			spin_lock(&trouble_lock);
			printk(KERN_INFO "%s-1(%d)\n", __func__, get_cpu());
			entry = list_entry(trouble.list.next, struct k_entry, list);
			list_del(&entry->list);
			kfree(entry);
			spin_unlock(&trouble_lock);
			printk(KERN_INFO "%s-2(%d)\n", __func__, get_cpu());
		}
		msleep(1);
	} while (!kthread_should_stop());

	return 0;
}

struct task_struct *kthread1 = NULL;
struct task_struct *kthread2 = NULL;
struct task_struct *kthread3 = NULL;

static int __init trouble_list_init(void)
{
    if (kthread1 == NULL)
	    kthread1 = kthread_run(list_add_thread, NULL, "list_add");
    if (kthread2 == NULL)
	    kthread2 = kthread_run(list_release_thread, NULL, "list_release");
    if (kthread3 == NULL)
        kthread3 = kthread_run(list_del_thread, NULL, "list_del");

	return 0;
}

static void __exit trouble_list_exit(void)
{
	if (kthread1 != NULL) kthread_stop(kthread1);
	if (kthread2 != NULL) kthread_stop(kthread2);
	if (kthread3 != NULL) kthread_stop(kthread3);

    return;
}

module_init(trouble_list_init);
module_exit(trouble_list_exit);

MODULE_AUTHOR("Naohiro Ooiwa <nooiwa@miraclelinux.com>");
MODULE_DESCRIPTION("The test program for list corruption.");
MODULE_LICENSE("GPL");
