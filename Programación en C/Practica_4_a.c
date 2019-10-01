#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void main()
{
 float  inicial;
 int i;
 char p=36;
 printf("\n Ingrese el primer numero de la tabla en pulgadas: ");
 scanf("%f", &inicial);
 for(i=1;i<=20;i++)
 {
  printf("\n %.0f in = %.2f cm", inicial,inicial*2.54);
  inicial+=5;                   
 }
 getch();
}
