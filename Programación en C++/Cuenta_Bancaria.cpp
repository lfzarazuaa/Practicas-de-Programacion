#include <iostream>
#include <conio.h>
//declaracion de clase

using namespace std;
class Cuenta_Bancaria{
 char Nombre[40], Domicilio[40];
 int Numero, Edad, Fecha, Clave, Telefono;
 float Saldo;
 public://métodos(funciones de la clase).
        
        Cuenta_Bancaria(){
            Saldo=0;
            Clave=0;
        }
        void Crear_cuenta(int numero,char nombre[40],int clave){//Creación de la cuenta
         Clave=1+clave*10;
         Numero=numero;
         //Nombre=nombre;
         cout << "Su numero de cuenta es: " << Numero << endl;
        }
        int Verificar_cuenta(int numero){
         if (Clave==0)
            return 1;//Activar Cuenta.
         else        
            return 0;//No hacer nada.
        }
        void Retiro(int clave, float monto){
          if(Clave==1+clave*10){
          if(Saldo-monto>=0){
           Saldo=Saldo-monto;
           cout << "Se han retirado: " << monto <<endl;
           cout << "Su saldo es: " << Saldo <<endl;}
          else{
           cout << "Su saldo es insuficiente." << endl;    
          }}
          else
          cout << "Contraseña incorrecta." << endl;    
        }
        void Consulta(int clave){
          if(Clave==1+clave*10)
          cout << "Su saldo es: " << Saldo <<endl;
          else
          cout << "Contraseña incorrecta." << endl;     
        }          
        void Deposito(int clave, float monto){
         if(Clave==1+clave*10){
          Saldo=Saldo+monto;
          cout << "Se han ingresado: " << monto <<endl;
          cout << "Su saldo es: " << Saldo <<endl;}
         else
          cout << "Contraseña incorrecta." << endl;         
        }
        void Cerrar_cuenta(int clave){
         if(Clave==1+clave*10){
          Clave=0;
          Saldo=0;
          cout << "Se ha cerrado la cuenta: " << Numero <<endl; 
         }
         else
          cout << "Contraseña incorrecta." << endl;
        }
   }; //los atributos y metodos al ser parte de la clase no es necesario poner (tiempo t) y t.hora porque tienen acceso directo a la clase


main(){
	Cuenta_Bancaria C[20];
	char Nombre[40];
     int operacion,clave,i=1,numero;
     float monto;
     do{
	cout << "Ingrese la operacion a realizar:" << endl;
	cout << "1)Crear cuenta." << endl;
	cout << "2)Retiro." << endl;
	cout << "3)Consulta de saldo." << endl;
	cout << "4)Deposito." << endl;
	cout << "5)Cerrar cuenta." << endl;
	cout << "6)Salir.\n" << endl;
	cin >> operacion;
	switch(operacion){  
    case 1: 
           cout << "Ingrese su nombre: " << endl;
           fflush(stdin);//Función para evitar errores con cadenas.
           gets(Nombre);
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
	      if(numero<20&&numero>0)
	       C[numero].Retiro(clave,monto);
	      else
	       cout << "numero de cuenta incorrecto." << endl;
	      break;
    case 3:
           cout << "Ingrese su numero de cuenta: " << endl;
	      cin >> numero;
	      cout << "Ingrese su clave: " << endl;
	      cin >> clave;
	      if(numero<20&&numero>0)
	       C[numero].Consulta(clave);
	      else
	       cout << "numero de cuenta incorrecto." << endl;
	      break;
    case 4:
           cout << "Ingrese su numero de cuenta: " << endl;
	      cin >> numero;
	      cout << "Ingrese su clave: " << endl;
	      cin >> clave;
	      cout << "Ingrese la cantidad que desea depositar: " << endl;
	      cin >> monto;
	      if(numero<20&&numero>0)
	       C[numero].Deposito(clave,monto);
           else
	       cout << "numero de cuenta incorrecto." << endl;
	      break;
    case 5:
           cout << "Ingrese su numero de cuenta: " << endl;
	      cin >> numero;
	      cout << "Ingrese su clave: " << endl;
	      cin >> clave;
	      if(numero<20&&numero>0)
	       C[numero].Cerrar_cuenta(clave);
           else
	       cout << "numero de cuenta incorrecto." << endl;
	      break;
    case 6:
           
           break;
    default:
	      cout << "Ingrese una opcion correcta. " << endl; 
    ;}
     
    }while(operacion!=6)
	//getch();
;}
