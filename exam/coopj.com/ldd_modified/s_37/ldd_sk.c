#include <linux/module.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/thread_info.h>

#define CLEAR(x) memset (&(x), 0, sizeof(x))

#define ISP0 0
#define ISP1 1

#define ISP_HSLCURVE_CNT  4
#define ISP_GAMMA_CNT    11

struct odin_isp_data_bunch {
    struct {
        u32 ySum[256];
    } ae;

    struct {
        u32 rSum;
        u32 gSum;
        u32 bSum;
    } wga;

    struct {
        u32 rSum[256];
		u32 gSum[256];
        u32 bSum[256];
    } awb;

    struct {
        u32 count;
        u32 rSum;
        u32 gSum;
        u32 bSum;
    } ctd[10];
    struct {
        u32 count;
        u32 rSum;
        u32 gSum;
        u32 bSum;
    } ctdtotal;

    struct {
        u32 hpfSum[256];
        u32 lpfSum[256];
    } edge;

	struct {
		u32 ySum[16];
	}afd;
};

struct odin_isp {
    u32 isp_base[2];
    u32 vsync_count[2];
    u32 intr_cnt[2];
    u32 fill_idx[2];
    u32 update_trigger[2];
    u32 hsl_curve_update_flag[2];
    u32 gamma_curve_update_flag[2];
    u32 *hsl_table[2][ISP_HSLCURVE_CNT];
    u32 *gamma_table[2][ISP_GAMMA_CNT];

    struct odin_isp_data_bunch (*acc_buff[2])[2];
};

void func(struct odin_isp_data_bunch *buf)
{
    struct odin_isp_data_bunch *acc_buff = buf;
    acc_buff[1].afd.ySum[10] = 100;
    (buf + 1)->afd.ySum[10] = 10;
    printk(KERN_INFO "%d\n", acc_buff[1].afd.ySum[10]);
}

static struct odin_isp_data_bunch ispd[2];
static struct odin_isp *isp;

static int __devinit dev_init(void)
{
    u32 *p;
    s32 ret;
    u32 i;

    printk(KERN_INFO "==== 1 %d %d %x\n", ret, i, p);

    isp = kzalloc(sizeof(struct odin_isp), GFP_KERNEL);
    if (isp == NULL) {
        printk(KERN_ERR "Failed to allocate memory - isp\n");
    };

    printk(KERN_INFO "==== 2\n");

    for (i = 0; i < 2; i ++) {
        isp->acc_buff[i] = kzalloc(sizeof(struct odin_isp_data_bunch), GFP_DMA);
        if (isp->acc_buff[i] == NULL)
                printk(KERN_ERR "Failed to allocate memory - acc_buff[%d]\n", i);

        printk("%p\n", isp->acc_buff[i]);
    }

    printk(KERN_INFO "1-sizeof %d byte\n", sizeof(struct odin_isp_data_bunch));
    printk(KERN_INFO "2-sizeof %d byte\n", sizeof(ispd));
    printk(KERN_INFO "2-sizeof %d byte\n", sizeof(ispd[0]));
    printk(KERN_INFO "3-sizeof %d byte\n", sizeof(ispd[1]));
    printk(KERN_INFO "4-sizeof %d byte\n", sizeof(*isp->acc_buff[0]));
    printk(KERN_INFO "5-sizeof %d byte\n", sizeof(*isp->acc_buff[1]));
    printk(KERN_INFO "6-sizeof %d byte\n", sizeof(*isp->acc_buff[0][0]));
    printk(KERN_INFO "7-sizeof %d byte\n", sizeof(*isp->acc_buff[0][1]));
    printk(KERN_INFO "8-sizeof %d byte\n", sizeof(*isp->acc_buff[1][0]));
    printk(KERN_INFO "9-sizeof %d byte\n", sizeof(*isp->acc_buff[1][1]));

    (isp->acc_buff[ISP1][0])->afd.ySum[5] = 98;
    printk(KERN_INFO "%d\n", (isp->acc_buff[ISP1][0])->afd.ySum[5]);

   func(isp->acc_buff[0]);

    printk(KERN_INFO "==== 4\n %ld %ld", sizeof(u64), sizeof(unsigned long));

    if (NULL != isp->acc_buff[ISP0])
        kfree(isp->acc_buff[ISP0]);
    if (NULL != isp->acc_buff[ISP1])
        kfree(isp->acc_buff[ISP1]);
    
    printk(KERN_INFO "==== 5\n");

    return 0;
}

static void __devexit dev_exit(void)
{
    return;
}

module_init(dev_init);
module_exit(dev_exit);

MODULE_LICENSE("GPL v2");
