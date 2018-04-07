#include <linux/module.h>
#include <asm/atomic.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/init.h>

static LIST_HEAD(red_team);
static LIST_HEAD(blue_team);

enum sex {
    MAN   = 0,
    WOMEN = 1,
};

struct member {
    char mName[256];
    enum sex mSex;
    struct list_head mMemberList;
};

static void member_add(const char *pName, unsigned int sex)
{
    struct member *person;

    person = kmalloc(sizeof(struct member), GFP_KERNEL);
    if (person == NULL)
    {
        printk(KERN_INFO "Failed to allocate memory...\n");
    }
    else
    {
        strncpy(person->mName, pName, strlen(pName));
        person->mSex = sex;
           
        list_add(&person->mMemberList, &red_team);
        list_add(&person->mMemberList, &blue_team);
    }
}

static void member_entry(void)
{
    struct member *person;
    struct member *next;

    list_for_each_entry_safe(person, next, &red_team, mMemberList)
    {
        printk(KERN_INFO "read_team: %s(%s)\n", person->mName, (person->mSex) ? "WOMEN" : "MAN");
        list_splice(&person->mMemberList, &red_team);
    }

    list_for_each_entry_safe(person, next, &blue_team, mMemberList)
    {
        printk(KERN_INFO "blue_team: %s(%s)\n", person->mName, (person->mSex) ? "WOMEN" : "MAN");
    }

    list_for_each_entry_safe(person, next, &blue_team, mMemberList)
    {
        printk(KERN_INFO "blue_team: %s(%s)\n", person->mName, (person->mSex) ? "WOMEN" : "MAN");
    }
}

static void member_del(void)
{
    struct member *person;

    while (!list_empty(&red_team))
    {
        person = list_first_entry(&red_team, struct member, mMemberList);
        list_del(&person->mMemberList);
    }
}

static int __devinit dev_init(void)
{
    member_add("Jinyoung Park", MAN);
    member_add("Haeran Yang", WOMEN);
    member_entry();

    printk(KERN_INFO "ldd_list init\n");

    return 0;
}

static void __devexit dev_exit(void)
{
    member_del();

    printk(KERN_INFO "ldd_list exit\n");
    return;
}

module_init(dev_init);
module_exit(dev_exit);

MODULE_LICENSE("GPL v2");
