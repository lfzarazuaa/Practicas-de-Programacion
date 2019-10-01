#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

void main()
{
 float  cambio, monto, cobro;
 int a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0,i=0;
 char p=36;
 printf("\n Ingrese el cobro: ");
 scanf("%f", &cobro);
 printf("\n Ingrese el Monto Abonado: ");
 scanf("%f", &monto);
 if( cobro<0 || cobro>monto || monto<0)
 {
     printf("\n     Error");    
 }
 else
 {
  printf("\n    Su cambio es:");
  cambio=monto-cobro;
  //Billetes de 500
  while(cambio>=500)
  {
   a+=1;
   cambio-=500;
  }
  if(a!=0)
  {
   if(a==1)
   printf("\n 1 Billete de %c 500", p);
   else
   printf("\n %d Billetes de %c 500", a,p);        
  }
  //Billetes de 200
  while(cambio>=200)
  {
   b+=1;
   cambio-=200;
  }
  if(b!=0)
  {
   if(b==1)
   printf("\n 1 Billete de %c 200", p);
   else
   printf("\n %d Billetes de %c 200", b,p);        
  }
  //Billetes de 100
  while(cambio>=100)
  {
   c+=1;
   cambio-=100;
  }
  if(c!=0)
  {
   if(c==1)
   printf("\n 1 Billete de %c 100", p);
   else
   printf("\n %d Billetes de %c 100", c,p);        
  }
  //Billetes de 50
  while(cambio>=50)
  {
   d+=1;
   cambio-=50;
  }
  if(d!=0)
  {
   if(d==1)
   printf("\n 1 Billete de %c 50", p);
   else
   printf("\n %d Billetes de %c 50", d,p);        
  }
  //Billetes de 20
  while(cambio>=20)
  {
   e+=1;
   cambio-=20;
  }
  if(e!=0)
  {
   if(e==1)
   printf("\n 1 Billete de %c 20", p);
   else
   printf("\n %d Billetes de %c 20", e,p);        
  }
  //Monedas de 10
  while(cambio>=10)
  {
   f+=1;
   cambio-=10;
  }
  if(f!=0)
  {
   if(f==1)
   printf("\n 1 Moneda de %c 10", p);
   else
   printf("\n %d Monedas de %c 10", f,p);        
  }
  //Monedas de 5
  while(cambio>=5)
  {
   g+=1;
   cambio-=5;
  }
  if(g!=0)
  {
   if(g==1)
   printf("\n 1 Moneda de %c 5", p);
   else
   printf("\n %d Monedas de %c 5", g,p);        
  }
  //Monedas de 2
  while(cambio>=2)
  {
   h+=1;
   cambio-=2;
  }
  if(h!=0)
  {
   if(h==1)
   printf("\n 1 Moneda de %c 2", p);
   else
   printf("\n %d Monedas de %c 2", h,p);        
  }
  //Monedas de 1
  while(cambio>=1)
  {
   i+=1;
   cambio-=1;
  }
  if(i!=0)
  {
   if(i==1)
   printf("\n 1 Moneda de %c 1", p);
   else
   printf("\n %d Monedas de %c 1", i,p);        
  }
 }
 getch();
}
