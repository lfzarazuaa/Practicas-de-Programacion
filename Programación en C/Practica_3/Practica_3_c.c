#include <stdio.h>//Librería para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librería para uso del comando getch().
#include <math.h>//Libreria util para cálculos matemáticos.
void main()//Función principal
{
 float  cuota=52.84, total;//Declaración de las variables para calcular el total y para ingresar la cuota(# con decimales). 
 int f=0, c;//Declaración de las variables (# enteros) para determinar el cobro y el consumo.
 char p=36;//Declaración del caracter de "$".
 printf("\n Ingrese el consumo de Energia(KWH): ");//Mensaje que indica al usuario que ingrese el consumo de energía.
 scanf(" %d", &c);//Guarda el valor del consumo de energía en una variable.
  printf("\n  Cuota fija:         %c %.2f", p,cuota);//Muestra en pantalla lo que se paga de cuota fija.
 if(c<=50)//Condición para ejecutar si el consumo es menor o igual a 50.
 {
  total=c*2.288+cuota;//Operación que calcula el valor total multiplicando el consumo por 2.288 y sumandole la cuota.
  printf("\n  Los primeros %d:    %c %.2f", c,p,c*2.288);//Muestra el valor a pagar por el consumo de energía.
 }
 else if(c>50 && c<=100)//Condición para ejecutar si el consumo esta entre 50 y 100.
 {
  total= 114.4+cuota+(c-50)*2.762;//Operación que calcula el valor total multiplicando el consumo total menos 50 por 2.762
                                  // para sacar el pago por el consumo cuando es mayor a 50 y aparte se le suma la cuota y 
                                  // el consumo por 50.
  printf("\n  Los primeros 50:    %c 114.40  quedan %d", p,c-50);//Muestra en pantalla lo que se paga por 50 KWH y cuantos
                                  // KWH quedan por pagar.
  printf("\n  Del 51 al 100:      %c %.2f", p,(c-50)*2.762);//Muestra en pantalla lo que se paga por el consumo restante.
 }
 else if(c>100)//Condición para ejecutar si el consumo es mayor a 100.
 {
  total= 114.4+cuota+138.1+3.042*(c-100);//Calcula el total sumando el pago por los primeros 100 KWH y sumandole los restantes
                                         // KWH multiplicandolos por 3.042 mas la cuota.
  printf("\n  Los primeros 50:    %c 114.40  quedan %d", p,c-50);//Muestra en pantalla lo que se paga por 50 KWH y cuantos
                                  // KWH quedan por pagar.
  printf("\n  Del 51 al 100:      %c 138.10  quedan %d", p,c-100);//Muestra en pantalla lo que se paga por los siguitentes 
                                   //50 KWH y cuantos KWH quedan por pagar.
  printf("\n  Los %d adicionales: %c %.2f", c-100,p,3.042*(c-100));//Muestra en pantalla lo que se paga por los ultimos 
                                   //KWH que son el consumo total menos 100.
 }
  printf("\n               Total: %c %.2f", p,total);// Despliega el total a pagar.
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
}
