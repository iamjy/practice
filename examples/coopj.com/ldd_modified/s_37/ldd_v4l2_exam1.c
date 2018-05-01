/* **************** LDD_BASE:1.0 ldd_v4l2.c **************** */
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
#include "ldd_v4l2.h"

#define SHARED_IRQ_SND 5
#define SHARED_IRQ_ETH 10

struct handler {
    __u32 index;
    __u32 irq_cnt;

    struct list_head list;
};

static __s32                my_dev_id1;
static __s32                my_dev_id2;
static __s32                irq_snd = SHARED_IRQ_SND;
static __s32                irq_eth = SHARED_IRQ_ETH;
static __u32                i = 0;
static spinlock_t           lock;
static struct task_struct   *task;
static struct work_struct   workq_snd;
static struct work_struct   workq_eth;
static struct semaphore     sem;
static struct list_head     head;
static struct handler       node[2048];
static struct video_device *vid_dev = NULL;

DEFINE_MUTEX(mutex);

DECLARE_WAIT_QUEUE_HEAD(wq);

static void push_cnt(struct work_struct *w_arg);
static void pop_cnt(struct work_struct *w_arg);

static int
_camera_v4l2_queryctrl(struct file *file, void *fh,
    struct v4l2_queryctrl *c)
{
    return 0;
}

static int
_camera_v4l2_querycap(struct file *file, void *fh,
    struct v4l2_capability *cap)
{
    return 0;
}

static int
_camera_v4l2_enum_input(struct file *file, void *fh,
    struct v4l2_input *i)
{
    return 0;
}

static int
_camera_v4l2_cropcap(struct file *file, void *fh,
    struct v4l2_cropcap *cropcap)
{
    return 0;
}

static int
_camera_v4l2_g_crop(struct file *file, void *fh,
    struct v4l2_crop *crop)
{
    return 0;
}

static int
_camera_v4l2_s_crop(struct file *file, void *fh,
    struct v4l2_crop *crop)
{
    return 0;
}

static int
_camera_v4l2_g_input(struct file *file, void *fh,
    unsigned int *i)
{
    return 0;
}

static int
_camera_v4l2_s_input(struct file *file, void *fh,
    unsigned int i)
{
    return 0;
}

static int
_camera_v4l2_s_ctrl(struct file *file, void *fh,
    struct v4l2_control *c)
{
    return 0;
}

static int
_camera_v4l2_g_ctrl(struct file *file, void *fh,
    struct v4l2_control *c)
{
    return 0;
}


static int
_camera_v4l2_s_ext_ctrls(struct file *file, void *fh,
    struct v4l2_ext_controls *a)
{
    return 0;
}

static int
_camera_v4l2_g_fbuf(struct file *file, void *fh,
    struct v4l2_framebuffer *a)
{
    return 0;
}

static int
_camera_v4l2_s_fbuf(struct file *file, void *fh,
    struct v4l2_framebuffer *a)
{
    return 0;
}

static int
_camera_v4l2_enum_fmt_vid_cap(struct file *file, void *fh,
    struct v4l2_fmtdesc *f)
{
    return 0;
}

static int
_camera_v4l2_try_fmt_vid_cap(struct file *file, void *fh,
    struct v4l2_format *f)
{
    return 0;
}

static int
_camera_v4l2_g_fmt_vid_cap(struct file *file, void *fh,
    struct v4l2_format *f)
{
    return 0;
}

static int
_camera_v4l2_s_fmt_vid_cap(struct file *file, void *fh,
    struct v4l2_format *f)
{
    return 0;
}


static int
_camera_v4l2_reqbufs(struct file *file, void *fh,
    struct v4l2_requestbuffers *req)
{
    return 0;
}

static int
_camera_v4l2_querybuf(struct file *file, void *fh,
    struct v4l2_buffer *buf)
{
    return 0;
}

