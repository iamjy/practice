/* **************** LDD:2.0 s_08/lab1_interrupt.c **************** */
/*
 * The code herein is: Copyright Jerry Cooperstein, 2012
 *
 * This Copyright is retained for the purpose of protecting free
 * redistribution of source.
 *
 *     URL:    http://www.coopj.com
 *     email:  coop@coopj.com
 *
 * The primary maintainer for this code is Jerry Cooperstein
 * The CONTRIBUTORS file (distributed with this
 * file) lists those known to have contributed to the source.
 *
 * This code is distributed under Version 2 of the GNU General Public
 * License, which you should have received with the source.
 *
 */
/*
 * Shared Interrupts
 *
 * Write a module that shares its IRQ with your network card.  You can
 * generate some network interrupts either by browsing or pinging.
 * (If you have trouble with the network driver, try using the mouse
 * interrupt.)
 *
 * Check /proc/interrupts while it is loaded.
 *
 * Have the module keep track of the number of times the interrupt
 * handler gets called.
 @*/

#include <linux/module.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/delay.h>
#include <linux/slab.h>
#include <linux/mutex.h>
#include <linux/spinlock.h>
#include <linux/semaphore.h>

#define SHARED_IRQ_0    19
#define SHARED_IRQ_1    21

static struct data {
    u32 irq_count;

    struct mutex      mtlock;
    struct semaphore  smlock;
    spinlock_t        splock;

    struct tasklet_struct tasklet;
    struct work_struct    workq;

    struct completion done;
    struct list_head  head;
};

static struct node {
    u32 index;
    s32 count;

    struct list_head entry;
};

static s32 i          = 0;
static s32 my_dev_id_0 = 0;
static s32 my_dev_id_1 = 0;
static s32 irq_0 = SHARED_IRQ_0, irq_0_counter = 0;
static s32 irq_1 = SHARED_IRQ_1, irq_1_counter = 0;

static struct list_head  snd_head;
static struct list_head  eth_head;
static struct data       *data_0 = NULL;
static struct data       *data_1 = NULL;

static void
pop_0(void)
{
    struct node      *ptr = NULL;
    struct list_head *pos = NULL, *safe = NULL;
    unsigned long flag;

    // down_interruptible(&data_0->smlock); // wq
    spin_lock_irq(&data_0->splock);
    list_for_each_safe(pos, safe, &data_0->head) {
        ptr = list_entry(pos, struct node, entry);
        pr_info("[snd] index(%d) count(%d)\n", ptr->index, ptr->count);
        list_del(&ptr->entry);
        // up(&data_0->smlock);
        spin_unlock_irq(&data_0->splock); // wq
        kfree(ptr);
    }
}

static void
push_0(u32 index)
{
    struct node *node_0 = NULL;

    if (in_interrupt())
        pr_info("%s(): Running as an interrupt\n", __func__);
    else
        pr_info("%s(): Running as an process\n", __func__);

    node_0 = (struct node *)kzalloc(sizeof(struct node), GFP_ATOMIC);
    node_0->index = index;
    node_0->count = irq_0_counter;
    // down_interruptible(&data_0->smlock); // wq
    spin_lock_irq(&data_0->splock); // wq
    list_add_tail(&node_0->entry, &data_0->head);
    // up(&data_0->smlock); // wq
    spin_unlock_irq(&data_0->splock); // wq
}

static void
// func_0(void)
func_0(unsigned long data)
// func_0(struct work_struct *w_arg)
{
    static u32 i = 0;

    i++;
    push_0(i);
}

static void
pop_1(void)
{
    struct node      *ptr = NULL;
    struct list_head *pos = NULL, *safe = NULL;

    // down_interruptible(&data_1->smlock); // wq
    // spin_lock_irq(&data_1->splock);
    if (list_empty(&eth_head)) {
    } else {
        list_for_each_safe(pos, safe, &data_1->head) {
            ptr = list_entry(pos, struct node, entry);
            pr_info("[eth] index(%d) count(%d)\n", ptr->index, ptr->count);
            list_del(&ptr->entry);
            // up(&data_1->smlock); // wq
            // spin_unlock_irq(&data_1->splock); // wq
            kfree(ptr);
        }
    }
}

