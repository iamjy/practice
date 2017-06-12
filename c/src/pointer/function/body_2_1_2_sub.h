#include <stdint.h>

typedef struct _CHAIR {
  char      model[32];
  uint32_t  price;
  uint8_t   size;

  void (* input)(struct _CHAIR *);
  void (* output)(const struct _CHAIR *);
} CHAIR;

void initChair(CHAIR *pChair);
void inputChair(CHAIR *pChair);
void outputChair(const CHAIR *pChair);
