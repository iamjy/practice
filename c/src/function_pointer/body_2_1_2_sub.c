#include <stdio.h>
#include <string.h>
#include "body_2_1_2_sub.h"

void initChair(CHAIR *pChair)
{
  memset(pChair, 0, sizeof(CHAIR));

  pChair->input   = inputChair;
  pChair->output  = outputChair;
}

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
