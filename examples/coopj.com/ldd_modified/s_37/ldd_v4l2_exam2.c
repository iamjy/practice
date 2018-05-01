/* **************** LDD_BASE:1.0 ldd_v4l2_exam2.c **************** */
/*
 * The code herein is: Copyright Jinyoung Park, 2013
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
/******************************************************************************
    Internal header files
******************************************************************************/
#include "ldd_v4l2_exam2.h"

/******************************************************************************
    Static variables
******************************************************************************/
static struct video_device *vid_dev = NULL;

DECLARE_WAIT_QUEUE_HEAD(WaitQueue_Read);
DECLARE_WAIT_QUEUE_HEAD(WaitQueue_Write);

/******************************************************************************
    Static function prototypes
******************************************************************************/
static s32  _v4l2_queryctrl (struct file *, void *, struct v4l2_queryctrl *);
static s32  _v4l2_querycap (struct file *, void *, struct v4l2_capability *);
static s32  _v4l2_enum_input (struct file *, void *, struct v4l2_input *);
static s32  _v4l2_cropcap (struct file *, void *, struct v4l2_cropcap *);
static s32  _v4l2_g_crop (struct file *, void *, struct v4l2_crop *);
static s32  _v4l2_s_crop (struct file *, void *, struct v4l2_crop *);
static s32  _v4l2_g_input (struct file *, void *, u32 *);
static s32  _v4l2_s_input (struct file *, void *, u32);
static s32  _v4l2_s_ctrl (struct file *, void *, struct v4l2_control *);
static s32  _v4l2_g_ctrl (struct file *, void *, struct v4l2_control *);
static s32  _v4l2_s_ext_ctrls (struct file *, void *, struct v4l2_ext_controls *);
static s32  _v4l2_g_fbuf (struct file *, void *, struct v4l2_framebuffer *);
static s32  _v4l2_s_fbuf (struct file *, void *, struct v4l2_framebuffer *);
static s32  _v4l2_enum_fmt_vid_cap (struct file *, void *, struct v4l2_fmtdesc *);
static s32  _v4l2_try_fmt_vid_cap (struct file *, void *, struct v4l2_format *);
static s32  _v4l2_g_fmt_vid_cap (struct file *, void *, struct v4l2_format *);
static s32  _v4l2_s_fmt_vid_cap (struct file *, void *, struct v4l2_format *);
static s32  _v4l2_reqbufs (struct file *, void *, struct v4l2_requestbuffers *);
static s32  _v4l2_querybuf (struct file *, void *, struct v4l2_buffer *);
static s32  _v4l2_qbuf (struct file *, void *, struct v4l2_buffer *);
static s32  _v4l2_dqbuf (struct file *, void *, struct v4l2_buffer *);
static s32  _v4l2_streamon (struct file *, void *, enum v4l2_buf_type);
static s32  _v4l2_streamoff (struct file *, void *, enum v4l2_buf_type);
static long _v4l2_default (struct file *, void *, bool, s32, void *);

/******************************************************************************
    Function definitions
******************************************************************************/
static s32
_v4l2_queryctrl(struct file *pFile, void *pFh,
                struct v4l2_queryctrl *pQeryCtrl)
{
    return 0;
}

static s32
_v4l2_querycap(struct file *pFile, void *pFh,
               struct v4l2_capability *pCap)
{
    return 0;
}

static s32
_v4l2_enum_input(struct file *pFile, void *pFh,
                 struct v4l2_input *pInput)
{
    return 0;
}

static s32
_v4l2_cropcap(struct file *pFile, void *pFh,
              struct v4l2_cropcap *pCropCap)
{
    return 0;
}

static s32
_v4l2_g_crop(struct file *pFile, void *pFh,
             struct v4l2_crop *pCrop)
{
    return 0;
}

static s32
_v4l2_s_crop(struct file *pFile, void *pFh,
             struct v4l2_crop *pCrop)
{
    return 0;
}

static s32
_v4l2_g_input(struct file *pFile, void *pFh,
              u32 *pVal)
{
    return 0;
}

static s32
_v4l2_s_input(struct file *pFile, void *pFh,
              u32 i)
{
    return 0;
}

static s32
_v4l2_s_ctrl(struct file *pFile, void *pFh,
             struct v4l2_control *pCtrl)
{
    return 0;
}

