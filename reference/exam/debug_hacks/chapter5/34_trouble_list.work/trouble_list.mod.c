#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xc7087dc4, "module_layout" },
	{ 0x9ef7a19b, "kthread_stop" },
	{ 0xc1bcdf22, "wake_up_process" },
	{ 0x49c604d8, "kthread_create_on_node" },
	{ 0xc9c04cb2, "kmem_cache_alloc_trace" },
	{ 0x334cc27d, "kmalloc_caches" },
	{ 0xda3e43d1, "_raw_spin_unlock" },
	{ 0x37a0cba, "kfree" },
	{ 0x27e1a049, "printk" },
	{ 0xc917e655, "debug_smp_processor_id" },
	{ 0x4c6ff041, "add_preempt_count" },
	{ 0xd52bf1ce, "_raw_spin_lock" },
	{ 0xd2965f6f, "kthread_should_stop" },
	{ 0xf9a482f9, "msleep" },
	{ 0xb4390f9a, "mcount" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "383F5A8F29E4F34E209EE7B");
