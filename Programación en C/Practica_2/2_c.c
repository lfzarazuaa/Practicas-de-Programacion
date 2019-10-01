#include <stdio.h>//Librería para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librería para uso del comando getch().
#include <math.h>//Libreria util para cálculos matemáticos.
void main()//Función principal
{
 float v,total;//Declaración de las variables para obtener su valor y calcular su pago.
 printf("\nIngrese el valor inicial del automovil : ");//Texto guia para indicar el ingreso del valor
                                                       // inicial del automovil.  
 scanf("%f", &v);//Escaneo del valor del Automovil con formato decimal.
 total= v*1.16>=250000? v*1.03*1.16+434 : v*1.16+434;//Calculo del valor total del pago por medio de una condicional
                 //Si el valor por el IVA supera los 250000 se paga tenencia mas refrendo de lo contrario solo refrendo.
 printf("\nEl total a pagar del automovil es de : %.2f pesos.", total);//Se muestra en pantalla el valor a pagar.
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
}
