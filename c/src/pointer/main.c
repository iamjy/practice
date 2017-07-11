#include <stdint.h>
#include <stddef.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../../inc/ptr.h"

#define ROW_MAX 5
#define COL_MAX 10

int **a = NULL;

int vaPrintf(char *fmt, ...)
{
  char buf[256] = {'\0',};
  va_list ap;

  strcpy(buf, "Error: ");
  va_start(ap, fmt);
  vsprintf(buf + strlen(buf), fmt, ap);
  va_end(ap);

    puts(buf);
}

int main(int arTgc, char const *argv[]) {

  return 0;
}
