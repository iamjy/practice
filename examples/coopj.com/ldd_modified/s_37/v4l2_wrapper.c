/******************************************************************************
 *   SIC LABORATORY, LG ELECTRONICS INC., SEOUL, KOREA
 *   Copyright(c) 2011 by LG Electronics Inc.
 *
 *   All rights reserved. No part of this work may be reproduced, stored in a
 *   retrieval system, or transmitted by any means without prior written
 *   permission of LG Electronics Inc.
 *****************************************************************************/
/** @file v4l2.c
 *
 *  V4L2 Interface
 *  Provide V4L2 Interface to Camera HAL Layer
 *
 *  @author		Park, Jin-Young(m4jinyoung.park@lge.com)
 *  @author		Park, Jin-Young(m4jinyoung.park@lge.com) - modifier
 *  @version	1.0
 *  @date		2012.00.00
 *  @note		Additional information.
 *  @see		http://www.lge.com
 */
/******************************************************************************
    File Inclusions
******************************************************************************/
#include "v4l2_wrapper.h"
/******************************************************************************
    Extern Variables
******************************************************************************/
/******************************************************************************
    Static Variables
******************************************************************************/
/******************************************************************************
    Function Definitions
******************************************************************************/
int32_t odin_v4l2_device_open(const char *deviceNode)
{
    struct stat st;
    int32_t     fd = 0;

    printf("%s\n", deviceNode);

	if (-1 == stat(deviceNode, &st))
    {
        printf("Please check the %s device driver file.", deviceNode);
        return -1;
    }

	if (0 == S_ISCHR(st.st_mode))
    {
        printf("%s is not a character device driver file.", deviceNode);
        return -1;
    }

	fd = open(deviceNode, (O_RDWR | O_NDELAY));
	if (-1 == fd)
    {
        printf("Could not open %s device driver file.", deviceNode);
        return -1;
    }

	return fd;
}

int32_t odin_v4l2_device_close(int32_t fd)
{
	return close(fd);
}

#if 0
int32_t odin_v4l2_query_cap(int32_t fd)
{
    struct v4l2_capability cap;

    CLEAR(cap);

	if (-1 == xioctl(fd, VIDIOC_QUERYCAP, &cap))
    {
        switch (errno)
        {
            case EINVAL: break; /* The device is not compatible with this specification */
        }
        printf("VIDIOC_QUERYCAP: errno(%d)", errno);
        return -1;
	}

	if (0 == (cap.capabilities & V4L2_CAP_VIDEO_CAPTURE))
    {
		printf("The device doesn't support the video capture interface");
        return -1;
	}

	if (0 == (cap.capabilities & V4L2_CAP_STREAMING))
    {
		printf("The device doesn't support the streaming I/O Method");
        return -1;
	}

	return 0;
}

int32_t odin_v4l2_enum_fmt(int32_t fd, struct v4l2_fmtdesc *pFmts)
{
#ifdef NEVER
    fmts.index = index;
	fmts.type  = type;
#endif /* NEVER */

	while (0 == xioctl(fd, VIDIOC_ENUM_FMT, pFmts)) {
        switch (errno) {
        case EINVAL: break; /* The struct v4l2_fmtdesc type is not supported or the index is out of bounds. */
        }
        printf("Support Format[%d] : [%s]", pFmts->index, pFmts->description);
        pFmts->index++;
	}

    return 0;
}

int32_t odin_v4l2_req_bufs(int32_t fd, struct v4l2_requestbuffers *pReqBuf)
{
#ifdef NEVER
    CLEAR(req);
	req.count   = pBuf->mBufCnt;
	req.type    = pBuf->mV4l2BufType;
	req.memory  = pBuf->mV4l2Memory;
#endif /* NEVER */

	if (-1 == xioctl(fd, VIDIOC_REQBUFS, pReqBuf)) {
		switch (errno) {
        case EINVAL: break; /* The driver supports multiple opens and I/O is already in progress, or reallocation of buffers was attempted although one or more are still mapped */
        case EBUSY:  break; /* The buffer type (type field) or the requested I/O method (memory) is not supported */
        }
        printf("VIDIOC_REQBUFS: errno(%d)", errno);
        return -1;
	}

	return 0;
}

