#include<stdio.h>
#include<conio.h>
void imprimir(int[]);
void cambiar(int[]);
float promedio(int[]);
void suma(int[],int[],int[]);
void multiplo(int[],int,char[]);
main(){
       
       int a[5]={1,7,2,8,3};
       int b[5]={7,15,6,10,9};
       int resultado[5];
       char valor[5];
       printf("El promedio del primer arreglo es: %.2f", promedio(a));
       printf("\nEl promedio del segundo arreglo es: %.2f", promedio(b));
       suma(a,b,resultado);
       printf("\nLa suma del arreglo: ");
       imprimir(a);
       printf("+ el arreglo: ");
       imprimir(b);
       printf("es el arreglo: ");
       imprimir(resultado);
       multiplo(b,2,valor);
       printf("\nLos multiplos de 2 del arreglo: ");
       imprimir(a);
       printf("son: ");
       int j;
       for(j=0;j<5;j++){
       printf("%c,",valor[j]);                 
       }
       getch();
}
float promedio(int x[]){
      int i;
      float acumulador;
      for(i=0;i<5;i++){
      acumulador+=x[i];
      }
      return acumulador/5;
}

void suma(int s1[],int s2[],int r[]){
      int i;
      for(i=0;i<5;i++){
      r[i]=s1[i]+s2[i];           
     }         
}

void multiplo(int n[],int d,char r[]){
      int i;
      for(i=0;i<5;i++){
      if((n[i]%d)!=0)
      r[i]='N';
      else
      r[i]='S';         
     }         
}

void imprimir(int arreglo[]){
     int i;
     for(i=0;i<5;i++){
      printf("%d, ",arreglo[i]);                 
     }
}

void cambiar(int x[]){
     int i;
     printf("Ingrese nuevos valores para el arreglo.\n");
     for(i=0;i<5;i++){
      if(i<4)
      scanf("%d\n",&x[i]);                 
      else
      scanf("%d",&x[i]);
     }
}
