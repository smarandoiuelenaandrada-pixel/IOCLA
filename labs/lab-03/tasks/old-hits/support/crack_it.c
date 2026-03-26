#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{   
    time_t t = time(NULL);
    srandom((unsigned)t);
    int r = (int)random();
    r += 1337; //0x539 = 1337
    printf("THE SECRET IS: %d", r);
    return 0;
}