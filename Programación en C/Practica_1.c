#include <iostream>
#include <conio.h>
//declaracion de clase

using namespace std;
class Cuenta_Bancaria{
 char Nombre[40], Domicilio[40];
 int Numero, Edad, Fecha, Clave, Telefono;
 float Saldo;
 public://métodos(funciones de la clase).
        
        Cuenta_Bancaria(int numero){
            Saldo=0;
            Clave=0;
        }
        void Crear_cuenta(int numero,char nombre[40],int clave){//Creación de la cuenta
         Clave=1+clave*10;
         Numero=numero;
         Nombre=nombre;
         cout << "Su numero de cuenta es: " << Numero << endl;
        }
        int Verificar_cuenta(int numero){
         if (Clave==0)
            return 1;//Activar Cuenta.
         else        
            return 0;//No hacer nada.
        }
        void Retiro(int clave, int monto){
          if(Saldo-Monto>=0){
           Saldo-Monto;
           cout << "Se han retirado: " << monto <<endl;
           cout << "Su saldo es: " << Saldo <<endl;}
          else{
           cout << "Su saldo es insuficiente " << endl;    
          }       
        }
        void Consulta(int clave){
          cout << "Su saldo es: " << Saldo <<endl;     
        }          
        void Deposito(int clave, int monto){
         Saldo=Saldo+Monto;
         cout << "Se han ingresado: " << monto <<endl;
         cout << "Su saldo es: " << Saldo <<endl;        
        }
        void Cerrar_cuenta(int clave){  
         cout << "Se ha cerrado la cuenta: " << Numero <<endl; 
        }
   }; //los atributos y metodos al ser parte de la clase no es necesario poner (tiempo t) y t.hora porque tienen acceso directo a la clase


main(){
   Cuenta_Bancaria C[20];
   char Nombre[40];
     int operacion,clave,i=1,rep=0,numero;
     float monto;
     do{
   cout << "Ingrese la operacion a realizar:" << endl;
   cout << "1)Crear cuenta." << endl;
   cout << "2)Retiro." << endl;
   cout << "3)Consulta de saldo." << endl;
   cout << "4)Deposito." << endl;
   cout << "5)Cerrar cuenta.\n" << endl;
   cout << "6)Salir.\n" << endl;
   cin >> operacion;
   switch(operacion){  
    case 1: 
           cout << "Ingrese su nombre: " << endl;
           fflush(stdin);//Función para evitar errores con cadenas.
           cin >> Nombre;
         cout << "Ingrese su clave: " << endl;
         cin >> clave;
         for(i=1;i<20;i++){
           if(C[i].Verificar_cuenta(i)==1)
           break;
           ;}
           if(i<20)
         C[i].Crear_cuenta(i,Nombre,clave);
         else
         cout << "Ya no hay cuentas disponibles." << endl;
         break;
    case 2:
           cout << "Ingrese su numero de cuenta: " << endl;
         cin >> numero;
         cout << "Ingrese su clave: " << endl;
         cin >> clave;
         cout << "Ingrese la cantidad que desea retirar: " << endl;
         cin >> monto;
         C[numero].Retiro(clave,monto);
         break;
    case 3:
           cout << "Ingrese su numero de cuenta: " << endl;
         cin >> numero;
         cout << "Ingrese su clave: " << endl;
         cin >> clave;
         C[numero].Consulta(clave);
         break;
    case 4:
           cout << "Ingrese su numero de cuenta: " << endl;
         cin >> numero;
         cout << "Ingrese su clave: " << endl;
         cin >> clave;
         cout << "Ingrese la cantidad que desea depositar: " << endl;
         cin >> monto;
         C[numero].Deposito(clave,monto);
         break;
    case 5:
           cout << "Ingrese su numero de cuenta: " << endl;
         cin >> numero;
         cout << "Ingrese su clave: " << endl;
         cin >> clave;
         C[numero].Cerrar_cuenta(clave);
         break;
    case 6:
           
           break;
    default:
         cout << "Ingrese una opcion correcta. " << endl; 
    ;}
     
    }while(rep!=6)
   //getch();
;}

