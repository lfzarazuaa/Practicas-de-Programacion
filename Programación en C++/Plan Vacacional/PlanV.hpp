#include <iostream>
#include <string.h>
#include "Hotel.hpp"
#include "Boleto.hpp"
using namespace std;
class planV : public Boleto, public Hotel{
      char Descripcion[80];
      public:
             planV();
             planV(int , float , char *, char *, char *,int ,int , float , char *, char *);
             void ImprimirDatos();
      };

planV::planV(){}//Constructor void.
//Boleto(int f ,float i ,char fol[], char co[], char ci[]) Hotel(int h ,int d , float p , char th[])
planV::planV(int f ,float i ,char fol[], char co[], char ci[],int h ,int d , float p , char th[],char Desc[]){
              fecha=f;
              importe=i;
              strcpy(folio,fol);
              strcpy(ciudadorigen,co);
              strcpy(ciudaddestino,ci);
              habitacion = h;
              duracion =d;
              precio =p;
              strcpy(tipoh,th);
              strcpy(Descripcion,Desc);             
             }//Constructor completo.
             
void planV::ImprimirDatos(){//Método Imprimir Datos.
     Imprimir_Hotel();
     Imprimir_Boleto();
     cout << endl;
     cout << "----------Plan Vacacional--------"<<endl;
     cout << "Descripcion del plan VACACIONAL"<<endl;
     cout << "__________"<<Descripcion<<"__________"<<endl;
     cout << "..........................Fin............................" <<endl;
     }

planV leeDatos(){//Función que regresa un dato tipo Plan V.
      char CO[15], CD[15], Fol[15], Descrip[80], TipoHabitacion[10];
      float precio, importes;
      int dura, numeroh, fe;
      cout << "Ciudad Origen: ";
      gets(CO);
      fflush(stdin);
      cout << "Ciudad Destino: ";
      gets(CD);
      fflush(stdin);
      cout << "Precio del Boleto de Viaje: ";
      cin >> precio;
      fflush(stdin);
      cout << "Boleto numero: ";
      gets(Fol);
      fflush(stdin);
      cout << "Tipo de Habitacion: ";
      gets(TipoHabitacion);
      fflush(stdin);
      cout << "Duracion de la estancia en el Hotel: ";
      cin >> dura;
      fflush(stdin);
      if(TipoHabitacion=="S")
        importes=1200 * dura;
      else
        importes=2000 * dura;
      fflush(stdin);
      cout << "Fecha de ingreso al Hotel (ddmmyyyy): ";
      cin >> fe;
      fflush(stdin);
      cout << "Numero de habitacion: ";
      cin >> numeroh;
      fflush(stdin);
      cout << "Descripcion del plan vacacional: ";
      gets(Descrip);
      fflush(stdin);
      //Boleto(int f ,float i ,char fol[], char co[], char ci[]) Hotel(int h ,int d , float p , char th[])
      planV Paquete(fe ,importes,Fol, CO, CD,numeroh ,dura , precio , TipoHabitacion, Descrip);
      return Paquete;
}
