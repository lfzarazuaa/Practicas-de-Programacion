#include "Pasante.hpp"
#include <conio.h>

int main(){
    Pasante R[10];
    textbackground(RED);
    textcolor(WHITE);
    int opcion, contador=0,i;
    do{
    clrscr();
    cout<<"Seleccione una opcion: "<<endl;
    cout<<"1) Ingresar los datos del pasante."<<endl; 
    cout<<"2) Mostrar los datos del pasante."<<endl; 
    cout<<"3) Visualizar el promedio de las notas para ver los pasantes."<<endl; 
    cout<<"4) Salir de la aplicacion."<<endl;
    cin>>opcion;
    fflush(stdin);
    switch(opcion){
    case 1:
           R[contador]=Leer_Datos();
           contador+=1;
           break;
    case 2:
           if (contador==0)
           cout<<"Ingrese al menos un usuario."<<endl;
           else{
           for(i=0;i<contador;i+=1){
           cout<<"Datos usuario....."<<i+1<<endl;
           R[i].Imprimir_Datos_Pasante();}}
           getch();
           break;
    case 3:
           if (contador==0)
           cout<<"Ingrese al menos un usuario."<<endl;
           else{
           for(i=0;i<contador;i+=1){
           if(R[i].Promedio>=6)
           cout<<"El usuario "<<i+1<<" es pasante con promedio de "<<R[i].Promedio<<endl;                     
           else
           cout<<"El usuario "<<i+1<<" no es pasante por su promedio de "<<R[i].Promedio<<endl;                     
           }}
           getch();
           break;
    case 4:
           cout<<" "<<endl;
           break;
    default:
            cout<<"Seleccione una opcion correcta."; 
            getch();
                  }
    }while(opcion!=4);
    return 1;
    }
