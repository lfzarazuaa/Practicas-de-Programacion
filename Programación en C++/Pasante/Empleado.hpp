#include "Persona.hpp"
class Empleado: public Persona{
      char Empleo[50];
      int Salario;
      public:
             Empleado();
             Empleado(char *, char *,int ,char *, int );
             void Imprimir_Datos_Empleado();
      };

Empleado::Empleado(){}
Empleado::Empleado(char nombre, char direccion,int edad,char empleo, int salario){
          strcpy(Empleo,empleo);
          strcpy(Salario,salario);
         }
Empleado::Imprimir_Datos_Empleado(){
          Imprimir_Datos_Persona();
          cout<<"-----Empleo------"<<Empleo<<endl;
          cout<<"-----Salario------"<<Salario<<endl;
         }
