/******************************************************************************
    Header File Guarder
******************************************************************************/
#ifndef _LDD_V4L2DEV_DRIVER_H
#define _LDD_V4L2DEV_DRIVER_H

/******************************************************************************
    Internal header files
******************************************************************************/
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/uaccess.h>
#include <linux/interrupt.h>
#include <linux/slab.h>
#include <linux/mm.h>           /* vm_area_struct, vm_operations_struct */
#include <linux/poll.h>         /* poll(), select() */
#include <linux/kthread.h>
#include <linux/videodev2.h>
#include <media/v4l2-common.h>
#include <media/v4l2-ioctl.h>
#include <media/v4l2-dev.h>
#include "videodev2_kernel.h"

/******************************************************************************
    Constant definitions
******************************************************************************/
/******************************************************************************
    Macro definitions
******************************************************************************/
#define _V4L2DEV_NAME 	"-v4l2"

/******************************************************************************
    Externally defined global variables
******************************************************************************/
/******************************************************************************
    Locally defined global variables
******************************************************************************/
const struct v4l2_fmtdesc capture_fmts[] = {
	{
		.index = 0,
		.type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
		.flags = 0,
		.description = "YUV422 YUYV",
		.pixelformat = V4L2_PIX_FMT_YUYV,
	},
	{
		.index = 1,
		.type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
		.flags = 0,
		.description = "YUV422 YVYU",
		.pixelformat = V4L2_PIX_FMT_YVYU,
	},
	{
		.index = 2,
		.type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
		.flags = 0,
		.description = "YUV422 UYVY",
		.pixelformat = V4L2_PIX_FMT_UYVY,
	},
	{
		.index = 3,
		.type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
		.flags = 0,
		.description = "YUV422 VYUY",
		.pixelformat = V4L2_PIX_FMT_VYUY,
	},
	{
		.index = 4,
		.type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
		.flags = 0,
		.description = "YUV420",
		.pixelformat = V4L2_PIX_FMT_YUV420,
	},
    {
        .index = 5,
        .type  = V4L2_BUF_TYPE_VIDEO_CAPTURE,
        .flags = 0,
        .description = "RGB565",
        .pixelformat = V4L2_PIX_FMT_RGB565,
    },
};

/******************************************************************************
    Externally defined global functions
******************************************************************************/
/******************************************************************************
    Locally defined global functions
******************************************************************************/
extern s32 drv_unlocked_ioctl(struct file *pFile, int cmd, void *pArg);

#endif /* _LDD_V4L2DEV_DRIVER_H */
