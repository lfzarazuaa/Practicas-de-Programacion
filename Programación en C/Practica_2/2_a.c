#include <stdio.h>//Librer�a para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librer�a para uso del comando getch().
#include <math.h>//Libreria util para c�lculos matem�ticos.
void main()//Funci�n principal
{
 float R, g, r, h, Area, Volumen, pi=3.1416;//Declaraci�n de variables y constantes.
 char c2=253, c3=252;//Declaraci�n de caracteres especiales para su uso en printf.
 printf("\nIngrese el Radio mayor: ");//Texto guia para el Radio mayor.
 scanf("%f", &R);//Escaneo del valor del Radio mayor(# con decimales).
 printf("\nIngrese el radio menor: ");//Texto guia para el radio menor.
 scanf("%f", &r);//Escaneo del valor del radio menor(# con decimales).
 printf("\nIngrese la altura del cono: ");//Texto guia para la altura.
 scanf("%f", &h);//Escaneo del valor del radio menor(# con decimales).
 Area= pi*h*(R*R+r*r+R*r)*1/3;//C�lculo del �rea del cono.
 g=sqrt(h*h+(R-r)*(R-r));//C�lculo de una constante �til con ayuda del comando sqrt().
 Volumen= pi*(g*(R+r)+R*R+r*r);//C�lculo del Volumen del cono.
 printf("\nEl Area es de : %.4f u%c.", Area,c2);//Mostrar en pantalla el �rea del cono con un n�mero con 4 decimales.
 printf("\nEl Volumen es de : %.4f u%c.", Volumen,c3);//Mostrar en pantalla el Volumen del cono con un n�mero con 4 decimales.
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
}//Fin de la funci�n.
