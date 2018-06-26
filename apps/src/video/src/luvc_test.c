/*
 *      test.c  --  USB Video Class test application
 *
 *      Copyright (C) 2015
 *          Laurent Pinchart (laurent.pinchart@skynet.be)
 *
 *      This program is free software; you can redistribute it and/or modify
 *      it under the terms of the GNU General Public License as published by
 *      the Free Software Foundation; either version 2 of the License, or
 *      (at your option) any later version.
 *
 */

/*
 * WARNING: This is just a test application. Don't fill bug reports, flame me,
 * curse me on 7 generations :-).
 */

#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <errno.h>
#include <getopt.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/select.h>
#include <sys/time.h>
#include <jpeglib.h>
#include <linux/fb.h>

#include <linux/videodev2.h>

#define FB_FILE "/dev/fb0"

typedef struct  _fb_v4l
{
        int fbfd ;                                                                     
	char *fbp;
        struct fb_var_screeninfo vinfo;                                                 
        struct fb_fix_screeninfo finfo;                                              
}fb_v41;

#if 0
void rgb_to_framebuffer2(fb_v41 *vd, int width, int height, int xoffset, int yoffset, unsigned char *buffer)
{
        int x, y, location;
        unsigned int *loca_ptr, data;
        unsigned char Red, Green, Blue;

	for(y = 0; y < height; y++){

		location = xoffset * 2 + (y + yoffset) * vd->finfo.line_length;
		loca_ptr = (unsigned int *) (vd->fbp + location);

        	for(x = 0; x < width; x++){
#if 1
					static unsigned int i;
					i = x * 3;
                	Red = buffer[y][i];
	                Green = buffer[y][i + 1];
        	        Blue = buffer[y][i + 2];
                	data = (Red << 16) | (Green << 8) | Blue;
	                *(loca_ptr + x) = data;
#else
                	Red = buffer[y][x * 3] >> 3;
	                Green = buffer[y][x * 3 + 1] >> 2;
        	        Blue = buffer[y][x * 3 + 2] >> 3;
                	data = (Red << 11) + (Green << 5) + Blue;
	                *(loca_ptr + x) = data;
#endif
        	}
	}
}
#endif
void rgb_to_framebuffer(fb_v41 *vd, int width, int height, int xoffset, int yoffset, JSAMPARRAY buffer)
{
        int x, y, location;
        unsigned int *loca_ptr, data;
        unsigned char Red, Green, Blue;

	for(y = 0; y < height; y++){

		location = xoffset * 2 + (y + yoffset) * vd->finfo.line_length;
		loca_ptr = (unsigned int *) (vd->fbp + location);

        	for(x = 0; x < width; x++){
#if 1
					static unsigned int i;
					i = x * 3;
                	Red = buffer[y][i];
	                Green = buffer[y][i + 1];
        	        Blue = buffer[y][i + 2];
                	data = (Red << 16) | (Green << 8) | Blue;
	                *(loca_ptr + x) = data;
#else
                	Red = buffer[y][x * 3] >> 3;
	                Green = buffer[y][x * 3 + 1] >> 2;
        	        Blue = buffer[y][x * 3 + 2] >> 3;
                	data = (Red << 11) + (Green << 5) + Blue;
	                *(loca_ptr + x) = data;
#endif
        	}
	}
}

int open_framebuffer(char *ptr,fb_v41 *vd)
{
	int fbfd,screensize;
	fbfd = open( ptr, O_RDWR);
	if (fbfd < 0) {
		printf("Error: cannot open framebuffer device.%x\n",fbfd);
		return 0;
	}
	printf("The framebuffer device was opened successfully.\n");
		
	vd->fbfd = fbfd;
	
	if (ioctl(fbfd, FBIOGET_FSCREENINFO, &vd->finfo)) {
		printf("Error reading fixed information.\n");
		return 0;
	}

	if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vd->vinfo)) {
		printf("Error reading variable information.\n");
		return 0;
	}

	printf("%dx%d, %dbpp, xoffset=%d ,yoffset=%d \n", vd->vinfo.xres, vd->vinfo.yres, vd->vinfo.bits_per_pixel,vd->vinfo.xoffset,vd->vinfo.yoffset );

	screensize = vd->vinfo.xres * vd->vinfo.yres * vd->vinfo.bits_per_pixel / 8;

	vd->fbp = (char *)mmap(0,screensize,PROT_READ|PROT_WRITE,MAP_SHARED,fbfd,0);
	if ((int)vd->fbp == -1) {
		printf("Error: failed to map framebuffer device to memory.\n");
		return 0;
	}

	printf("The framebuffer device was mapped to memory successfully.\n");
	return  1;
}

