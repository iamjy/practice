#include <stdio.h>
#include <stdint.h>
#include <errno.h>
#include <fcntl.h>


int32_t main(int32_t argc, char *argv[])
{
    int fd;
    char *string = "Hello";
    char buf[6];

    fd = open("/dev/mycdrv", O_RDWR | O_NDELAY);
    if (fd < 0)
        perror("Failed to open file");

    write(fd, string, sizeof(string));

    close(fd);    
    return 0;
}