int32_t odin_v4l2_query_buf(int32_t fd, struct v4l2_buffer *pBuf)
{
	if (-1 == xioctl(fd, VIDIOC_QUERYBUF, pBuf)) {
        switch (errno) {
        case EINVAL: break; /* The buffer type is not supported, or the index is out of bounds */
        }
        printf("VIDIOC_QUERYBUF: errno(%d)", errno);
        return -1;
    }

	return 0;
}

int32_t odin_v4l2_set_input(int32_t fd, struct v4l2_input *pInput)
{
#ifdef NEVER
    input.index = index;
#endif /* NEVER */

	if (-1 == xioctl(fd, VIDIOC_ENUMINPUT, pInput)) {
        switch (errno) {
        case EINVAL: break; /* The number of the video input is out of bounds, or there are no video inputs at all and this ioctl is not supported */
        }
		printf("VIDIOC_ENUMINPUT: errno(%d)", errno);
		return -1;
	}
    printf("Name of input channel[%d] is %s\n", pInput->index, pInput->name);

    if (-1 == xioctl(fd, VIDIOC_S_INPUT, &pInput)) {
        switch (errno) {
        case EINVAL: break; /* The number of the video input is out of bounds, or there are no video inputs at all and this ioctl is not supported */
        case EBUSY:  break; /* I/O is in progress, the input cannot be switched */
        }
        printf("VIDIOC_S_INPUT: errno(%d)", errno);
		return -1;
	}

	return 0;
}

int32_t odin_v4l2_get_input(int32_t fd)
{
    struct v4l2_input input;
    int32_t           gIndex;

    CLEAR(input);

    if (-1 == xioctl(fd, VIDIOC_G_INPUT, &input)) {
        switch (errno) {
        case EINVAL: break; /* The number of the video input is out of bounds, or there are no video inputs at all and this ioctl is not supported */
        case EBUSY:  break; /* I/O is in progress, the input cannot be switched */
        }
		printf("VIDIOC_G_INPUT: errno(%d)", errno);
		return -1;
	}

    input.index = gIndex;

	if (-1 == xioctl(fd, VIDIOC_ENUMINPUT, &input)) {
        switch (errno) {
        case EINVAL: break; /* The number of the video input is out of bounds, or there are no video inputs at all and this ioctl is not supported */
        }
		printf("VIDIOC_ENUMINPUT: errno(%d)", errno);
		return -1;
	}
    printf("Current video input channel[%d] is %s\n", input.index, input.name);

	return input.index;
}

int32_t odin_v4l2_set_crop(int32_t fd, struct v4l2_crop *pCrop)
{
    struct v4l2_cropcap cropCap;

    CLEAR(cropCap);
	cropCap.type = pCrop->type;
	if(-1 == xioctl(fd, VIDIOC_CROPCAP, &cropCap)) {
        switch (errno) {
        case EINVAL:    /* The struct v4l2_cropcap type is invalid or the ioctl is not supported. This is not permitted for video capture, output and overlay devices, which must support VIDIOC_CROPCAP */
            /* Ignore if copping is not supported (EINVAL) */
            break;
        }
        printf("VIDIOC_CROPCAP: errno(%d)", errno);
        return -1;
	}

#ifdef NEVER
    CLEAR(crop);
    crop.type     = type;
    crop.c        = cropCap.defrect;    /* Reset to default */
	crop.c.left   = pRes->mSx;
	crop.c.top    = pRes->mSy;
	crop.c.width  = pRes->mWidth;
	crop.c.height = pRes->mHeight;
#endif /* NEVER */

    if (-1 == xioctl(fd, VIDIOC_S_CROP, pCrop) && errno != EINVAL) {
        switch (errno) {
            case EINVAL:    /* Cropping is not supported */
                /* Ignore if copping is not supported (EINVAL) */
                break;
        }
		printf("VIDIOC_S_CROP: errno(%d)", errno);
        return -1;
	}

	return 0;
}