static void
push_1(u32 index)
{
    struct node *node_1 = NULL;

    if (in_interrupt())
        pr_info("%s(): Running as an interrupt\n", __func__);
    else
        pr_info("%s(): Running as an process\n", __func__);

    node_1 = (struct node *)kzalloc(sizeof(struct node), GFP_ATOMIC);
    node_1->index = index;
    node_1->count  = irq_1_counter;
    // down_interruptible(&data_1->smlock); // wq
    // spin_lock_irq(&data_1->splock);
    list_add_tail(&node_1->entry, &data_1->head);
    // up(&data_1->smlock); // wq
    // spin_unlock_irq(&data_1->splock);
}

static void
// func_1(void)
func_1(unsigned long data)
// func_1(struct work_struct *w_arg)
{
    static u32 i = 0;

    i++;
    push_1(i);
}

int a = 0;

static irqreturn_t
interrupt_0(s32 irq_0, void *dev_id)
{
    ++irq_0_counter;

    // pr_info("%s(): IN\n", __func__);

    // pr_info("%s(): %d\n", __func__, ++irq_0_counter);

    // spin_lock(&data_0->splock);
    // pr_info("%s(): lock\n", __func__);
    // pr_info("%s():: %d\n", __func__, ++a);
    // pr_info("%s(): unlock\n", __func__);
    // spin_unlock(&data_0->splock);

    // schedule_work(&data_0->workq);
    tasklet_schedule(&data_0->tasklet);
    // func_0(0);

    // pr_info("%s(): OUT\n", __func__);

	return IRQ_HANDLED;	/* we return IRQ_NONE because we are just observing */
}

static irqreturn_t
interrupt_1(s32 irq_0, void *dev_id)
{
    ++irq_1_counter;

    // pr_info("%s(): IN\n", __func__);

    // pr_info("%s(): %d\n", __func__, ++irq_1_counter);

    //spin_lock(&data_0->splock);
    //pr_info("%s(): lock\n", __func__);
    // pr_info("%s():: %d\n", __func__, ++a);
    //pr_info("%s(): unlock\n", __func__);
    //spin_unlock(&data_0->splock);

    // schedule_work(&data_1->workq);
    tasklet_schedule(&data_1->tasklet);
    // func_1();

    // pr_info("%s(): OUT\n", __func__);

	return IRQ_HANDLED;	/* we return IRQ_NONE because we are just observing */
}

// DECLARE_WORK(snd_wq, func_0);
// DECLARE_TASKLET(snd_task, func_0,0);

static s32 __init
my_init(void)
{
    data_0 = (struct data *)kzalloc(sizeof(struct data), GFP_KERNEL);
    data_1 = (struct data *)kzalloc(sizeof(struct data), GFP_KERNEL);

    mutex_init(&data_0->mtlock);
    mutex_init(&data_1->mtlock);

    sema_init(&data_0->smlock, 1);
    sema_init(&data_1->smlock, 1);

    spin_lock_init(&data_0->splock);
    spin_lock_init(&data_1->splock);

    tasklet_init(&data_0->tasklet, func_0, 0);
    tasklet_init(&data_1->tasklet, func_1, 0);

    INIT_WORK(&data_0->workq, func_0);
    INIT_WORK(&data_1->workq, func_1);

    INIT_LIST_HEAD(&data_0->head);
    INIT_LIST_HEAD(&data_1->head);

	if (request_irq
	    (irq_0, interrupt_0, IRQF_SHARED, "interrupt_0", &my_dev_id_0)) {
		pr_err("Failed to reserve irq_0 %d\n", irq_0);
		return -1;
	}

    if (request_irq
        (irq_1, interrupt_1, IRQF_SHARED, "interrupt_1", &my_dev_id_1)) {
        pr_err("Failed to reserve irq_1 %d\n", irq_1);
        return -1;
    }

    pr_info("Successfully loading ISR handler\n");
	return 0;
}

static void __exit
my_exit(void)
{
    // synchronize_irq(irq_0);
    // synchronize_irq(irq_1);

	free_irq(irq_0, &my_dev_id_0);
	free_irq(irq_1, &my_dev_id_1);

    pop_0();
    pop_1();

    kfree(data_0);
    kfree(data_1);

    irq_0_counter = 0;
    irq_1_counter = 0;
    a = 0;

	pr_info("Successfully unloading\n");
}

module_init(my_init);
module_exit(my_exit);

MODULE_AUTHOR("Jerry Cooperstein");
MODULE_DESCRIPTION("LDD:2.0 s_08/lab1_interrupt.c");
MODULE_LICENSE("GPL v2");
