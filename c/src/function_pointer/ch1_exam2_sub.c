#include <stdio.h>
#include "sub.h"

int rand(void)
{
  printf("%s() is called!\n", __FUNCTION__);
}

char *strcpy(char *dest, const char *src)
{
  uint32_t i = 0;
  size_t len = 0;

  len = sizeof(src);

  for (i = 0; i < len; i++)
  {
    dest[i] = src[i];
  }

  printf("%s() is called! (%s %s)\n", __FUNCTION__, dest, src);

  return dest;
}

int atexit(void (*func)(void))
{
  printf("%s() is called and call %p()\n", __FUNCTION__, (void *)func);

  func();
}

char *strstr(const char *src, const char *search)
{
  printf("%s() is called! (%s)(%s)\n", __FUNCTION__, src, search);
}

int system(const char *command)
{
  printf("%s() is called! (%s)\n", __FUNCTION__, command);
}

void func(void)
{
  printf("func is called!\n");
}
