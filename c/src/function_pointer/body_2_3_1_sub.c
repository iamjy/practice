#include <stdio.h>
#include "body_2_3_1_sub.h"

void hello(void)
{
  printf("%s() is called!\n", __FUNCTION__);
  return;
}

void proxyHello(func_t func)
{
  func();
  return;
}
