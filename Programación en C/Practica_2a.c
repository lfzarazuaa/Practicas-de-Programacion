#include <stdio.h>
#include <conio.h>

void main()
{
 int y=161,x=164,hora,min,dia,mes;
 int anio;
 //printf("Ingrese la x: ");
 //scanf("%d", &x);
 //printf("x = %d", x);
 printf("\nIngrese la hora: ");
 scanf("%d:%d", &hora,&min);
 printf("\nLa hora es %d y los minutos %d\ny sus direcciones de memoria son %p y %p", hora,min,hora,min);
 printf("\nIngrese su fecha de nacimiento: ");
 scanf("%d/%d/%d", &dia,&mes,&anio);
 printf("\nEl d%ca es %2d, el mes %2d, y el a%co es %d", y,dia,mes,x,anio);
 getch();
}
