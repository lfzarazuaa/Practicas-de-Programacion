#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void main()
{
 float  cuota=52.84;
 int f=0, c;
 printf("\nCuota fija:   %.2f", cuota);
 if(c<=50)
 {
  total=c*2.288+cuota;
  printf("\nLos primeros %d: %.3f", c, c*2.288);
 }
 else if(c<50 && c>=100)
 {
  total= 114.4+cuota+(c-50)*2.762;
  printf("\nLos primeros 50: 114.40  quedan %d", c-50);
  printf("\n  Del 51 al 100: %.3f", (c-50)*2.762);    
 }
 else if(c>100)
 {
  total= 114.4+cuota+138.1+3.042*(c-100);
  printf("\nLos primeros 50: 114.40  quedan %d", c-50);
  printf("\n  Del 51 al 100: 138.10  quedan %d" c-100);
  printf("\n  Los %d adicionales: %.2f" c-100,3.042*(c-100));
 }
 
