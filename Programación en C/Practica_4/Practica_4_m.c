#include <stdio.h>//Librería para uso de distintos comandos(printf, scanf, etc.).
#include <conio.h>//Librería para uso del comando getch().
#include <math.h>//Librería útil para cálculos matemáticos.
void main()//Función principal.
{
 int r=2,rep=0;//Declaración de variables para repetir el programa y seleccionar
               // el programa deseado.
 do{//Ejecuta el menú de opciones para ejecutar el programa.
 system("cls");//Limpia la pantalla.
 printf("\n\t\t\tMenu de Programas");//Muestra en pantalla el menú de opciones 
 printf("\n 1) Tabla de Pulgadas a Centimetros.");// para poder seleccionar el
 printf("\n 2) Piramide de Asteriscos.");//el  programa deseado.
 printf("\n 3) Calculadora de Cambio.");
 printf("\n Seleccione el programa que quiere ejecutar: ");
 do{//Ejecuta el escaneo del numero para elegir el programa.
 if(r!=1 && r!=2 && r!=3)//Condición que marca error si no se selecciona un numero
                         //válido.
 printf("\n Numero Incorrecto, seleccione uno correcto: ");//Muestra en pantalla un
                         //un mensaje de error y pide un número correcto.
 scanf("%d", &r);//Escanea el numero ingresado por el usuario para ejecutar el
                 //programa deseado.
 }while(r>3 || r<1);//Repite el ciclo mientras no se escoja un número correcto.
 system("cls");//Limpia pantalla para correr el programa e programa elegido.
 float inicial, A, cambio, monto, cobro;//Declacaración de variables para el programa
 //de la tabla de Pulgadas a Centímetros.
 char p=36;//Declaración del carácter de pesos.
 int i,n,a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0;//Inicializar los contadores de monedas y
 //billetes en 0 y declarar sus variables.
 switch(r)//Condicional para decidir que ejecutar según el valor de r.
  {
   case 1://Selección del Programa de la Tabla de in a cm.
          
         printf("\n Ingrese el primer numero de la tabla en pulgadas: ");
         //Muestra en pantalla el mensaje para ingresar el 1er número.
         scanf("%f", &inicial);//Escanea el 1er número con el que se inicia la tabla.
         for(i=1;i<=20;i++)//Ciclo que hace que se muestren 20 datos.
         {
          printf("\n %.0f in = %.2f cm", inicial,inicial*2.54);
          //Muestra en pantalla el valor en pulgadas y su equivalente en cm.
          inicial+=5;//Le suma 5 al valor inicial para que la tabla vaya de 5 en 5.
         }
         getch();//Comando para detener la pantalla hasta que se oprima una tecla.
   break;//Finaliza la ejecución del Programa de la tabla.
   case 2://Selección del Programa de la Pirámide de Asteriscos.
          
           printf("\n Ingrese el numero mayor de asteriscos de la piramide: ");
           //Muestra en pantalla el mensaje para ingresar de cuantos asteriscos
           //se quiere el ultimo nivel de la pirámide.
           scanf("%f", &A);//Escanea el número de asteriscos y lo guarda.
           printf("\n");//Imprime un espacio.
           if(A>0)//Verifica que el número de asteriscos sea positivo.
           {
            for(i=1;i<=A;i++)//Hace un ciclo para imprimir el número de renglones
            //de la pirámide.
            {
             for(n=1;n<=i;n++)//Genera un ciclo que imprime solo los asteriscos
             //que se requieren por nivel poniendo una condicón que "n" no supere
             //el número de renglones que se tienen hasta el momento.
             {
              printf("*");//Imprime un asterisco.
             }
             printf("\n");//Imprime un salto de línea.
            }
           }
           else//En caso que sea negativo muestra mensaje de error.
           {
               printf("     Error");//Muestra en pantalla el mensaje de error.
            } 
           getch();//Comando para detener la pantalla hasta que se oprima una tecla.
   break;//Finaliza la ejecución del Programa de la Pirámide de Asteriscos.
   case 3://Selección del Programa de la Calculadora de Cambio.
          i=0;//Inicializa el número de monedas de $1 en 0.
 printf("\n Ingrese el cobro: ");//Muestra en pantalla mensaje para ingresar lo
 // que se tiene que pagar.
 scanf("%f", &cobro);//Escanea el valor de lo que se paga y lo guarda.
 printf("\n Ingrese el Monto Abonado: ");//Muestra en pantalla el mensaje para ingresar lo
 // que se ha abonado.
 scanf("%f", &monto);//Escanea el valor de lo que se ha abonado y lo guarda.
 if( cobro<0 || cobro>monto || monto<0)
 //Si el cobro o el monto son menores a cero o el monto no cubre el cobro entonces muestra
 //error.
 {
  printf("\n     Error");//Muestra en pantalla mensaje de error.
 }
 else//Ejecuta la operación de cambio si los valores ingresados son correctos.
 {
  printf("\n    Su cambio es:");//Muestra en pantalla mensaje del cambio entregado.
  cambio=monto-cobro;//Calcula cuanto es de cambio.
  //Billetes de 500
  while(cambio>=500)//Verifica que sea posible dar uno o mas billetes de $500.
  {
   a+=1;//Incremeneta en uno la cantidad de billetes de $500.
   cambio-=500;//Resta 500 para calcular el saldo actual ya con el cambio de $500.
  }
  if(a!=0)//Imprime el cambio si es que hay para billetes de $500.
  {
   if(a==1)//Condición para determinar si solo se entrega un billete de $500.
   printf("\n 1 Billete de %c 500", p);//Muestra en pantalla la entrega de 1 billete.
   else
   printf("\n %d Billetes de %c 500", a,p);
   //Muestra en pantalla la entrega del número de billetes de $500 calculados.
  }
  //Billetes de 200
  while(cambio>=200)//Verifica que sea posible dar uno o mas billetes de $200.
  {
   b+=1;//Incremeneta en uno la cantidad de billetes de $200.
   cambio-=200;//Resta 200 para calcular el saldo actual ya con el cambio de $200.
   if(b==1 && cambio<200)
   //Condición para determinar si solo se entrega un billete de $200.
   printf("\n 1 Billete de %c 200", p);//Muestra en pantalla la entrega de 1 billete.
   else if(b==2 && cambio<200)//Condición para determinar si se entregan 2 billetes.
   printf("\n 2 Billetes de %c 200", p);
   //Muestra en pantalla si se entregan 2 billetes de $200.
  }
  //Billetes de 100
  while(cambio>=100)//Verifica que sea posible dar un billete de $100.
  {
   cambio-=100;//Resta 100 para calcular el saldo actual ya con el cambio de $100.
   printf("\n 1 Billete de %c 100", p);
   //Muestra en pantalla la entrega de 1 billete de $100.
  }
  //Billetes de 50
  while(cambio>=50)//Verifica que sea posible dar un billete de $50.
  {
   cambio-=50;//Resta 50 para calcular el saldo actual ya con el cambio de $50.
   printf("\n 1 Billete de %c 50", p);
   //Muestra en pantalla la entrega de 1 billete de $50.
  }
  //Billetes de 20
  while(cambio>=20)//Verifica que sea posible dar uno o mas billetes de $20.
  {
   e+=1;//Incremeneta en uno la cantidad de billetes de $20.
   cambio-=20;//Resta 20 para calcular el saldo actual ya con el cambio de $20.
   if(e==1 && cambio<20)
   //Condición para determinar si solo se entrega un billete de $20.
   printf("\n 1 Billete de %c 20", p);//Muestra en pantalla la entrega de 1 billete.
   else if(e==2 && cambio<20)//Condición para determinar si se entregan 2 billetes.
   printf("\n 2 Billetes de %c 20", p);
   //Muestra en pantalla si se entregan 2 billetes de $20.
  }
  //Monedas de 10
  while(cambio>=10)//Verifica que sea posible dar una moneda de $10.
  {
   cambio-=10;//Resta 10 para calcular el saldo actual ya con el cambio de $10.
   printf("\n 1 Moneda de %c 10", p);
   //Muestra en pantalla la entrega de 1 moneda de $10.
  }
  //Monedas de 5
  while(cambio>=5)//Verifica que sea posible dar una moneda de $5.
  {
   cambio-=5;//Resta 5 para calcular el saldo actual ya con el cambio de $5.
   printf("\n 1 Moneda de %c 5", p);
   //Muestra en pantalla la entrega de 1 moneda de $5.
  }
  //Monedas de 2
  while(cambio>=2)//Verifica que sea posible dar uno o mas monedas de $2.
  {
   h+=1;//Incremeneta en uno la cantidad de monedas de $2.
   cambio-=2;//Resta 2 para calcular el saldo actual ya con el cambio de $2.
   if(h==1 && cambio<2)
   //Condición para determinar si solo se entrega un billete de $20.
   printf("\n 1 Moneda de %c 2", p);//Muestra en pantalla la entrega de 1 moneda.
   else if(h==2 && cambio<2)//Condición para determinar si se entregan 2 monedas.
   printf("\n 2 Monedas de %c 2", p);
   //Muestra en pantalla si se entregan 2 monedas de $2.
  }      
  //Monedas de 1
  while(cambio>=1)//Verifica que sea posible dar una moneda de $1.
  {
   cambio-=1;//Resta 1 para calcular el saldo actual ya con el cambio de $1.
   printf("\n 1 Moneda de %c 1", p);
   //Muestra en pantalla la entrega de 1 moneda de $1.
  }
}
 getch();//Comando para detener la pantalla hasta que se oprima una tecla.
   break;//Finaliza la ejecución del Programa de la Calculadora de cambio,  
 }
 system("cls");//
 printf("Ingrese 1 para repetir o cualquier otro numero para salir\n\n");
 //Muestra en pantalla el mensaje para indicar si se quiere repetir el programa.
 scanf("%d", &rep);   
 //Escanea el valor del numero para determinar si se repite.       
 }while(rep==1);//Repite el programa si es 1 el valor ingresado.
}
