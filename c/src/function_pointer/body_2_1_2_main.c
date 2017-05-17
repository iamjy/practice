#include <stdio.h>
#include "body_2_1_2_sub.h"

int main(int argc, char *argv[])
{
  CHAIR chair;

  initChair(&chair);
  chair.input(&chair);
  chair.output(&chair);

  return 0;
}
