#include <stdio.h>

void main()
{
 short int a=27000, b=5000, d=1800;
 int c;
 c=a+b+d;
 printf("%d +%d +%d= %d ", a,b,d,c);
 char letra=64;
 for(a=1;a<256;a+=1)
 {
 printf("\n %d %c", a,a);
 }
 float precio;
 precio = 32.50;
 printf("\n El precio es $%.2f", precio);
 getchar();    
}
