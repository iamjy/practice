#include <stdio.h>
#include <string.h>

int main( void)
{
   char   *str = "forum.falinux.com";

   printf( "%ld\n", strspn( str, "uovrwxf"));
  
   return 0;
}
