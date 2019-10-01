#include <stdio.h>
#include <conio.h>
#include <math.h>
void main()
{
 float R, g, r, h, Area, Volumen, pi=3.1416;
 printf("\nIngrese el Radio mayor: ");
 scanf("%f", &R);
 printf("\nIngrese el radio menor: ");
 scanf("%f", &r);
 printf("\nIngrese la altura del cono: ");
 scanf("%f", &h);
 Area= pi*h*(R*R+r*r+R*r)*1/3;
 g=sqrt(h*h+(R-r)*(R-r));
 Volumen= pi*(g*(R+r)+R*R+r*r);
 printf("\nEl Area es de : %.4f.", Area);
 printf("\nEl Volumen es de : %.4f.", Volumen);
}
