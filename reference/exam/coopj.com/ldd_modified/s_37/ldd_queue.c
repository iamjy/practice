#include <linux/module.h>
#include <asm/atomic.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/kfifo.h>

#define ENTER printk(KERN_INFO "ENTER: %s()", __func__)
#define LEAVE printk(KERN_INFO "LEAVE: %s()", __func__)

static int __devinit dev_init(void)
{    
    struct kfifo fifo;
    int i, ret;
    unsigned int len;
    unsigned int data_in[10];
    unsigned int data_out[10];
    unsigned int data_out2[10];

    ENTER;

    for (i = 0; i < 3; i++)
    {
         data_in[i] = i;
    }

    ret = kfifo_alloc(&fifo, sizeof(unsigned int) * 4, GFP_KERNEL);

    if (ret < 0)
        printk(KERN_INFO "kfifo failed\n");
    else
        printk(KERN_INFO "kfifo memory allocation is success %d \n", kfifo_size(&fifo));

    len = kfifo_in(&fifo, data_in, sizeof(data_in[0]) * 3);
    printk(KERN_INFO "write data size = %d\n", len);
    printk(KERN_INFO "write data size = %d\n", kfifo_len(&fifo));
    printk(KERN_INFO "avail data size = %d\n", kfifo_avail(&fifo));
    len = kfifo_out_peek(&fifo, data_out, sizeof(data_out[0]) * 20);
    len = kfifo_out(&fifo, data_out2, sizeof(data_out2[0]) * 20);
    printk(KERN_INFO "read data size = %d\n", len);

    for (i = 0; i < 3; i++)
    {
        printk(KERN_INFO "%d\n", data_out[i]);
        printk(KERN_INFO "%d\n", data_out2[i]);
    }
    
    LEAVE;
    return 0;
}

static void __devexit dev_exit(void)
{
}

module_init(dev_init);
module_exit(dev_exit);

MODULE_LICENSE("GPL v2");
