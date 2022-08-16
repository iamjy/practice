typedef unsigned long word;

word *get_stack_ptr(word *stack_ptr)
{
    __asm ("mrsaa1,CPSR;");

    return 0;
}
