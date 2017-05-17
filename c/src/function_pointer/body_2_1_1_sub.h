#include <stdint.h>

typedef struct _CHAIR {
  char      model[32];
  uint32_t  price;
  uint8_t   size;
} CHAIR;

void inputChair(CHAIR *pChair);
void outputChair(const CHAIR *pChair);
