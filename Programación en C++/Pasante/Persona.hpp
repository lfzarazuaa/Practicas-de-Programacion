#include <iostream>
#include <string.h>
using namespace std;
class Persona{
      char Nombre[50];
      char Direccion[80];
      int Edad;
      public:
             Persona();
             Persona(char *, char *,int);
             void Imprimir_Datos_Persona();
      };

Persona::Persona(){}
Persona::Persona(char nombre, char direccion,int edad){
          strcpy(Nombre,nombre);
          strcpy(Direccion,direccion);
          Edad=edad;
         }
Persona::Imprimir_Datos_Persona(){
          cout<<"-----Nombre------"<<Nombre<<endl;
          cout<<"-----Direccion------"<<Direccion<<endl;
          cout<<"-----Edad-----"<<Edad<<endl;
         }
