#include <stdio.h>
#include <string.h>
#include <fcntl.h>

int main(int argc, char const *argv[]) {
  int i = 0x0A0B0C0D;
  char c[4];
  int fd;

  fd = open("test_bin", O_CREAT | O_WRONLY);

  write(fd, (void *)&i, sizeof(int));
  memcpy(c, (void *)&i, sizeof(int));

  printf("%x %x %x %x\n", &c[0], &c[1], &c[2], &c[3]);
  printf("%x %x %x %x\n", c[0], c[1], c[2], c[3]);

  return 0;
}
