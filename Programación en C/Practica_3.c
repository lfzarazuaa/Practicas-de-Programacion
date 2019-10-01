#include <stdio.h>

void main()
{
 int x,y;
 printf("Ingrese la variable x(entero): ");
 scanf("%d", &x);
 printf("\nIngrese la variable y(entero): ");
 scanf("%d", &y);
 printf("\nLa suma de x + y = %d: ", x+y);//Uso del operador suma "+".
 printf("\nLa resta de x - y = %d: ", x-y);//Uso del operador resta "-".
 printf("\nLa multiplicacion de x * y = %d: ", x*y);//Uso del operador multiplicación "*".
 printf("\nLa division de x / y = %d: ", x/y);//Uso del operador división "/".
 printf("\nEl modulo de x / y = %d: ", x%y);//Uso del operador modulo(residuo) "%".
 
 if(x>y)//Uso del operador mayor que ">".
 {
  printf("\n x es mayor que y"); 
 }
 else if(x==y)//Uso del operador igual que "==".
 {
  printf("\n x es igual que y");      
 }
 else if(x<y)//Uso del operador menor que "<". 
 {
  printf("\n x es menor que y");      
 }
 if((x>=15)||(y>=15))//Uso del operador mayor o igual que ">=" y del operador or(o) "||". 
 {
  printf("\nAl menos un numero es mayor o igual a 15.");    
 }
 if(((x>=-1)&&(y<=1))||((y>=-1)&&(x<=1)))//Uso del operador menor o igual que ">=" y del operador and(y) "&&". 
 {
  printf("\nUn numero es positivo y el otro es negativo. ");                                           
 }
 getchar();
 getchar();    
}