static int
_camera_v4l2_qbuf(struct file *file, void *fh,
	struct v4l2_buffer *buf)
{
    return 0;
}

static int
_camera_v4l2_dqbuf(struct file *file, void *fh,
    struct v4l2_buffer *buf)
{
    return 0;
}

static int
_camera_v4l2_streamon(struct file *file, void *fh,
    enum v4l2_buf_type type)
{
    return 0;
}

static int
_camera_v4l2_streamoff(struct file *file, void *fh,
    enum v4l2_buf_type type)
{
     return 0;
}

static long
_camera_v4l2_default(struct file *file, void *fh,
    bool valid_prio,
    int cmd,
    void *arg)
{

    return 0;
}

static __s32
_drv_open(struct file *file)
{
	static __s32 open_cnt = 0;

	pr_info("Attempting to open device: %s:\n", _V4L2DEV_NAME);

	open_cnt++;

	pr_info("Successfully open device: %s:\n\n", _V4L2DEV_NAME);
	pr_info("I have been opened %d times since being loaded\n", open_cnt);
	pr_info("ref = %d\n", (__s32)module_refcount(THIS_MODULE));

	return 0;
}

static __s32
_drv_release(struct file *file)
{
	pr_info("Closing %s device\n", _V4L2DEV_NAME);
	return 0;
}

static __u32
_drv_poll(struct file *file, poll_table *wait)
{
    s32 mask = 0;

    poll_wait(file, &wq, wait);
    pr_info("In poll at jiffies = %ld\n", jiffies);

    /* if (...) mask |= (POLLIN  | POLLRDNORM); */
    /* if (...) mask |= (POLLOUT | POLLWRNORM); */

    return mask;
}

static int
thr_fun(void *thr_arg)
{

}

static void
push_cnt(struct work_struct *w_arg)
{
    struct handler   *search = NULL;
    struct list_head *pos    = NULL;
    unsigned long     flags;

    if (i > 2047)
        i = 0;

    i++;

    node[i].index   = i;
    node[i].irq_cnt = i + 10;

    local_irq_save(flags);
    list_for_each(pos, &head) {
        search = list_entry(pos, struct handler, list);
        if (search->index == i)
            return;
    }
    list_add_tail(&node[i].list, &head);
    local_irq_restore(flags);

    /* wake_up_interruptible(&wq); */
}

static void
pop_cnt(struct work_struct *w_arg)
{
    struct handler   *search = NULL;
    struct list_head *pos    = NULL;
    unsigned long     flags;

    local_irq_save(flags);
    if (!list_empty(&head)) {
        search = list_first_entry(&head, struct handler, list);
        list_del(&search->list);
    }
    local_irq_restore(flags);
}

static irqreturn_t
isr_snd(s32 irq, void *dev)
{
    schedule_work(&workq_snd);

	return IRQ_NONE;	/* we return IRQ_NONE because we are just observing */
}

static irqreturn_t
isr_eth(s32 irq, void *dev)
{
    schedule_work(&workq_eth);

	return IRQ_NONE;	/* we return IRQ_NONE because we are just observing */
}

