/* **************** LDD_BASE:1.0 videodev2_kernel.c **************** */
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
#ifndef _VIDEODEV2_KERNEL_H
#define _VIDEODEV2_KERNEL_H

struct _ioc_args {
    int    cmd;
    long   val;
    void   *buf;
    size_t bufSize;
};

#define _DRV_IOC_TYPE   'v'
#define IOC_VIDEO0_DRV_CMD        _IOWR('v', BASE_VIDIOC_PRIVATE + 0, struct _ioc_args)
#define IOC_VIDEO1_DRV_CMD        _IOWR('v', BASE_VIDIOC_PRIVATE + 1, struct _ioc_args)

#define VIDEO0_DRV_CMD            0x100
#define VIDEO1_DRV_CMD            0x200
#define DRV_COPY_FROM_USER_CMD    0x01
#define DRV_COPY_TO_USER_CMD      0x02
#define DRV_GET_USER_CMD          0x03
#define DRV_PUT_USER_CMD          0x04
#define DRV_WR_CMD                0x05

#endif /* _VIDEODEV2_KERNEL_H */
