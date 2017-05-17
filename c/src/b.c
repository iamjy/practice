#include <stdio.h>

typedef struct {
    int a[5];
    int reserved[59];
    int b[5];
} test_st;

test_st *t = (test_st *)0x100;

int main(void)
{
    printf("%x %x\n", t->a, t->b);

    return 0;
}
