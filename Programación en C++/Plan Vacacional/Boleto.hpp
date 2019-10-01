#include<iostream>

//como se ocupra char se pone
#include<string.h>

using namespace std;

class Boleto{
      protected:
      int fecha;
      float importe;
      char folio[15], ciudadorigen[15], ciudaddestino[15];
      
      //para crear el objeto se necesita ser publico
public:
             Boleto();
             //No se coloca el nombre de la variable porque es un prototipo de constructor
             Boleto(int , float , char *, char *, char *);
             void Imprimir_Boleto();
       };
       //cuando se genera un objeto inmediatamente se genera un objeto 
Boleto::Boleto(){}
Boleto::Boleto(int f ,float i ,char fol[], char co[], char ci[]){
                          fecha=f;
                          importe=i;
                          strcpy(folio,fol);
                          strcpy(ciudadorigen,co);
                          strcpy(ciudaddestino,ci);
                          }
                          
void Boleto::Imprimir_Boleto(){
     cout<< "..............Boleto............" <<endl;
     cout<< ".......Boleto Numero......... " <<folio<<endl;
     cout<< "......Ciudad Origen: "<< ciudadorigen<<endl << "Ciudad Destino: " << ciudaddestino <<endl;
     }
     
