/* **************** LDD_BASE:1.0 ldd_platform.h **************** */
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
#ifndef __LDD_PLATFORMDEV_H__
#define __LDD_PLATFORMDEV_H__

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/device.h>
#include <linux/platform_device.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/sched.h>        /* request_irq() */
#include <linux/slab.h>
#include <linux/mm.h>           /* vm_area_struct, vm_operations_struct */
#include <linux/poll.h>         /* poll(), select() */
#include <linux/interrupt.h>

#define _DEV_NAME "platform_dev"

typedef struct {
} _data_t;

typedef struct {
    struct platform_device	*pdev;

    struct resource *iores;
    struct resource *iomem;

    void __iomem *base;
    void __iomem *base_mem;

    __u32 pmem_base;
    __u32 pmem_size;

    __s32 irq;

    spinlock_t lock;
    struct mutex mutex;
} _handle_t;

extern const struct vm_operations_struct _vm_ops;
extern const struct file_operations      _fops;
extern struct platform_driver            _driver;
_data_t                                  data;
_handle_t                                *_handle;

DECLARE_WAIT_QUEUE_HEAD(WaitQueue_Read);
DECLARE_WAIT_QUEUE_HEAD(WaitQueue_Write);

static inline __s32
_open(struct inode *inode, struct file *file)
{
	static __s32 open_cnt = 0;

	pr_info("Attempting to open device: %s:\n", _DEV_NAME);
	pr_info("MAJOR = %d, MINOR = %d\n", imajor(inode), iminor(inode));

	open_cnt++;

	pr_info("Successfully open device: %s:\n\n", _DEV_NAME);
	pr_info("I have been opened %d times since being loaded\n", open_cnt);
	pr_info("ref=%d\n", (__s32)module_refcount(THIS_MODULE));

	return 0;
}

static inline __s32
_release(struct inode *inode, struct file *file)
{
	pr_info("Closing %s device\n", _DEV_NAME);

    free_irq(0/* IRQ Number */, NULL/* Argument */);
	return 0;
}

static inline ssize_t
_read(struct file *file, char __user * buf,
    size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes = 0;
    return nbytes;
}

static inline ssize_t
_write(struct file *file, const char __user * buf,
    size_t lbuf, loff_t * ppos)
{
    ssize_t nbytes = 0;
    return nbytes;
}

static inline loff_t
_lseek(struct file *file, loff_t offset, __s32 orig)
{
    loff_t pos = 0;
    return pos;
}

static inline __u32
_poll(struct file *file, poll_table *wait)
{
    s32 mask = 0;

    poll_wait(file, &WaitQueue_Read , wait);
    poll_wait(file, &WaitQueue_Write, wait);

    /* if (...) mask |= (POLLIN  | POLLRDNORM); */
    /* if (...) mask |= (POLLOUT | POLLWRNORM); */

    return mask;
}

static inline void
_vm_open(struct vm_area_struct *vma)
{
	/* = (TYPE)vma->vm_private_data; */
    return;
}

static inline void
_vm_close(struct vm_area_struct *vma)
{
	/* = (TYPE)vma->vm_private_data; */
    return;
}

static __s32
_mmap (struct file *file, struct vm_area_struct *vma)
{
    __u64 vm_start  = vma->vm_start;
	__u64 vm_size   = vma->vm_end - vma->vm_start;
	__u64 vm_pgoff  = vma->vm_pgoff << PAGE_SHIFT; /* Physical Address */
    __u64 vm_pgprot = vma->vm_page_prot;
	__u64 vm_pfn    = __phys_to_pfn(vm_pgoff);     /* Same as vma->vm_pgoff */

    switch (vm_pgoff) {
	case 0:
        if (vm_size == _size_1) {
            vm_pfn  = __phys_to_pfn(_phy_base_addr_1);
            vm_size = _size1;
        } else if (size == _size_2) {
            vm_pfn  = __phys_to_pfn(_phy_base_addr_2);
            vm_size = _size2;
        }

        vm_flags  |= VM_RESERVED | VM_IO;
        vm_pgprot = pgprot_noncached(vma->vm_page_prot);
        break;

    case PHY_BASE_ADDR_1:
    case PHY_BASE_ADDR_2:
        vma->vm_flags |= VM_RESERVED | VM_IO;
        vm_pgprot = pgprot_noncached(vm_pgprot);
        break;

    default:
        pr_info("Invalid physical address you requested");
	    return -EINVAL;
    }

    vma->vm_ops          = &_vm_ops;
    vma->vm_private_data = NULL;
    if (remap_pfn_range(vma, vm_start, vm_pfn, vm_size, vm_pgprot)) {
        pr_info("Failed to remap kernel memory to user space \n");
        return -EIVAL;
    }

    return ret;
}


