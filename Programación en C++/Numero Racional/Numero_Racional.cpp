#include <iostream>//Declaraci�n librer�a iostream �til para llamar clases de cpp.
#include <conio.h>//Declaraci�n librer�a conio.
//declaracion de clase
using namespace std;//Uso del prefijo std para ahorrar c�digo en la llamada de la clase cout y cin.
class NumeroRacional{//Declaraci�n de clase NumeroRacional.
     int num;//Declaraci�n del entero numerador.
     int den;//Declaraci�n del entero denominador.
     int r,menor,a;//Declaraci�n del entero residuo, menor y auxiliar.
     public://Hacer de uso libre las funciones de la clase.
            NumeroRacional(){//Constructor que inicializa la clase.
             num=0;
             den=1;                 
            }
     int mcd(int n,int d){//Funci�n o m�todo maximo com�n divisor.
          num=n;//Igualar los resultados obtenidos desde el main(o de la misma clase)
          den=d;//con los de la funci�n actual.
          if (den==0||num==0){//Si algun n�mero es cero imprimir el resultado en
          imprimir(num+den);//pantalla ya que ese es el resultado.                   
          return num+den;}//Salir de la funci�n y regresar el resultado.
          else{//En caso que no sea cero ninguno de los n�meros.
           if(num>=den){//Calcular cual es el mas grande de ellos.
           menor=den;//y en base a eso sacar el residuo y elegir el menor,
           r=num%den;//de ambos.
           }
           else{//En caso que el mayor sea el denominador.
           menor=num;
           r=den%num;
          }
          a=mcd(menor,r);//La funci�n vuelve a llamarse asi misma para ir reduciendo t�rminos.
          //Adem�s regresa el valor de la funci�n cuando un numero vale cero mateniendo el valor,
          //hasta la ultima reiteraci�n.
          return a;//Regresa el valor de la funci�n (resultado o m�nimo com�n divisor).
         }}
     void imprimir(int r){//Funci�n o m�todo para imprimir el n�mero en pantalla.
          cout<<"El maximo comun divisor es: "<<r;//Imprime el resultado en pantalla.
          }
     };//Fin de clase.
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
