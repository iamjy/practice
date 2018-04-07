# 1 "swap.c"
# 1 "/home/iamjy1005/work/lab/practice/user-library/src/link//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "swap.c"
extern int buf[];

int *bufp0 = &buf[0];
int *bufp1;

void swap(void)
{
 int temp;

 bufp1 = &buf[1];
 temp = *bufp0;
 *bufp0 = *bufp1;
 *bufp1 = temp;
}
