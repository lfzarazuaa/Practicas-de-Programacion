#include "Racional.hpp"
int main(){//Funci�n principal
       NumeroRacional b;//Declaraci�n de clase b.
       int c,numero1,numero2;//Declaraci�n de variables para ingresar datos.
       cout << "Ingrese el primer numero: " << endl;//Pedir el primer n�mero.
       cin >> numero1;//Ingresar el primer n�mero.
       cout << "Ingrese el segundo numero: " << endl;//Pedir el segundo n�mero.
       cin >> numero2;//Ingresar el segundo n�mero.
       c=b.mcd(numero1,numero2);//Llamar al m�todo mcd de la clase b.
       //cout<<"El maximo comun divisor es: "<<c;
       getch();//Esperar en pantalla hasta ingresar Enter.
       return 0;//Regresar 0 y terminar funci�n.
      }
