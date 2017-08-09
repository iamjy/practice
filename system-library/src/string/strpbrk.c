#include <stdio.h>
#include <string.h>

int main( void)
{
   char   *str = "fokrum.falinux.com";

   printf( "%s\n", strpbrk( str, "jklmn"));
  
   return 0;
}
