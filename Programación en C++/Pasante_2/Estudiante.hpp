#include <iostream>
#include <string.h>
using namespace std;
class Estudiante{
      protected:
      char Escuela[50];
      int Calificaciones[8];
      public:
             float Promedio;
             Estudiante();
             Estudiante(char *,int *);
             void Imprimir_Datos_Estudiante();
             float Obtener_Promedio();
      };

Estudiante::Estudiante(){}
Estudiante::Estudiante(char escuela[], int calificaciones[]){
          int i;
          strcpy(Escuela,escuela);
          for (i=0;i<8;i++){
          Calificaciones[i]=calificaciones[i];}
         }
void Estudiante::Imprimir_Datos_Estudiante(){
            cout<<"-----Escuela------"<<Escuela<<endl;
            cout<<"-----Promedio------"<<Promedio<<endl;
            }        
float Estudiante::Obtener_Promedio(){
             int i;
             float Suma;
             for (i=0;i<8;i++){
             Suma+=Calificaciones[i];}
             return Suma/8;
            }