int32_t odin_v4l2_get_crop(int32_t fd, struct v4l2_crop *pCrop)
{
    struct v4l2_cropcap cropCap;
    struct v4l2_crop    *crop = pCrop;

    CLEAR(cropCap);
	cropCap.type = pCrop->type;
	if (-1 == xioctl(fd, VIDIOC_CROPCAP, &cropCap)) {
        switch (errno) {
        case EINVAL:    /* The struct v4l2_cropcap type is invalid or the ioctl is not supported. This is not permitted for video capture, output and overlay devices, which must support VIDIOC_CROPCAP */
            /* Ignore if copping is not supported (EINVAL) */
            break;
        }
        printf("VIDIOC_CROPCAP: errno(%d)", errno);
        return -1;
	}

	crop->type = type;
	if (-1 == xioctl(fd, VIDIOC_G_CROP, pCrop)) {
        switch (errno) {
        case EINVAL:    /* Cropping is not supported */
            /* Ignore if copping is not supported (EINVAL) */
            break;
        }
        printf("VIDIOC_G_CROP: errno(%d)", errno);
        return -1;
	}

    printf("crop->c.top = %d\n", pCrop->c.top);
    printf("crop->c.left = %d\n", pCrop->c.left);
    printf("crop->c.width = %d\n", pCrop->c.width);
    printf("crop->c.height = %d\n", pCrop->c.height);
    printf("crop->c.type = %d\n", pCrop->type);

	return 0;
}

int32_t odin_v4l2_set_fmt(int32_t fd, struct v4l2_format *pFmt)
{
#ifdef NEVER
	CLEAR(fmt);
	fmt.type                = pBuf->mV4l2BufType;
	fmt.fmt.pix.width       = pRes->mWidth;         /* Display Width        */
	fmt.fmt.pix.height      = pRes->mHeight;        /* Display Height       */
	fmt.fmt.pix.pixelformat = pRes->mPixFmt;        /* Display Pixel Format */
	fmt.fmt.pix.field       = V4L2_FIELD_NONE;
	fmt.fmt.pix.priv        = behavior;
#endif /* NEVER */

	if (-1 == xioctl(fd, VIDIOC_S_FMT, pFmt)) {
        switch (errno) {
        case EINVAL: break; /* The struct v4l2_format type field is invalid, the requested buffer type not supported, or VIDIOC_TRY_FMT was called and is not supported with this buffer type */
        case EBUSY:  break; /* The data format cannot be changed at this time, for example because I/O is already in progress */
        }
		printf("VIDIOC_S_FMT: errno(%d)", errno);
		return -1;
	}

	return 0;
}

int32_t odin_v4l2_get_fmt(int32_t fd, struct v4l2_format *pFmt)
{
	if (-1 == xioctl(fd, VIDIOC_G_FMT, pFmt)) {
        switch (errno) {
        case EINVAL: break; /* The struct v4l2_format type field is invalid, the requested buffer type not supported, or VIDIOC_TRY_FMT was called and is not supported with this buffer type */
        case EBUSY:  break; /* The data format cannot be changed at this time, for example because I/O is already in progress */
        }
		printf("VIDIOC_S_FMT: errno(%d)", errno);
		return -1;
	}

	return 0;
}

int32_t odin_v4l2_s_ctrl(int32_t fd, CSSUInt32 id, CSSUInt32 value)
{
    struct v4l2_control ctrl;

	CLEAR(ctrl);
	control.id    = id;
	control.value = value;
	if (-1 == xioctl(fd, VIDIOC_S_CTRL, &ctrl)) {
        switch (errno) {
        case EINVAL: break; /* The struct v4l2_control id is invalid */
        case ERANGE: break; /* The struct v4l2_control value is out of bounds */
        case EBUSY:  break; /* The control is temporarily not changeable, possibly because another applications took over control of the device function this control belongs to */
        }
		printf("VIDIOC_S_CTRL: errno(%d)", errno);
		return -1;
	}

	return 0;
}