const struct v4l2_ioctl_ops _camera_v4l2_ioctl_ops = {
    .vidioc_queryctrl        = _camera_v4l2_queryctrl,
    .vidioc_querycap         = _camera_v4l2_querycap,
    .vidioc_enum_input       = _camera_v4l2_enum_input,
    .vidioc_cropcap          = _camera_v4l2_cropcap,
    .vidioc_g_crop           = _camera_v4l2_g_crop,
    .vidioc_s_crop           = _camera_v4l2_s_crop,
    .vidioc_g_input          = _camera_v4l2_g_input,
    .vidioc_s_input          = _camera_v4l2_s_input,
    .vidioc_s_ctrl           = _camera_v4l2_s_ctrl,
    .vidioc_g_ctrl           = _camera_v4l2_g_ctrl,
    .vidioc_s_ext_ctrls      = _camera_v4l2_s_ext_ctrls,
    .vidioc_g_fbuf           = _camera_v4l2_g_fbuf,
    .vidioc_s_fbuf           = _camera_v4l2_s_fbuf,
    .vidioc_enum_fmt_vid_cap = _camera_v4l2_enum_fmt_vid_cap,
    .vidioc_try_fmt_vid_cap  = _camera_v4l2_try_fmt_vid_cap,
    .vidioc_g_fmt_vid_cap    = _camera_v4l2_g_fmt_vid_cap,
    .vidioc_s_fmt_vid_cap    = _camera_v4l2_s_fmt_vid_cap,
    .vidioc_reqbufs          = _camera_v4l2_reqbufs,
    .vidioc_querybuf         = _camera_v4l2_querybuf,
    .vidioc_qbuf             = _camera_v4l2_qbuf,
    .vidioc_dqbuf            = _camera_v4l2_dqbuf,
    .vidioc_streamon         = _camera_v4l2_streamon,
    .vidioc_streamoff        = _camera_v4l2_streamoff,
    .vidioc_default          = _camera_v4l2_default,
};

const struct v4l2_file_operations _camera_v4l2_fops =
{
    .owner 		    = THIS_MODULE,
    .open 		    = _drv_open,
    .release 	    = _drv_release,
    .unlocked_ioctl = video_ioctl2,
    .mmap 		    = NULL,
    .read 		    = NULL,
    .write 		    = NULL,
    .poll 		    = _drv_poll,
};

struct video_device _camera_v4l2_dev = {
    .name      = _V4L2DEV_NAME,
    .fops      = &_camera_v4l2_fops,
    .ioctl_ops = &_camera_v4l2_ioctl_ops,
    .release   = video_device_release,
};

static __s32 __init
generic_init(void)
{
    __s32 ret = 0;

    /* Allocate v4l2 device */
	vid_dev = video_device_alloc();
    if (!vid_dev)
    {
        pr_err("video_dev was failed to allocate!");
        goto error_video_alloc;
    }

    /* Initialize v4l2 device */
    memcpy(vid_dev, &_camera_v4l2_dev, sizeof(_camera_v4l2_dev));

    video_set_drvdata(vid_dev, NULL);

    /* Registers v4l2 device to v4l2 layer of kernel */
    ret = video_register_device(vid_dev, VFL_TYPE_GRABBER, -1);
    if (ret) {
		pr_err("Failed to register video device");
        goto error_video_reg;
    }

    if (request_irq
	    (irq_snd, isr_snd, IRQF_SHARED, _V4L2DEV_NAME, (void *)&my_dev_id1)) {
		pr_err("Failed to reserve irq_snd %d\n", irq_snd);
		return -1;
	}

    if (request_irq
	    (irq_eth, isr_eth, IRQF_SHARED, _V4L2DEV_NAME, (void *)&my_dev_id2)) {
		pr_err("Failed to reserve irq_eth %d\n", irq_eth);
		return -1;
	}

    if (!(task = kthread_run(thr_fun, (void *)0, "thr_fun"))) {
        pr_err("Failed to generate a kernel thread\n");
        return -1;
    }

    sema_init(&sem, 1);
    mutex_init(&mutex);
    spin_lock_init(&lock);

    INIT_LIST_HEAD(&head);

    INIT_WORK(&workq_snd, push_cnt);
    INIT_WORK(&workq_eth, pop_cnt);

    return 0;

error_video_reg:
    video_device_release(vid_dev);
error_video_alloc:
    return ret;
}

static void __exit
generic_exit(void)
{
    free_irq(irq_snd, (void *)&my_dev_id1);
    free_irq(irq_eth, (void *)&my_dev_id2);
    video_device_release(vid_dev);

    return;
}

module_init(generic_init);
module_exit(generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Platform Module");
MODULE_LICENSE("GPL v2");
