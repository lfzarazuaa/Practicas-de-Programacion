#include "Universitario.hpp"
#include "Empleado.hpp"
class Pasante: public Empleado, public Universitario{
      char Nacionalidad[50];
      int Experiencia;
      public:
             Pasante();
             //Empleado(char nombre, char direccion,int edad,char empleo, int salario)
             //Universitario(char escuela, int calificaciones,char carrera,char proyecto)
             Pasante(char *, char *,int ,char *, int ,char *, int *,char *,char *,char *, int);
             void Imprimir_Datos_Pasante();
      };

Pasante::Pasante(){}
Pasante::Pasante(char nombre, char direccion,int edad,char empleo, int salario,char escuela, int calificaciones,char carrera,char proyecto,char nacionalidad,int experiencia){
                       
                      }

