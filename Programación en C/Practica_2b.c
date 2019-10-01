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
 /////Parte 2 Grados////////////
 float n,Grados;
 char a,*l[10];
 printf("\nIngrese el Numero y tipo de grado a convertir : ");
 scanf("%f %c", &n,&a);
 Grados= a=='f'?(n-32)*5/9 : a=='c'? n*9/5+32: 0;
 l[10]= a=='f'? "Celcius" : a=='c'? "Farenheit": " ";
 printf("\nLa conversion es de : %.2f grados %s.", Grados,l[10]);
 //////Parte 3 Automovil/////
 float v,total;
 printf("\nIngrese el valor inicial del automovil : ");
 scanf("%f", &v);
 total= v*1.16>=250000? v*1.03*1.16+434 : v*1.16+434;
 printf("\nEl total a pagar del automovil es de : %.2f pesos.", total);
 getch();
}
