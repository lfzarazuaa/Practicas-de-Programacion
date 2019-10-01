#include "Universitario.hpp"
#include "Empleado.hpp"
class Pasante: public Empleado, public Universitario{
      protected:
      char Nacionalidad[50];
      int Experiencia;
      public:
             Pasante();
             //Empleado(char nombre, char direccion,int edad,char empleo, int salario)
             //Universitario(char escuela, int calificaciones,char carrera,char proyecto)
             Pasante(char *, char *,int ,char *, int ,char *, int *,char *,char *,char *, int);
             void Imprimir_Datos_Pasante();
      };
//: Universitario(escuela,calificaciones,carrera,proyecto)
//: Empleado(nombre,direccion,edad,empleo,salario)
Pasante::Pasante(){}
Pasante::Pasante(char nombre[], char direccion[],int edad,char empleo[], int salario,char escuela[], int calificaciones[],char carrera[],char proyecto[],char nacionalidad[],int experiencia):Empleado(nombre,direccion,edad,empleo,salario),Universitario(escuela,calificaciones,carrera,proyecto){
                       strcpy(Nacionalidad,nacionalidad);
                       Experiencia=experiencia; 
                      }
void Pasante::Imprimir_Datos_Pasante(){
          Imprimir_Datos_Empleado();
          Imprimir_Datos_Universitario();
          cout<<"-----Nacionalidad------"<<Nacionalidad<<endl;
          cout<<"-----Experiencia------"<<Experiencia<<endl;           
        }
Pasante Leer_Datos(){
         int i;
         char Nombre[50];
         char Direccion[80];
         int Edad;
         char Empleo[50];
         int Salario;
         char Escuela[50];
         int Calificaciones[8];
         char Carrera[50];
         char Proyecto[80];
         char Nacionalidad[50];
         int Experiencia;
         cout<<"Ingrese su nombre: ";
         gets(Nombre);
         fflush(stdin);
         cout<<"Ingrese su direccion: ";
         gets(Direccion);
         fflush(stdin);
         cout<<"Ingrese su edad: ";
         cin>>Edad;
         fflush(stdin);
         cout<<"Ingrese su empleo: ";
         gets(Empleo);
         fflush(stdin);
         cout<<"Ingrese su salario: ";
         cin>>Salario;
         fflush(stdin);
         cout<<"Ingrese su escuela: ";
         gets(Escuela);
         fflush(stdin);
         for(i=0;i<8;i++){
             cout<<"Ingrese su calificacion "<<i+1<<" : ";
             cin>>Calificaciones[i];
             fflush(stdin);              
            }
         cout<<"Ingrese su carrera: ";
         gets(Carrera);
         fflush(stdin);
         cout<<"Ingrese su proyecto: ";
         gets(Proyecto);
         fflush(stdin);
         cout<<"Ingrese su nacionalidad: ";
         gets(Nacionalidad);
         fflush(stdin);
         cout<<"Ingrese su experiencia: ";
         cin>>Experiencia;
         fflush(stdin);
         Pasante Paquete(Nombre,Direccion,Edad,Empleo,Salario,Escuela,Calificaciones,Carrera,Proyecto,Nacionalidad,Experiencia);
         return Paquete;
        }
