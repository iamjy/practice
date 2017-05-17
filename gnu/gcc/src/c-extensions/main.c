#include <stdio.h>
#include <unistd.h>
#include <time.h>

int foo()
{
    usleep(1000);
    return 0;
}

int var()
{
    usleep(1100);
    return 0;
}

int main(void)
{
    int (*f)();
    f = &foo;
    f;
    var();
    func0();
    func1();
    return 0;
}
