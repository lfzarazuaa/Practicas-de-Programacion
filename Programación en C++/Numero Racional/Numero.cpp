#include "Racional.hpp"
int main(){//Función principal
       NumeroRacional b;//Declaración de clase b.
       int c,numero1,numero2;//Declaración de variables para ingresar datos.
       cout << "Ingrese el primer numero: " << endl;//Pedir el primer número.
       cin >> numero1;//Ingresar el primer número.
       cout << "Ingrese el segundo numero: " << endl;//Pedir el segundo número.
       cin >> numero2;//Ingresar el segundo número.
       c=b.mcd(numero1,numero2);//Llamar al método mcd de la clase b.
       //cout<<"El maximo comun divisor es: "<<c;
       getch();//Esperar en pantalla hasta ingresar Enter.
       return 0;//Regresar 0 y terminar función.
      }