static inline __s32
_probe(struct platform_device *pdev)
{
    struct resource *res_;
    struct resource *mem_;
    __u32           size;
    __s32           ret;

    _handle = kzalloc(sizeof(_handle), GFP_KERNEL);
    if (_handle == NULL) {
        ret = -ENOMEM;
        goto err_alloc;
    }

    platform_set_drvdata(pdev, NULL /* Set Handle */);

    res_ = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (res_ == NULL) {
        dev_err(&pdev->dev, "Failed to get memory region resource\n");
		ret = -ENXIO;
		goto err_io;
	}

    size = (res_->end - res_->start) + 1;
    _handle->iores = request_mem_region(res_->start, size, pdev->name);
    if (_handle->iores == NULL) {
        dev_err(&pdev->dev, "Failed to get memory region resource\n");
        ret = -ENOMEM;
        goto err_io;
    }

    size = (res_->end - res_->start) + 1;
    _handle->base = ioremap(res_->start, size); /* or ioremap_nocache() */
    if (_handle->base == NULL) {
        ret = -ENOMEM;
        goto err_iomap;
    }

    res_ = platform_get_resource(pdev, IORESOURCE_MEM, 1);
	if (res_ == NULL) {
        dev_err(&pdev->dev, "Failed to get memory region resource\n");
		ret = -ENXIO;
		goto err_io;
	}

    size = (res_->end - res_->start) + 1;
    _handle->iomem = request_mem_region(res_->start, size, pdev->name);
    if (_handle->iomem == NULL) {
        dev_err(&pdev->dev, "Failed to get memory region resource\n");
        ret = -ENOMEM;
        goto err_io;
    }

    size = (res_->end - res_->start) + 1;
    _handle->base_mem = ioremap(res_->start, size); /* or ioremap_nocache() */
    if (_handle->base == NULL) {
        ret = -ENOMEM;
        goto err_iomap;
    }

    platform_get_irq(pdev, 0);
    ret = request_irq(0/* IRQ Number */, NULL/* ISR */, 0/* Attribute */, NULL/* Device Name */, NULL/* Argument */);
    if (ret)
        goto err_irq;


err_alloc:
    kfree(_handle);
err_io:
    platform_set_drvdata(pdev, NULL/* Set NULL */);
    kfree(_handle);
err_iomap:
    release_mem_region(_handle->iores->start,
		_handle->iores->end - _handle->iores->start + 1);
err_irq:
    if (_handle->base)
		iounmap(_handle->base);
    if (_handle->base_mem)
        iounmap(_handle->base_mem);
    free_irq(_handle->irq, NULL/* device_id */);

    return ret;
}

static inline __s32
_remove(struct platform_device *pdev)
{
    return 0;
}

static inline void
_shutdown(struct platform_device *pdev)
{
    return;
}

static inline __s32
_suspend(struct platform_device *pdev, pm_message_t state)
{
    return 0;
}

static inline __s32
_resume(struct platform_device *pdev)
{
    return 0;
}

static __s32 __devinit generic_init(void)
{
    if (platform_driver_register(&_driver)) {
        pr_info("Failed to register %s device\n", _DEV_NAME);
        return -ENODEV;
    }

    pr_info("Succeeded in registering %s device\n", _DEV_NAME);
    return 0;
}

static void __devexit generic_exit(void)
{
    platform_driver_unregister(&_driver);
    pr_info("%s device unregistered\n", _DEV_NAME);
    return;
}

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("Linux Platform Device Driver Header File");
MODULE_LICENSE("GPL v2");

#endif
