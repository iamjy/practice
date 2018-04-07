/* **************** LDD_BASE:1.0 ldd_base.h **************** */
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

#include "ldd_char.h"

typedef struct {
    /* TODO: */
} ioctl_data_t;

ioctl_data_t data;

#define IOCTL_MAGIC 'A'
#define IOCTL_GET       _IO(IOCTL_MAGIC  , 0)
#define IOCTL_READ      _IOR(IOCTL_MAGIC , 1, ioctl_data_t)
#define IOCTL_WRITE     _IOW(IOCTL_MAGIC , 2, ioctl_data_t)
#define IOCTL_RW        _IOWR(IOCTL_MAGIC, 3, ioctl_data_t)
#define IOCTL_MAXNR                        4

static long
_unlocked_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
{
    void __user *ioargp = (void __user *)arg;
    __u32       direction, size;
    __s32       ret = -1;

    if (_IOC_TYPE(cmd) != IOCTL_MAGIC) {
        pr_info("Got invalid case, CMD(TYPE) = %d\n", cmd);
        return -EINVAL;
    }

    if (_IOC_NR(cmd) >= IOCTL_MAXNR) {
        pr_info("Got invalid case, CMD(NR) = %d\n", cmd);
        return -EINVAL;
    }

    direction = _IOC_DIR(cmd);
	size = _IOC_SIZE(cmd);

    switch (direction) {
	case _IOC_WRITE:
        pr_info("Reading %d bytes from user-space and writing to device\n", size);
        if (access_ok(VERIFY_WRITE, (void *)arg, size)) {
            ret = copy_from_user(&data, ioargp, size);
        }
        break;

    case _IOC_READ:
        pr_info("Reading device and writing %d bytes to user-space\n", size);
        if (access_ok(VERIFY_READ, (void *)arg, size)) {
            ret = copy_to_user(ioargp, &data, size);
        }
        break;

    default:
        break;
    }

    return ret;
}

const struct file_operations fops = {
	.owner          = THIS_MODULE,
        .unlocked_ioctl = _unlocked_ioctl,
	.open           = _open,
	.release        = _release,
};

module_init(generic_init);
module_exit(generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Char Device Driver");
MODULE_LICENSE("GPL v2");