static int video_open(const char *devname)
{
	struct v4l2_capability cap;
	int dev, ret;

	dev = open(devname, O_RDWR);
	if (dev < 0) {
		printf("Error opening device %s: %d.\n", devname, errno);
		return dev;
	}

	memset(&cap, 0, sizeof cap);
	ret = ioctl(dev, VIDIOC_QUERYCAP, &cap);
	if (ret < 0) {
		printf("Error opening device %s: unable to query device.\n",
			devname);
		close(dev);
		return ret;
	}

	if ((cap.capabilities & V4L2_CAP_VIDEO_CAPTURE) == 0) {
		printf("Error opening device %s: video capture not supported.\n",
			devname);
		close(dev);
		return -EINVAL;
	}

	printf("Device %s opened: %s.\n", devname, cap.card);
	return dev;
}

static void uvc_set_control(int dev, unsigned int id, int value)
{
	struct v4l2_control ctrl;
	int ret;

	ctrl.id = id;
	ctrl.value = value;

	ret = ioctl(dev, VIDIOC_S_CTRL, &ctrl);
	if (ret < 0) {
		printf("unable to set gain control: %s (%d).\n",
			strerror(errno), errno);
		return;
	}
}

static int video_set_format(int dev, unsigned int w, unsigned int h, unsigned int format)
{
	struct v4l2_format fmt;
	int ret;

	printf("video_set_format: width: %u height: %u\n");

	memset(&fmt, 0, sizeof fmt);
	fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	fmt.fmt.pix.width = w;
	fmt.fmt.pix.height = h;
	fmt.fmt.pix.pixelformat = format;
	fmt.fmt.pix.field = V4L2_FIELD_ANY;

	ret = ioctl(dev, VIDIOC_S_FMT, &fmt);
	if (ret < 0) {
		printf("Unable to set format: %d.\n", errno);
		return ret;
	}

	printf("Video format set: width: %u height: %u buffer size: %u\n",
		fmt.fmt.pix.width, fmt.fmt.pix.height, fmt.fmt.pix.sizeimage);
	return 0;
}

static int video_set_framerate(int dev)
{
	struct v4l2_streamparm parm;
	int ret;

	memset(&parm, 0, sizeof parm);
	parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;

	ret = ioctl(dev, VIDIOC_G_PARM, &parm);
	if (ret < 0) {
		printf("Unable to get frame rate: %d.\n", errno);
		return ret;
	}

	printf("Current frame rate: %u/%u\n",
		parm.parm.capture.timeperframe.numerator,
		parm.parm.capture.timeperframe.denominator);

	parm.parm.capture.timeperframe.numerator = 1;
	parm.parm.capture.timeperframe.denominator = 25;

	ret = ioctl(dev, VIDIOC_S_PARM, &parm);
	if (ret < 0) {
		printf("Unable to set frame rate: %d.\n", errno);
		return ret;
	}

	ret = ioctl(dev, VIDIOC_G_PARM, &parm);
	if (ret < 0) {
		printf("Unable to get frame rate: %d.\n", errno);
		return ret;
	}

	printf("Frame rate set: %u/%u\n",
		parm.parm.capture.timeperframe.numerator,
		parm.parm.capture.timeperframe.denominator);
	return 0;
}

static int video_reqbufs(int dev, int nbufs)
{
	struct v4l2_requestbuffers rb;
	int ret;

	memset(&rb, 0, sizeof rb);
	rb.count = nbufs;
	rb.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	rb.memory = V4L2_MEMORY_MMAP;

	ret = ioctl(dev, VIDIOC_REQBUFS, &rb);
	if (ret < 0) {
		printf("Unable to allocate buffers: %d.\n", errno);
		return ret;
	}

	printf("%u buffers allocated.\n", rb.count);
	return rb.count;
}