static s32
_v4l2_g_ctrl(struct file *pFile, void *pFh,
             struct v4l2_control *pCtrl)
{
    return 0;
}


static s32
_v4l2_s_ext_ctrls(struct file *pFile, void *pFh,
                  struct v4l2_ext_controls *pExtCtrls)
{
    return 0;
}

static s32
_v4l2_g_fbuf(struct file *pFile, void *pFh,
             struct v4l2_framebuffer *pFrameBuf)
{
    return 0;
}

static s32
_v4l2_s_fbuf(struct file *pFile, void *pFh,
             struct v4l2_framebuffer *pFrameBuf)
{
    return 0;
}

static s32
_v4l2_enum_fmt_vid_cap(struct file *pFile, void *pFh,
                       struct v4l2_fmtdesc *pFmtDesc)
{
    return 0;
}

static s32
_v4l2_try_fmt_vid_cap(struct file *pFile, void *pFh,
                      struct v4l2_format *pFmtDesc)
{
    return 0;
}

static s32
_v4l2_g_fmt_vid_cap(struct file *pFile, void *pFh,
                    struct v4l2_format *pFmt)
{
    return 0;
}

static s32
_v4l2_s_fmt_vid_cap(struct file *pFile, void *pFh,
                    struct v4l2_format *pFmt)
{
    return 0;
}


static s32
_v4l2_reqbufs(struct file *pFile, void *pFh,
              struct v4l2_requestbuffers *pReqBufs)
{
    return 0;
}

static s32
_v4l2_querybuf(struct file *pFile, void *pFh,
               struct v4l2_buffer *pBuf)
{
    return 0;
}

static s32
_v4l2_qbuf(struct file *pFile, void *pFh,
           struct v4l2_buffer *pBuf)
{
    return 0;
}

static s32
_v4l2_dqbuf(struct file *pFile, void *pFh,
            struct v4l2_buffer *pBuf)
{
    return 0;
}

static s32
_v4l2_streamon(struct file *pFile, void *pFh,
               enum v4l2_buf_type type)
{
    return 0;
}

static s32
_v4l2_streamoff(struct file *pFile, void *pFh,
                enum v4l2_buf_type type)
{
     return 0;
}

static long
_v4l2_default(struct file *pFile, void *pFh,
              bool validPrio, s32 cmd, void *pArg)
{
    void __user      *pUsrArg = (void __user *)pArg;
    struct _ioc_args *pIoArg  = (struct _ioc_args *)pUsrArg;
    s32              ret      = -1;

    if (_IOC_TYPE(cmd) != _DRV_IOC_TYPE) {
        printk(KERN_ERR "got invalid case, CMD = %d\n", cmd);
        return -EINVAL;
    }

    switch (cmd) {
    case IOC_VIDEO0_DRV_CMD:
        pr_info("alskjdflaskjdfasdf\n");
        // drv_unlocked_ioctl(pFile, cmd, pIoArg);
        break;
    case IOC_VIDEO1_DRV_CMD:
        // drv_unlocked_ioctl(pFile, cmd, pIoArg);
        break;
    default:
        // drv_unlocked_ioctl(pFile, cmd, pIoArg);
        break;
    }

    return 0;
}

s32
drv_unlocked_ioctl(struct file *pFile, int cmd, void *pArg)
{
    void __user      *pUsrArg = (void __user *)pArg;
    struct _ioc_args *pIoArg  = (struct _ioc_args *)pUsrArg;
    char             buf[256] = {'\0', };
    s32              ret      = -1;

    switch (cmd) {
    case DRV_COPY_FROM_USER_CMD:
        if (copy_from_user((void *)buf, (const void __user *)pIoArg->buf, \
                                                            sizeof(buf)) < 0) {
            pr_err("failed to copy buffer from user space to kernel space");
            ret = -EFAULT;
        }
        pr_info("%s(): %s\n", __func__, buf);
        break;
    case DRV_COPY_TO_USER_CMD:
        strcpy(buf, "_DRV_IOC_COPY_TO_USER");
        if (copy_to_user((void __user *)pIoArg->buf, (const void *)buf, \
                                                            sizeof(buf)) < 0) {
            pr_err("failed to copy buffer from kernel space to user space");
            ret = -EFAULT;
        }
        break;
    case DRV_GET_USER_CMD:

        break;
    case DRV_PUT_USER_CMD:

        break;
    default:
        break;
    }

    return 0;
}

