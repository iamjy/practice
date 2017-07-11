#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>

#define BUFF_SIZE 256

void operationError(char *fmt, ...)
{
  char buff[BUFF_SIZE] = {'\0'};
  va_list ap;

  strcpy(buff, "ERROR: ");
  va_start(ap, fmt);
  vsprintf(buff + strlen(buff), fmt, ap);
  va_end(ap);

  if (puts(buff) == EOF) {
    printf("Failed to write data to stdout!");
  }

  exit(1);
}

int main(int argc, char *argv[])
{
  FILE *fp1;
  FILE *fp2;
  char *pch1 = NULL, *pch2 = NULL;
  char buff[BUFF_SIZE] = {'\0'};
  size_t ret, sz, cnt;


  if (argc < 3 || argc > 3 ||
     !strcmp(argv[1], "/?") || !strcmp(argv[1], "-?")) {
       operationError("Copy 프로그램\n\n"
                      "시동방법 : Copy 입력 파일명 출력 파일명"
                      "[> 옵션의 파일명]\n");
  }

  pch1 = argv[1];
  pch2 = argv[2];

  if ((fp1 = fopen(pch1, "rb")) == NULL)
    operationError("Failed to open file %s\n", pch1);

  if ((fp2 = fopen(pch2, "wb")) == NULL)
    operationError("Failed to open file %s\n", pch2);

  sz = sizeof(char);
  cnt = sizeof(buff) / sizeof(char);

  while (!feof(fp1)) {
    printf("%ld\n", ret = fread(buff, sz, cnt, fp1));

    if ((fwrite(buff, sz, ret, fp2)) != ret)
      operationError("Failed to write data!");

    if (ret < (sizeof(buff) / sizeof(char)))
      break;
  }

  fclose(fp1);

  if (freopen(pch2, "r", fp2) == NULL)
    operationError("Failed to reopen file %s\n", pch2);

  while (!feof(fp2)) {
    ret = fread(buff, sz, cnt, fp2);

    if ((fwrite(buff, sz, ret, stdout)) != ret)
      operationError("Failed to write string data to stdout!\n");

    if ((puts(buff)) == EOF)
      operationError("Failed to write string data to stdout!\n");

    if (ret < cnt)
      break;
  }

  fclose(fp2);

  return 0;
}
