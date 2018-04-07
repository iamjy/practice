#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define FILEPATH "./"
#define FILENAME "buffering.txt"
#define BUFFER_SIZE 256
#define GETC(x) fgetc(x)

int main(void)
{
    FILE *stream;
    char *buf;
    unsigned int len;
    int ret;

    stream = fopen(FILEPATH, "r");
    if (stream == NULL)
        printf("failed to open file");

    buf = (char *)calloc(sizeof(BUFFER_SIZE + 1), sizeof(char));
    ret = GETC(stream);
    if (ret == EOF) {
        printf("EOF: %d\n", errno);
        clearerr(stream);
        printf("EOF: %d\n", errno);
        feof(stream);
        fclose(stream);
        return errno;
    } else if (ret < 0) {
        printf("ERROR: %d\n", errno);
        ferror(stream);
        fclose(stream);
        return errno;
    }

    printf("%c\n", ret);

    free(buf);
    fclose(stream);

    return 0;
}
