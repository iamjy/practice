#include <stdint.h>

typedef void (* func_t)(void);

void hello(void);
void proxyHello(func_t func);
