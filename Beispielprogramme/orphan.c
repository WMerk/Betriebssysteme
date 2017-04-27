#include <stdio.h>
#include <unistd.h>
int i,k;
void * malloc();
main()
{

    int  *ret;
    int count = 0;

    if(fork())
        printf("Vater\n");
    else {
        printf("Sohn\n");
        sleep (100000);
    }
    getchar();


}
