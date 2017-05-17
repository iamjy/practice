#include <stdint.h>
#include <stdio.h>
#include "sub.h"

int main(int argv, char *argc[])
{
    char str_dest[256] = {"1",};
    const char *str_src = "string";
    const char *str1 = "strstr_ptr1";
    const char *str2 = "strstr_ptr2";
    const char *str3 = "system_ptr";

    printf("%c %c %c\n", str_dest[0], str_dest[1], str_dest[2]);

    int (* rand_ptr)(void) = rand;
    char *(* strcpy_ptr)(char *, const char *) = strcpy;
    int (* atexit_ptr)(void (*func)(void)) = atexit;
    char *(* strstr_ptr)(const char *, const char *) = strstr;
    int (* system_ptr)(const char *) = system;

    rand_ptr();
    printf("%s\n", strcpy_ptr(str_dest, str_src));
    atexit_ptr(func);
    strstr_ptr(str1, str2);
    system_ptr(str3);

   return 0;
}
