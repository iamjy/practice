#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>

void operationError(char *fmt, ...)
{
  char buff[256] = {'\0'};
  va_list ap;

  strcpy(buff, "ERROR: ");
  va_start(ap, fmt);
  vsprintf(buff + strlen(buff), fmt, ap);
  va_end(ap);

  if (puts(buff) == EOF)
    printf("Failed to write data to stdout!");

  exit(1);
}

int main(int argc, char const *argv[]) {
  FILE *fpSrc;
  FILE *fpDest;
  char *pSrc = "test.c";
  char *pDest = "test.bk";
  char buff[1024] = {'\0',};
  size_t n = 0;
  size_t sz = 0;

  if ((fpSrc = fopen(pSrc, "rb")) == NULL)
    operationError("Failed to open file %s\n", pSrc);

  if ((fpDest = fopen(pDest, "wb")) == NULL)
    operationError("Failed to open file %s\n", pDest);

  sz = sizeof(char);
  while ((n = fread(buff, sz, 1024, fpSrc)) > 0)
  {
    printf("%ld\n", n);
    printf("%ld\n", fwrite(buff, sz, n, fpDest));
  }

  fclose(fpSrc);
  fclose(fpDest);

  return 0;
}
