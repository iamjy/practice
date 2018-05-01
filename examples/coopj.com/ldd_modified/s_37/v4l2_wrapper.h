/******************************************************************************
    Header File Guarder
******************************************************************************/
#ifndef _HARDWARE_V4L2_H_
#define _HARDWARE_V4L2_H_
/******************************************************************************
    File Inclusion
******************************************************************************/
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
/******************************************************************************
    Constant Definition
******************************************************************************/
/******************************************************************************
    Macro Definition
******************************************************************************/
/******************************************************************************
    Enum Definition
******************************************************************************/
/******************************************************************************
    Type Definition
******************************************************************************/
/******************************************************************************
    Structure Definition
******************************************************************************/
/******************************************************************************
    Static Variables
******************************************************************************/
/******************************************************************************
    Function Prototypes Declarations
******************************************************************************/
#ifdef __cplusplus
extern "C"
{
#endif

/**
 * [Brief description.]
 * [Describe explanation about the function]
 *
 * @param  [param] [in / out] [Describe explanation of param]
 * @return [Describe return values]
 * @see    [Describe references such as files, variables or functions]
 * @author Park, Jin-Young(m4jinyoung.park@lge.com)
 */
int32_t odin_v4l2_device_open (const char *devNode);
int32_t odin_v4l2_device_close (int32_t fd);

#if 0
int32_t odin_v4l2_query_cap (int32_t fd);

int32_t odin_v4l2_enum_fmt (int32_t fd, struct v4l2_fmtdesc *pFmtDesc);

int32_t odin_v4l2_req_bufs (int32_t fd, struct v4l2_requestbuffers *pReqBuf);
int32_t odin_v4l2_query_buf (int32_t fd, struct v4l2_buffer *pBuf);

int32_t odin_v4l2_set_input (int32_t fd, struct v4l2_input *pInput);
int32_t odin_v4l2_get_input (int32_t fd);

int32_t odin_v4l2_set_crop (int32_t fd, struct v4l2_crop *pCrop);
int32_t odin_v4l2_get_crop (int32_t fd, struct v4l2_crop *pCrop);

int32_t odin_v4l2_set_fmt (int32_t fd, struct v4l2_format *pFmt);
int32_t odin_v4l2_get_fmt (int32_t fd, struct v4l2_format *pFmt);

int32_t odin_v4l2_s_ctrl (int32_t fd, uint32_t id, uint32_t val);
int32_t odin_v4l2_g_ctrl (int32_t fd, uint32_t id);

int32_t odin_v4l2_dqbuf (int32_t fd, struct v4l2_buffer *pBuf);
int32_t odin_v4l2_qbuf (int32_t fd, struct v4l2_buffer *pBuf);

int32_t odin_v4l2_stream_on (int32_t fd, enum v4l2_buf_type type);
int32_t odin_v4l2_stream_off (int32_t fd, enum v4l2_buf_type type);
#endif

#ifdef __cplusplus
}
#endif

/******************************************************************************
    Closing Header File Guarder
******************************************************************************/
#endif	/* _HARDWARE_V4L2_H_ */
