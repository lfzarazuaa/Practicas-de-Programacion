#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void main()
{
 float  a;
 int i,n;
 char p=36;
 printf("\n Ingrese el numero mayor de asteriscos de la piramide: ");
 scanf("%f", &a);
 printf("\n");
 if(a>0)
 {
  for(i=1;i<=a;i++)
  {
   for(n=1;n<=i;n++)
   {
    printf("*");                   
   }
   printf("\n");
  }
 }
 else
 {
     printf("     Error");
  } 
 getch();
}
