#include <stdio.h>
int i,k;
void * malloc();
main()
{

int  *ret;
int count = 0;
  
  if(fork())
  printf("Vater");
  else{
  printf("Sohn");
  exit (1);
  }

  k=0;
  getchar();
  wait();
   getchar();
}