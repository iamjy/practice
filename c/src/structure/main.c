#include <stdio.h>

typedef struct _NODE_st NODE_st;

struct _NODE_st {
  char c;
  int index;
  NODE_st *pNext;
};

typedef struct _TEST_st {
  char c;
  int x;
  int y;

  NODE_st node;

} __attribute__((packed)) TEST_st;

int main(int argc, char const *argv[]) {
  printf("size of TEST_st = %ld\n", sizeof(TEST_st));
  printf("size of NODE_st = %ld\n", sizeof(NODE_st));
  printf("size of int = %ld\n", sizeof(int));

  return 0;
}
