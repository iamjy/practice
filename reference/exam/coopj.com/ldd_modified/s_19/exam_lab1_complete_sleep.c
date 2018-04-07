#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>


int32_t main(int32_t argc, char *argv[])
{
    int fd, i;
    char *string = "Hello";
    char buf[6];

    fd = open("/dev/mycdrv", O_RDWR | O_NDELAY);
    if (fd < 0)
        perror("Failed to open file");

    read(fd, buf, strlen(string));
    //write(fd, string, strlen(string));
    for (i = 0; i < 10; i++) {
         printf("%d\n", i);
         sleep(1);
    }

    close(fd);    
    return 0;
}

