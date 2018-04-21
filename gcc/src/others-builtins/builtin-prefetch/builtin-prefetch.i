# 1 "builtin-prefetch.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "builtin-prefetch.c"


int main(void)
{
 int i;
 int n = 2;
 int a[2] = {0,}, b[2] = {0,};

 for (i = 0; i < n; i++)
 {
  a[i] = a[i] + b[i];

  __builtin_prefetch (&a[i+1], 1, 1);
  __builtin_prefetch (&b[i+1], 0, 1);
 }

 return 0;
}