int32_t odin_v4l2_g_ctrl(int32_t fd, CSSUInt32 id)
{
    struct v4l2_control ctrl;
    int32_t             ret;

    CLEAR(ctrl);
    ctrl.id = id;
    if (-1 == xioctl(fd, VIDIOC_G_CTRL, &ctrl)) {
        switch (errno) {
        case EINVAL: break; /* The struct v4l2_control id is invalid */
        case ERANGE: break; /* The struct v4l2_control value is out of bounds */
        case EBUSY:  break; /* The control is temporarily not changeable, possibly because another applications took over control of the device function this control belongs to */
        }
        printf("VIDIOC_G_CTRL: errno(%d)", errno);
        return -1;
    }

    return ctrl.value;
}

int32_t odin_v4l2_dqbuf(int32_t fd, struct v4l2_buffer *pBuf)
{
#ifdef NEVER
        buf.type    = pBuf->mV4l2BufType;
        buf.memory  = pBuf->mV4l2Memory;
#endif /* NEVER */

	if (-1 == xioctl(fd, VIDIOC_DQBUF, pBuf)) {
        switch (errno) {
        case EAGAIN: break; /* Non-blocking I/O has been selected using O_NONBLOCK and no buffer was in the outgoing queue */
        case EINVAL: break; /* The buffer type is not supported, or the index is out of bounds, or no buffers have been allocated yet, or the userptr or length are invalid */
        case ENOMEM: break; /* Not enough physical or virtual memory was available to enqueue a user pointer buffer */
        case EIO:    break; /* VIDIOC_DQBUF failed due to an internal error. Can also indicate temporary problems like signal loss. Note the driver might dequeue an (empty) buffer despite returning an error, or even stop capturing */
        }
        printf("VIDIOC_DQBUF: errno(%d)", errno);
        return -1;
    }

	return 0;
}

int32_t odin_v4l2_qbuf(int32_t fd, struct v4l2_buffer *pBuf)
{
	if (-1 == xioctl(fd, VIDIOC_QBUF, pBuf)) {
        switch (errno) {
        case EAGAIN: break; /* Non-blocking I/O has been selected using O_NONBLOCK and no buffer was in the outgoing queue */
        case EINVAL: break; /* The buffer type is not supported, or the index is out of bounds, or no buffers have been allocated yet, or the userptr or length are invalid */
        case ENOMEM: break; /* Not enough physical or virtual memory was available to enqueue a user pointer buffer */
        case EIO:    break; /* VIDIOC_DQBUF failed due to an internal error. Can also indicate temporary problems like signal loss. Note the driver might dequeue an (empty) buffer despite returning an error, or even stop capturing */
        }
        printf("VIDIOC_QBUF: errno(%d)", errno);
        return -1;
    }

	return 0;
}

int32_t odin_v4l2_stream_on(int32_t fd, enum v4l2_buf_type type)
{
	if (-1 == xioctl(fd, VIDIOC_STREAMON, &type)) {
        switch (errno) {
        case EINVAL: break; /* Streaming I/O is not supported, the buffer type is not supported, or no buffers have been allocated (memory mapping) or enqueued (output) yet */
        }
		printf("VIDIOC_STREAMON: errno(%d)", errno);
        return -1;
	}

	return 0;
}

int32_t odin_v4l2_stream_off(int32_t fd, enum v4l2_buf_type type)
{
	if (-1 == xioctl(fd, VIDIOC_STREAMOFF, &type)) {
        switch (errno) {
        case EINVAL: break; /* Streaming I/O is not supported, the buffer type is not supported, or no buffers have been allocated (memory mapping) or enqueued (output) yet */
        }
		printf("VIDIOC_STREAMOFF: errno(%d)", errno);
		return -1;;
	}

	return 0;
}
#endif
