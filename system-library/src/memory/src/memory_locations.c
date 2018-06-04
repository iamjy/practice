#include <stdio.h>
#include <stdint.h>

struct ml_st {
    struct {
        int32_t filed1 : 8;
        int32_t reserved : 23;
    } as32bits_1;
    struct {
        int32_t filed1 : 8;
        int32_t reserved : 23;
    } as32bits_2;
}; /* 8 byte */

int32_t main(int32_t argc, char *argv[])
{
    struct ml_st ml;

    printf("size of struct ml_st : %d\n", sizeof(ml));

    return 0;
}

