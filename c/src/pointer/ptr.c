#include <stdio.h>
#include <stdlib.h>

#define STACK_SIZE 10
typedef int stack_t;
stack_t stack[STACK_SIZE];
unsigned int top;

void push(int data) {
  if (top >= STACK_SIZE)
    exit(EXIT_FAILURE);

  stack[++top] = data;
}

int pop(void)
{
  if (top == 0)
    exit(EXIT_FAILURE);

  return stack[--top];
}
