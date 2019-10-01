#include "Estudiante.hpp"
class Universitario: public Estudiante{
      char Carrera[50];
      char Proyecto[80];
      public:
             Universitario();
             Universitario(char *, int *,char *,char *);
             void Imprimir_Datos_Universitario();
      };

Universitario::Universitario(){}
Universitario::Universitario(char escuela, int calificaciones,char carrera,char proyecto){
          strcpy(Carrera,carrera);
          strcpy(Proyecto,proyecto);
         }
Universitario::Imprimir_Datos_Universitario(){
          Promedio=Obtener_Promedio();
          Imprimir_Datos_Estudiante();
          cout<<"-----Carrera------"<<Carrera<<endl;
          cout<<"-----Proyecto------"<<Proyecto<<endl;
         }
