#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <sys/poll.h>
#include <linux/videodev2.h>
#include "v4l2_wrapper.h"
#include "videodev2_user.h"

#define VIDEO_DEVICE_0 "/dev/video0"
#define VIDEO_DEVICE_1 "/dev/video1"

struct v4l2_config {
	struct v4l2_buffer cbuf;
    struct v4l2_queryctrl queryctrl;
    struct v4l2_querymenu querymenu;
    struct v4l2_control control;
    struct v4l2_crop crop;
    struct v4l2_cropcap cropcap;
    struct v4l2_capability cap;
    struct v4l2_format fmt;
    struct v4l2_input input;
};

int32_t xioctl(int32_t fd, int32_t req, void *arg)
{
    int r;
    do r = ioctl(fd, req, arg);
    while (-1 == r && EINTR == errno);
    return r;
}

int32_t main(int32_t argc, char *argv[])
{
    struct _ioc_args devArgs;
    char             buf[256];
    int32_t          devFd;

    devFd = odin_v4l2_device_open(VIDEO_DEVICE_0);

    // devArgs.buf = &buf[0];

    // strncpy(devArgs.buf, "_IOC_VIDEO0_DRV_CMD", strlen(256));
    xioctl(devFd, IOC_VIDEO0_DRV_CMD, &devArgs);
    // xioctl(devFd, IOC_VIDEO1_DRV_CMD, &devArgs);
    // printf("%s(): %s\n", __func__, (char *)devArgs.buf);

    odin_v4l2_device_close(devFd);

    return 0;
}

