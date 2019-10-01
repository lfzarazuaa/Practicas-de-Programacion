#include <stdio.h>//Librería para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librería para uso del comando getch().
#include <math.h>//Libreria util para cálculos matemáticos.
void main()//Función principal
{
 float n,Grados;//Declaración de las variables para calcular el número de Grados y su tipo.
 char a,*l[10];//Declaración de los caracteres para identificar el tipo de grado y mostrarlo en pantalla.
 printf("\nIngrese el Numero y tipo de grado a convertir : ");//Texto para indicar que se ingrese el grado y su tipo.
 scanf("%f %c", &n,&a);//Escaneo del valor de la Temperatura con formato decimal y escaneo del carácter que
                      // identifica el tipo de grado.
 Grados= a=='f'?(n-32)*5/9 : a=='c'? n*9/5+32: 0;//Condicional que asigna el grado y su respectiva operación para el
                                                 // caso selecionado.
 l[10]= a=='f'? "Celsius" : a=='c'? "Fahrenheit": " ";//Asignación de la palabra del grado resultante por medio de una
                                                     // condicional
 printf("\nLa conversion es de : %.2f grados %s.", Grados,l[10]);// Se muestra en pantalla el grado y su tipo ya convertido.
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
}
