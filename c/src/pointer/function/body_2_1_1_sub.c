#include <stdio.h>
#include "body_2_1_1_sub.h"

void inputChair(CHAIR *pChair)
{
  printf("[Input]\n");

  printf("Model: ");
  scanf("%s", pChair->model);

  printf("Price: ");
  scanf("%d", &pChair->price);
  fflush(stdin);

  printf("Size: ");
  scanf("%c", &pChair->size);
}

void outputChair(const CHAIR *pChair)
{
  printf("\n[Output]\n");
  printf("Model: %s\n", pChair->model);
  printf("Price: %d\n", pChair->price);
  printf("Size: %d\n", pChair->size);
}
