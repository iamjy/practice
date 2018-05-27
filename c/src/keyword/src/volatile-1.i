# 1 "volatile-1.c"
# 1 "/home/iamjy1005/work/lab/practice/c/src/keyword/src//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "volatile-1.c"
void discard1()
{
 int i;
 int d1 = 1;
 int sum = 0;

 for (i = 0; i < 10; i++)
  sum += d1;
}

void discard2()
{
 int i;
 volatile int d2 = 1;
 int sum = 0;

 for (i = 0; i < 10; i++)
  sum += d2;
}
