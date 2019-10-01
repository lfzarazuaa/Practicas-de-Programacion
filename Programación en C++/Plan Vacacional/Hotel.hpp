#include<iostream>
#include<string.h>

using namespace std;

class Hotel{
      protected:
      int habitacion;
      int duracion;
      float precio;
      char tipoh[10];
      public:
             Hotel();
             Hotel(int,int,float,char*);
             void Imprimir_Hotel();
      };
      
Hotel::Hotel(){}
Hotel::Hotel(int h ,int d , float p , char th[]){
                       habitacion = h;
                       duracion =d;
                       precio =p;
                       strcpy(tipoh,th);
                       }

void Hotel::Imprimir_Hotel(){
     cout<<".........................Hotel Emperador ....................."<<endl;
     cout<<"....Habitacion....."<<habitacion<<endl;
     cout<<".............Estancia en dias......."<<duracion<<endl;
     cout<<"....Tipo de Habitacion........................"<<tipoh<<endl;
     cout<<".........Costo de la Estancia....................."<<precio<<endl;
     cout<<"......................... ....................."<<endl;
}
