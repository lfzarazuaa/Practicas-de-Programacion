#include <iostream>
#include <string.h>
using namespace std;
class Estudiante{
      char Escuela[50];
      int Calificaciones[8];
      float Promedio;
      public:
             Estudiante();
             Estudiante(char *, int *);
             void Imprimir_Datos_Estudiante();
             float Obtener_Promedio();
      };

Estudiante::Estudiante(){}
Estudiante::Estudiante(char escuela, int calificaciones){
          strcpy(Escuela,escuela);
          for (i=0;i<8;i++){
          Calificaciones[i]=calificaciones[i];}
         }
Estudiante::Imprimir_Datos_Estudiante(){
            cout<<"-----Escuela------"<<Escuela<<endl;
            cout<<"-----Promedio------"<<Promedio<<endl;
            }        
Estudiante::Obtener_Promedio(){
             int Suma;
             for (i=0;i<8;i++){
             Suma+=Calificaciones[i];}
             return Suma/8;
            }
