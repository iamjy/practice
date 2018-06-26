#include "lab_char.h"

static dev_t dev_number;
static struct class *mycdrv_class = NULL;
static struct mycdrv_dev_st *mycdrv_dev = NULL;

static int
mycdrv_generic_open(struct inode *inode, struct file *fp)
{
	int ret = 0;

	return ret;
}

static int
mycdrv_generic_release (struct inode *inode, struct file *fp)
{
	int ret = 0;

	return ret;
}

static ssize_t
mycdrv_generic_read (struct file *fp, char __user *buf, size_t lbuf,
                                                              loff_t *f_pos)
{
	unsigned int i = 0;
	int ret = 0;

	ret = access_ok(VERIFY_READ, (void *)buf, lbuf);
	if (ret < 0) {
		return ret;
	}

	for (i = 0; i < lbuf; i++) {
		put_user(i, (char *)&buf[i]);
	}

	return 1;
}

static ssize_t
mycdrv_generic_write (struct file *fp, const char __user *buf, size_t lbuf,
                                                               loff_t *f_pos)
{
	char *buff = NULL;
	int ret = 0;

	ret = access_ok(VERIFY_WRITE, (void *)buf, lbuf);
	if (ret < 0) {
		return ret;
	}

	buff = kmalloc(lbuf, GFP_KERNEL);
	ret = copy_from_user(buff, buf, lbuf);
	if (ret < 0) {
		if (buff) kfree(buff);
		return ret;
	}

	kfree(buff);

	return ret;
}

static loff_t
mycdrv_generic_llseek(struct file *file, loff_t offset, int orig)
{
	loff_t pos;

	return pos;
}

static const struct file_operations mycdrv_fops = {
	.owner = THIS_MODULE,
	.read = mycdrv_generic_read,
	.write = mycdrv_generic_write,
	.llseek = mycdrv_generic_llseek,
	.open = mycdrv_generic_open,
	.release = mycdrv_generic_release,
};

static int __init
mycdrv_generic_init (void)
{
	ENTER;

	int ret = 0;

#if 1
	/* 디바이스 주 번호에 대해 동적 할당을 요청 */
	ret = alloc_chrdev_region(&dev_number, 0, 1, RDWR_DEV_NAME);
	if (ret < 0) {
		printk(KERN_DEBUG "Can't register device\n");
		return -1;
	}
#else
	/* 2.6 이전에는 동적 디바이스 노드 할당을 지원하지 않았다. */
	ret = register_chrdev(RDWR_DEV_MAJOR, RDWR_DEV_NAME, &mycdrv_fops);
	if (ret < 0)
		return ret;
#endif

	mycdrv_class = class_create(THIS_MODULE, RDWR_DEV_NAME);
	mycdrv_dev = kmalloc(sizeof(struct mycdrv_dev_st), GFP_KERNEL);
	cdev_init(&mycdrv_dev->cdev, &mycdrv_fops);
	mycdrv_dev->cdev.owner = THIS_MODULE;
	cdev_add(&mycdrv_dev->cdev, dev_number, 1);
	device_create(mycdrv_class, NULL, dev_number, NULL, "mycdrv");

	LEAVE;
	return 0;
}

static void __exit
mycdrv_generic_exit(void)
{
	ENTER;

	printk(KERN_INFO "Bye: module unloaded from 0x%p\n", mycdrv_generic_exit);

	/* cdev 제거 */
	cdev_del(&mycdrv_dev->cdev);
	/* 주 번호를 해제 */
	unregister_chrdev(RDWR_DEV_MAJOR, RDWR_DEV_NAME);
	/*  I/O 영역을 해제 */
	device_de

	LEAVE;
}

module_init(mycdrv_generic_init);
module_exit(mycdrv_generic_exit);

MODULE_AUTHOR("Jinyoung Park");
MODULE_DESCRIPTION("CLDD 1.0: lab1_timer.c");
MODULE_LICENSE("GPL v2");
