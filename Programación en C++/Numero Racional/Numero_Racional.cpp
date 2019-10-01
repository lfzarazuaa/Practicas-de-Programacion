#include <iostream>//Declaración librería iostream útil para llamar clases de cpp.
#include <conio.h>//Declaración librería conio.
//declaracion de clase
using namespace std;//Uso del prefijo std para ahorrar código en la llamada de la clase cout y cin.
class NumeroRacional{//Declaración de clase NumeroRacional.
     int num;//Declaración del entero numerador.
     int den;//Declaración del entero denominador.
     int r,menor,a;//Declaración del entero residuo, menor y auxiliar.
     public://Hacer de uso libre las funciones de la clase.
            NumeroRacional(){//Constructor que inicializa la clase.
             num=0;
             den=1;                 
            }
     int mcd(int n,int d){//Función o método maximo común divisor.
          num=n;//Igualar los resultados obtenidos desde el main(o de la misma clase)
          den=d;//con los de la función actual.
          if (den==0||num==0){//Si algun número es cero imprimir el resultado en
          imprimir(num+den);//pantalla ya que ese es el resultado.                   
          return num+den;}//Salir de la función y regresar el resultado.
          else{//En caso que no sea cero ninguno de los números.
           if(num>=den){//Calcular cual es el mas grande de ellos.
           menor=den;//y en base a eso sacar el residuo y elegir el menor,
           r=num%den;//de ambos.
           }
           else{//En caso que el mayor sea el denominador.
           menor=num;
           r=den%num;
          }
          a=mcd(menor,r);//La función vuelve a llamarse asi misma para ir reduciendo términos.
          //Además regresa el valor de la función cuando un numero vale cero mateniendo el valor,
          //hasta la ultima reiteración.
          return a;//Regresa el valor de la función (resultado o mínimo común divisor).
         }}
     void imprimir(int r){//Función o método para imprimir el número en pantalla.
          cout<<"El maximo comun divisor es: "<<r;//Imprime el resultado en pantalla.
          }
     };//Fin de clase.
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
