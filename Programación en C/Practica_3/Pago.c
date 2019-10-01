#include <stdio.h>
#include <conio.h>
#include <math.h>
void main()
{
 float pago, sueldo, d;//Declaración de las variables que contener numeros ser decimales.
 int horas, r;//Declaración de variables con números enteros.
 char turno, a=160, pesos=36;//Declaracion de variables para leer caracteres.
 printf("\nIngrese el Sueldo mensual y su turno: ");
 scanf("%f %c", &sueldo,&turno);//Se ingresa el sueldo y un carácter que identifique el turno.
 printf("\nIngrese las horas trabajadas: ");
 scanf("%d", &horas);//Se ingresa el número de horas.
 r= turno=='D' || turno=='d' ? 8: turno=='N' || turno=='n' ?7: 0;
 //Se declara r como el numero de horas que se va a dividir segun el turno.
 if (sueldo>0 && (r!=0 && horas>0))//Se calcula y se muestra el sueldo si es positivo y pertenece a alguno de los 2 turnos.
 {
  d=sueldo/30;//Se calcula el sueldo por día para poder usarlo posteriormente.
  pago= horas<=r? d*horas/r : horas==(r+1)? d*(1+1.5/r) : horas>=(r+4)? d*((r+5.5)/r) : d*(1+(1.5+2*(horas-r-1))/r);
  //Si no hay horas extras solo se mulltiplica proporcionalmente al número de horas trabajadas, si trabaja 1 hora extra se
  //le suma 1.5 veces sobre las horas que trabaja, si trabaja de 2 a 3 horas extras se le paga la primera hora como 1.5 veces
  //sobre las horas que trabaja mas 2 veces por cada hora sobre las horas que labora,si el resultado excede las 11 o 10 horas
  //permitidas se le paga solo hasta esas.  
  printf("\nEl pago es de %c%.2f pesos.", pesos,pago);//Despliega cuando ganó ese día el trabajador.
 }
 else//Lo que ocurre si no cumple la condición del if. 
  {
   printf("\nLos datos son inv%clidos", a);//Despliega un mensaje de error indicando que algun dato fue mal ingresado.              
  }
 getch();
}