static int video_enable(int dev, int enable)
{
	int type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	int ret;

	ret = ioctl(dev, enable ? VIDIOC_STREAMON : VIDIOC_STREAMOFF, &type);
	if (ret < 0) {
		printf("Unable to %s capture: %d.\n",
			enable ? "start" : "stop", errno);
		return ret;
	}

	return 0;
}

static void video_query_menu(int dev, unsigned int id)
{
	struct v4l2_querymenu menu;
	int ret;

	menu.index = 0;
	while (1) {
		menu.id = id;
		ret = ioctl(dev, VIDIOC_QUERYMENU, &menu);
		if (ret < 0)
			break;

		printf("  %u: %.32s\n", menu.index, menu.name);
		menu.index++;
	};
}

static void video_list_controls(int dev)
{
	struct v4l2_queryctrl query;
	struct v4l2_control ctrl;
	char value[12];
	int ret;

#ifndef V4L2_CTRL_FLAG_NEXT_CTRL
	unsigned int i;

	for (i = V4L2_CID_BASE; i <= V4L2_CID_LASTP1; ++i) {
		query.id = i;
#else
	query.id = 0;
	while (1) {
		query.id |= V4L2_CTRL_FLAG_NEXT_CTRL;
#endif
		ret = ioctl(dev, VIDIOC_QUERYCTRL, &query);
		if (ret < 0)
			break;

		if (query.flags & V4L2_CTRL_FLAG_DISABLED)
			continue;

		ctrl.id = query.id;
		ret = ioctl(dev, VIDIOC_G_CTRL, &ctrl);
		if (ret < 0)
			strcpy(value, "n/a");
		else
			sprintf(value, "%d", ctrl.value);

		printf("control 0x%08x %s min %d max %d step %d default %d current %s.\n",
			query.id, query.name, query.minimum, query.maximum,
			query.step, query.default_value, value);

		if (query.type == V4L2_CTRL_TYPE_MENU)
			video_query_menu(dev, query.id);

	}
}

int enum_frame_intervals(int dev, __u32 pixfmt, __u32 width, __u32 height)
{
        int ret;
        struct v4l2_frmivalenum fival;

        memset(&fival, 0, sizeof(fival));
        fival.index = 0;
        fival.pixel_format = pixfmt;
        fival.width = width;
        fival.height = height;
        printf("\tTime interval between frame: ");
        while ((ret = ioctl(dev, VIDIOC_ENUM_FRAMEINTERVALS, &fival)) == 0) {
                if (fival.type == V4L2_FRMIVAL_TYPE_DISCRETE) {
                                printf("%u/%u, ",
                                                fival.discrete.numerator, fival.discrete.denominator);
                } else if (fival.type == V4L2_FRMIVAL_TYPE_CONTINUOUS) {
                                printf("{min { %u/%u } .. max { %u/%u } }, ",
                                                fival.stepwise.min.numerator, fival.stepwise.min.numerator,
                                                fival.stepwise.max.denominator, fival.stepwise.max.denominator);
                                break;
                } else if (fival.type == V4L2_FRMIVAL_TYPE_STEPWISE) {
                                printf("{min { %u/%u } .. max { %u/%u } / "
                                                "stepsize { %u/%u } }, ",
                                                fival.stepwise.min.numerator, fival.stepwise.min.denominator,
                                                fival.stepwise.max.numerator, fival.stepwise.max.denominator,
                                                fival.stepwise.step.numerator, fival.stepwise.step.denominator);
                                break;
                }
                fival.index++;
        }
        printf("\n");
        if (ret != 0 && errno != EINVAL) {
                perror("ERROR enumerating frame intervals");
                return errno;
        }

        return 0;
}

static int enum_frame_sizes(int dev, __u32 pixfmt)
{
        int ret;
        struct v4l2_frmsizeenum fsize;

        memset(&fsize, 0, sizeof(fsize));
        fsize.index = 0;
        fsize.pixel_format = pixfmt;
        while ((ret = ioctl(dev, VIDIOC_ENUM_FRAMESIZES, &fsize)) == 0) {
                if (fsize.type == V4L2_FRMSIZE_TYPE_DISCRETE) {
                        printf("{ discrete: width = %u, height = %u }\n",
                                        fsize.discrete.width, fsize.discrete.height);
                        ret = enum_frame_intervals(dev, pixfmt,
                                        fsize.discrete.width, fsize.discrete.height);
                        if (ret != 0)
                                printf("  Unable to enumerate frame sizes.\n");
                } else if (fsize.type == V4L2_FRMSIZE_TYPE_CONTINUOUS) {
                        printf("{ continuous: min { width = %u, height = %u } .. "
                                        "max { width = %u, height = %u } }\n",
                                        fsize.stepwise.min_width, fsize.stepwise.min_height,
                                        fsize.stepwise.max_width, fsize.stepwise.max_height);
                        printf("  Refusing to enumerate frame intervals.\n");
                        break;
                } else if (fsize.type == V4L2_FRMSIZE_TYPE_STEPWISE) {
                        printf("{ stepwise: min { width = %u, height = %u } .. "
                                        "max { width = %u, height = %u } / "
                                        "stepsize { width = %u, height = %u } }\n",
                                        fsize.stepwise.min_width, fsize.stepwise.min_height,
                                        fsize.stepwise.max_width, fsize.stepwise.max_height,
                                        fsize.stepwise.step_width, fsize.stepwise.step_height);
                        printf("  Refusing to enumerate frame intervals.\n");
                        break;
                }
                fsize.index++;
        }
        if (ret != 0 && errno != EINVAL) {
                perror("ERROR enumerating frame sizes");
                return errno;
        }

        return 0;
}

static void video_list_formats(int dev)
{
        struct v4l2_fmtdesc fmt;
	int ret;

        memset(&fmt, 0, sizeof(fmt));
        fmt.index = 0;
        fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
        while ((ret = ioctl(dev, VIDIOC_ENUM_FMT, &fmt)) == 0) {
                printf("{ pixelformat = '%c%c%c%c', description = '%s' }\n",
                        fmt.pixelformat & 0xFF, (fmt.pixelformat >> 8) & 0xFF,
                        (fmt.pixelformat >> 16) & 0xFF, (fmt.pixelformat >> 24) & 0xFF,
                        fmt.description);
                        ret = enum_frame_sizes(dev, fmt.pixelformat);
                        if(ret != 0)
                                printf("  Unable to enumerate frame sizes.\n");

                fmt.index++;
        }

        if (errno != EINVAL) {
                perror("ERROR enumerating frame formats");
        }
}

static void video_enum_inputs(int dev)
{
	struct v4l2_input input;
	unsigned int i;
	int ret;

	for (i = 0; ; ++i) {
		memset(&input, 0, sizeof input);
		input.index = i;
		ret = ioctl(dev, VIDIOC_ENUMINPUT, &input);
		if (ret < 0)
			break;

		if (i != input.index)
			printf("Warning: driver returned wrong input index "
				"%u.\n", input.index);

		printf("Input %u: %s.\n", i, input.name);
	}
}

static int video_get_input(int dev)
{
	__u32 input;
	int ret;

	ret = ioctl(dev, VIDIOC_G_INPUT, &input);
	if (ret < 0) {
		printf("Unable to get current input: %s.\n", strerror(errno));
		return ret;
	}

	return input;
}

static int video_set_input(int dev, unsigned int input)
{
	__u32 _input = input;
	int ret;

	ret = ioctl(dev, VIDIOC_S_INPUT, &_input);
	if (ret < 0)
		printf("Unable to select input %u: %s.\n", input,
			strerror(errno));

	return ret;
}

#define V4L_BUFFERS_DEFAULT	8
#define V4L_BUFFERS_MAX		32

static void usage(const char *argv0)
{
	printf("Usage: %s [options] device\n", argv0);
	printf("Supported options:\n");
	printf("-c, --capture[nframes] 	Capture frames\n");
	printf("-d, --delay             Delay (in ms) before requeuing buffers\n");
	printf("-f, --format format	Set the video format (mjpg/yuyv)\n");
	printf("-h, --help		Show this help screen\n");
	printf("-i, --input input	Select the video input\n");
	printf("-l, --list-controls	List available controls\n");
	printf("-L, --list-formats	List available formats\n");
	printf("-n, --nbufs n		Set the number of video buffers\n");
	printf("-s, --size WxH		Set the frame size\n");
	printf("-S, --stream		Stream capturing mode\n");
	printf("    --enum-inputs	Enumerate inputs\n");
	printf("    --skip n		Skip the first n frames\n");
}

#define OPT_ENUM_INPUTS		256
#define OPT_SKIP_FRAMES		257

static struct option opts[] = {
	{"capture", 2, 0, 'c'},
	{"delay", 1, 0, 'd'},
	{"enum-inputs", 0, 0, OPT_ENUM_INPUTS},
	{"format", 1, 0, 'f'},
	{"help", 0, 0, 'h'},
	{"input", 1, 0, 'i'},
	{"list-controls", 0, 0, 'l'},
	{"list-formats", 0, 0, 'L'},
	{"stream", 0, 0, 'S'},
	{"size", 1, 0, 's'},
	{"skip", 1, 0, OPT_SKIP_FRAMES},
	{0, 0, 0, 0}
};

//pRGB24의 크기는 nHeight*nWidth*3의 크기여야 한다
#include <stdbool.h>
#define CLIP(t) (((t)>255)?255:(((t)<0)?0:(t)))//값의 범위가  0 <= t <= 255 되도록 한다
bool YUY2_to_RGB24(const unsigned int nWidth, const unsigned int nHeight, const unsigned char *pYUY2, unsigned char *pRGB24, fb_v41 *vd)
{
    if(!pYUY2 || !pRGB24 || nWidth == 0 || nHeight == 0)
        return FALSE;

    unsigned int nYUY2Size = nHeight * (nWidth / 2);//yuy2 크기
    int nLine = 1;
    unsigned int nYUY2Pos = 0;
    unsigned int nRGB24Pos = 0;

    unsigned char y1, u, y2, v;
    unsigned char r, g, b;

    register unsigned int i;

    //이미지의 한 행(row)의 길이가 nWidth*3이 아닌 경우 이 소스는 정상동작 하지 않을 수 있다
    int nStride = ((((nWidth * 24) + 31) & ~31) >> 3);

    for(i = 0 ; i < nYUY2Size ; i++)
    {
        y1 = pYUY2[nYUY2Pos];
        u = pYUY2[nYUY2Pos+ 1];
        y2 = pYUY2[nYUY2Pos+ 2];
        v = pYUY2[nYUY2Pos+ 3];

        b = CLIP((76284 * (y1 - 16) + 132252 * (u - 128) ) >> 16);
        g = CLIP((76284 * (y1 - 16) -  53281 * (v - 128) -  25625 * (u - 128) ) >> 16);
        r = CLIP((76284 * (y1 - 16) + 104595 * (v - 128) ) >> 16);

        pRGB24[nRGB24Pos] = b;
        pRGB24[nRGB24Pos + 1] = g;
        pRGB24[nRGB24Pos + 2] = r;

        nRGB24Pos += 3;

        // floating 연산이 제거된 공식
        b = CLIP((76284 * (y2 - 16) + 132252 * (u - 128) ) >> 16);
        g = CLIP((76284 * (y2 - 16) -  53281 * (v - 128) -  25625 * (u - 128) ) >> 16);
        r = CLIP((76284 * (y2 - 16) + 104595 * (v - 128) ) >> 16);

        pRGB24[nRGB24Pos] = b;
        pRGB24[nRGB24Pos + 1] = g;
        pRGB24[nRGB24Pos + 2] = r;

        // rgb_to_framebuffer2(vd, nWidth, nHeight, 0, 0, pRGB24);
        
		nRGB24Pos += 3;
		nYUY2Pos += 4;
    }

    return TRUE;//성공
}

int main(int argc, char *argv[])
{
	char filename[] = "quickcam-0000.jpg";
	int dev, ret;
	
	/* Options parsings */
	int do_enum_inputs = 0, do_capture = 0, do_stream = 0;
	int do_list_controls = 0, do_list_formats = 0, do_set_input = 0;
	char *endptr;
	int c;

	/* Video buffers */
	void *mem[V4L_BUFFERS_MAX];
	unsigned int pixelformat = V4L2_PIX_FMT_MJPEG;
	unsigned int width = 640;
	unsigned int height = 480;
	unsigned int nbufs = V4L_BUFFERS_DEFAULT;
	unsigned int input = 0;
	unsigned int skip = 0;

	/* Capture loop */
	struct timeval start, end, ts;
	unsigned int delay = 0, nframes = (unsigned int)-1;
	FILE *file;
	double fps;

	struct v4l2_buffer buf;
	unsigned int i;
	/* add by lfc */
	unsigned int count;
        struct jpeg_decompress_struct cinfo;
        struct jpeg_error_mgr jerr;
        JSAMPARRAY buffer;
        int row_stride;
	fb_v41 vd;
	char *rgb = NULL;
	/* end add */

	opterr = 0;
	while ((c = getopt_long(argc, argv, "c::d:f:hi:lLn:s:S", opts, NULL)) != -1) {

		switch (c) {
		case 'c':
			do_capture = 1;
			if (optarg)
                                nframes = atoi(optarg);
			break;
		case 'd':
			delay = atoi(optarg);
			break;
		case 'f':
			if (strcmp(optarg, "mjpg") == 0)
				pixelformat = V4L2_PIX_FMT_MJPEG;
			else if (strcmp(optarg, "yuyv") == 0)
				pixelformat = V4L2_PIX_FMT_YUYV;
			else {
				printf("Unsupported video format '%s'\n", optarg);
				return 1;
			}
			break;
		case 'h':
			usage(argv[0]);
			return 0;
		case 'i':
			do_set_input = 1;
			input = atoi(optarg);
			break;
		case 'l':
			do_list_controls = 1;
			break;
		case 'L':
			do_list_formats = 1;
			break;
		case 'n':
			nbufs = atoi(optarg);
			if (nbufs > V4L_BUFFERS_MAX)
				nbufs = V4L_BUFFERS_MAX;
			break;
		case 's':
			width = strtol(optarg, &endptr, 10);
			if (*endptr != 'x' || endptr == optarg) {
				printf("Invalid size '%s'\n", optarg);
				return 1;
			}
			height = strtol(endptr + 1, &endptr, 10);
			if (*endptr != 0) {
				printf("Invalid size '%s'\n", optarg);
				return 1;
			}
			rgb = malloc((width * height) * 3);
			break;
		case 'S':
			do_stream = 1;
			break;
		case OPT_ENUM_INPUTS:
			do_enum_inputs = 1;
			break;
		case OPT_SKIP_FRAMES:
			skip = atoi(optarg);
			break;
		default:
			printf("Invalid option -%c\n", c);
			printf("Run %s -h for help.\n", argv[0]);
			return 1;
		}
	}

	if (optind >= argc) {
		usage(argv[0]);
		return 1;
	}

	ret = open_framebuffer(FB_FILE, &vd);
	if (ret == 0){
		printf("open framebuffer error!\n");
		return 0;	
	} 

	/* Open the video device. */
	dev = video_open(argv[optind]);
	if (dev < 0)
		return 1;

	if (do_list_controls){
		video_list_controls(dev);
		return 0;
	}	

	if (do_list_formats){
		video_list_formats(dev);
		return 0;
	}

	if (do_enum_inputs)
		video_enum_inputs(dev);

	if (do_set_input)
		video_set_input(dev, input);

	ret = video_get_input(dev);
	printf("Input %d selected\n", ret);

	/* Set the video format. */
	if (video_set_format(dev, width, height, pixelformat) < 0) {
		close(dev);
		return 1;
	}

	/* Set the frame rate. */
	if (video_set_framerate(dev) < 0) {
		close(dev);
		return 1;
	}

	/* Allocate buffers. */
	if ((int)(nbufs = video_reqbufs(dev, nbufs)) < 0) {
		close(dev);
		return 1;
	}

	/* Map the buffers. */
	for (i = 0; i < nbufs; ++i) {
		memset(&buf, 0, sizeof buf);
		buf.index = i;
		buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		buf.memory = V4L2_MEMORY_MMAP;
		ret = ioctl(dev, VIDIOC_QUERYBUF, &buf);
		if (ret < 0) {
			printf("Unable to query buffer %u (%d).\n", i, errno);
			close(dev);
			return 1;
		}
		printf("length: %u offset: %u\n", buf.length, buf.m.offset);

		mem[i] = mmap(0, buf.length, PROT_READ, MAP_SHARED, dev, buf.m.offset);
		if (mem[i] == MAP_FAILED) {
			printf("Unable to map buffer %u (%d)\n", i, errno);
			close(dev);
			return 1;
		}
		printf("Buffer %u mapped at address %p.\n", i, mem[i]);
	}

	/* Queue the buffers. */
	for (i = 0; i < nbufs; ++i) {
		memset(&buf, 0, sizeof buf);
		buf.index = i;
		buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		buf.memory = V4L2_MEMORY_MMAP;
		ret = ioctl(dev, VIDIOC_QBUF, &buf);
		if (ret < 0) {
			printf("Unable to queue buffer (%d).\n", errno);
			close(dev);
			return 1;
		}
	}

	/* Start streaming. */
	video_enable(dev, 1);

    cinfo.err = jpeg_std_error(&jerr);
    jpeg_create_decompress(&cinfo);

	for (i = 0; i < nframes; ++i) {
		/* Dequeue a buffer. */
		memset(&buf, 0, sizeof buf);
		buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		buf.memory = V4L2_MEMORY_MMAP;
		ret = ioctl(dev, VIDIOC_DQBUF, &buf);
		if (ret < 0) {
			printf("Unable to dequeue buffer (%d).\n", errno);
			close(dev);
			return 1;
		}
#if 0
		gettimeofday(&ts, NULL);
		printf("%u %u bytes %ld.%06ld %ld.%06ld\n", i, buf.bytesused, \
			buf.timestamp.tv_sec, buf.timestamp.tv_usec, \
			ts.tv_sec, ts.tv_usec);
#endif
		if (i == 0)
			start = ts;
#if 0
		if (do_capture && !skip) {
			if(pixelformat != V4L2_PIX_FMT_MJPEG) {
				YUY2_to_RGB24(width, height, mem[buf.index], rgb, &vd);
			}
		}
#else
#if 0
		if (do_capture && !skip) {
			if(pixelformat == V4L2_PIX_FMT_MJPEG)
				sprintf(filename, "/tmp/capture.jpg");
			else
				sprintf(filename, "/tmp/capture.raw", i);
			file = fopen(filename, "wb");
			if (file != NULL) {
				fwrite(mem[buf.index], buf.bytesused, 1, file);
				fclose(file);
			}
		}
#endif
		if (do_stream && !skip){
#if 0
        		file = fopen(filename, "rb");
	        	if(file == NULL){
        	        	printf("Open file error!\n");
                		return 0;
	        	}

		        jpeg_stdio_src(&cinfo, file);
#else				
				jpeg_mem_src(&cinfo, mem[buf.index], buf.bytesused);
#endif
		        (void) jpeg_read_header(&cinfo, TRUE);

		        // cinfo.out_color_space = JCS_RGB;
		        // cinfo.dct_method = JDCT_IFAST;

	        	jpeg_start_decompress(&cinfo);			

	        	row_stride = cinfo.output_width * cinfo.output_components;

	        	buffer = (*cinfo.mem->alloc_sarray)
        	        	((j_common_ptr) &cinfo, JPOOL_IMAGE, row_stride, cinfo.output_height);

				int rowsRead = 0;
	        	while (cinfo.output_scanline < cinfo.output_height){
				
	                	rowsRead += jpeg_read_scanlines(&cinfo, &buffer[rowsRead], cinfo.output_height - rowsRead);	
			}

			rgb_to_framebuffer(&vd, cinfo.output_width, cinfo.output_height, 0, 0, buffer);

		    (void) jpeg_finish_decompress(&cinfo);
#if 0
			fclose(file);
#endif
		}
#endif

		if (skip)
		        --skip;

		if (delay > 0)
		        usleep(delay * 1000);

		/* Requeue the buffer. */
		ret = ioctl(dev, VIDIOC_QBUF, &buf);
		if (ret < 0) {
			printf("Unable to requeue buffer (%d).\n", errno);
			close(dev);
			return 1;
		}
#if 0
		fflush(stdout);
#endif
	}

	gettimeofday(&end, NULL);

	jpeg_destroy_decompress(&cinfo);

	/* Stop streaming. */
	video_enable(dev, 0);

	end.tv_sec -= start.tv_sec;
	end.tv_usec -= start.tv_usec;
	if (end.tv_usec < 0) {
		end.tv_sec--;
		end.tv_usec += 1000000;
	}
	fps = (i-1)/(end.tv_usec+1000000.0*end.tv_sec)*1000000.0;

	printf("Captured %u frames in %lu.%06lu seconds (%f fps).\n",
		i-1, end.tv_sec, end.tv_usec, fps);

	close(dev);
	return 0;
}

