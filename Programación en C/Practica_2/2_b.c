#include <stdio.h>//Librer�a para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librer�a para uso del comando getch().
#include <math.h>//Libreria util para c�lculos matem�ticos.
void main()//Funci�n principal
{
 float n,Grados;//Declaraci�n de las variables para calcular el n�mero de Grados y su tipo.
 char a,*l[10];//Declaraci�n de los caracteres para identificar el tipo de grado y mostrarlo en pantalla.
 printf("\nIngrese el Numero y tipo de grado a convertir : ");//Texto para indicar que se ingrese el grado y su tipo.
 scanf("%f %c", &n,&a);//Escaneo del valor de la Temperatura con formato decimal y escaneo del car�cter que
                      // identifica el tipo de grado.
 Grados= a=='f'?(n-32)*5/9 : a=='c'? n*9/5+32: 0;//Condicional que asigna el grado y su respectiva operaci�n para el
                                                 // caso selecionado.
 l[10]= a=='f'? "Celsius" : a=='c'? "Fahrenheit": " ";//Asignaci�n de la palabra del grado resultante por medio de una
                                                     // condicional
 printf("\nLa conversion es de : %.2f grados %s.", Grados,l[10]);// Se muestra en pantalla el grado y su tipo ya convertido.
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
}