static s32
drv_open(struct file *pFile)
{
	static s32 open_cnt = 0;

	pr_info("Attempting to open device: %s:\n", _V4L2DEV_NAME);

	open_cnt++;

	pr_info("Successfully open device: %s:\n\n", _V4L2DEV_NAME);
	pr_info("I have been opened %d times since being loaded\n", open_cnt);
	pr_info("ref = %d\n", (s32)module_refcount(THIS_MODULE));

	return 0;
}

static s32
drv_release(struct file *pFile)
{
	pr_info("Closing %s device\n", _V4L2DEV_NAME);
	return 0;
}

static u32
drv_poll(struct file *pFile, poll_table *pWait)
{
    s32 mask = 0;

    poll_wait(pFile, &WaitQueue_Read , pWait);
    poll_wait(pFile, &WaitQueue_Write, pWait);

    /* if (...) mask |= (POLLIN  | POLLRDNORM); */
    /* if (...) mask |= (POLLOUT | POLLWRNORM); */

    return mask;
}

const struct v4l2_ioctl_ops _v4l2_ioctl_ops = {
    .vidioc_queryctrl        = _v4l2_queryctrl,
    .vidioc_querycap         = _v4l2_querycap,
    .vidioc_enum_input       = _v4l2_enum_input,
    .vidioc_cropcap          = _v4l2_cropcap,
    .vidioc_g_crop           = _v4l2_g_crop,
    .vidioc_s_crop           = _v4l2_s_crop,
    .vidioc_g_input          = _v4l2_g_input,
    .vidioc_s_input          = _v4l2_s_input,
    .vidioc_s_ctrl           = _v4l2_s_ctrl,
    .vidioc_g_ctrl           = _v4l2_g_ctrl,
    .vidioc_s_ext_ctrls      = _v4l2_s_ext_ctrls,
    .vidioc_g_fbuf           = _v4l2_g_fbuf,
    .vidioc_s_fbuf           = _v4l2_s_fbuf,
    .vidioc_enum_fmt_vid_cap = _v4l2_enum_fmt_vid_cap,
    .vidioc_try_fmt_vid_cap  = _v4l2_try_fmt_vid_cap,
    .vidioc_g_fmt_vid_cap    = _v4l2_g_fmt_vid_cap,
    .vidioc_s_fmt_vid_cap    = _v4l2_s_fmt_vid_cap,
    .vidioc_reqbufs          = _v4l2_reqbufs,
    .vidioc_querybuf         = _v4l2_querybuf,
    .vidioc_qbuf             = _v4l2_qbuf,
    .vidioc_dqbuf            = _v4l2_dqbuf,
    .vidioc_streamon         = _v4l2_streamon,
    .vidioc_streamoff        = _v4l2_streamoff,
    .vidioc_default          = _v4l2_default,
};

const struct v4l2_file_operations _v4l2_fops =
{
    .owner 	        = THIS_MODULE,
    .open 	        = drv_open,
    .release 	    = drv_release,
    .unlocked_ioctl = video_ioctl2,
    .mmap 	        = NULL,
    .read 	        = NULL,
    .write 	        = NULL,
    .poll 	        = drv_poll,
};

struct video_device _v4l2_dev = {
    .name      = _V4L2DEV_NAME,
    .fops      = &_v4l2_fops,
    .ioctl_ops = &_v4l2_ioctl_ops,
    .release   = video_device_release,
};

static s32 __devinit
generic_init(void)
{
    s32 ret = 0;

    /* Allocate v4l2 device */
    vid_dev = video_device_alloc();
    if (vid_dev == NULL) {
        pr_err("video_dev was failed to allocate!");
        goto error_video_alloc;
    }

    /* Initialize v4l2 device */
    memcpy(vid_dev, &_v4l2_dev, sizeof(_v4l2_dev));

    video_set_drvdata(vid_dev, NULL);

    /* Registers v4l2 device to v4l2 layer of kernel */
    ret = video_register_device(vid_dev, VFL_TYPE_GRABBER, -1);
    if (ret) {
        pr_err("Failed to register video device");
        goto error_video_reg;
    }

    return 0;

error_video_reg:
    video_device_release(vid_dev);
error_video_alloc:
    return ret;
}

static void __devexit
generic_exit(void)
{
    video_device_release(vid_dev);

    return;
}

module_init(generic_init);
module_exit(generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Platform Module");
MODULE_LICENSE("GPL v2");
