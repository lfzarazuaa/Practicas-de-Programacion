#include <iostream>//Declaración librería iostream útil para llamar clases de cpp.
#include <conio.h>//Declaración librería conio.
#include <math.h>
//declaracion de clase
using namespace std;//Uso del prefijo std para ahorrar código en la llamada de la clase cout y cin.
class Operaciones_Basicas{//Declaración de clase operaciones Basicas.
      public:
      float a;
      float b;
      Operaciones_Basicas(){
       a=1;
       b=1;
      }
      void Suma(){
       fflush( stdin );
       cout<<"Ingrese el sumando 1: ";
       cin>> a;
       fflush( stdin );
       cout<<endl<<"Ingrese el sumando 2: ";
       cin>> b;
       fflush( stdin );
       cout<<endl<<"El resultado de "<<a<<" + "<<b<<"="<<a+b<<endl;
      }
      void Resta(){
       fflush( stdin );
       cout<<"Ingrese el minuendo: ";
       cin>> a;
       fflush( stdin );
       cout<<endl<<"Ingrese el sustraendo: ";
       cin>> b;
       fflush( stdin );
       cout<<endl<<"El resultado de "<<a<<" - "<<b<<"="<<a-b<<endl;    
      }
      void Multiplicacion(){
       fflush( stdin );
       cout<<"Ingrese el factor 1: ";
       cin>> a;
       fflush( stdin );
       cout<<endl<<"Ingrese el factor 2: ";
       cin>> b;
       fflush( stdin );
       cout<<endl<<"El resultado de "<<a<<" * "<<b<<"="<<a*b<<endl;    
      }
      void Division(){
       fflush( stdin );
       cout<<"Ingrese el dividendo: ";
       cin>> a;
       fflush( stdin );
       cout<<endl<<"Ingrese el divisor: ";
       cin>> b;
       fflush( stdin );
       cout<<endl<<"El resultado de "<<a<<" / "<<b<<"="<<a/b<<endl;
      }
     };//Fin de clase.
     
class Aritmetica{
      public:
      float a,b;
      int c,n;
      Aritmetica(){};
       void Promedio(){
       float promedio;
       promedio=0;
       fflush( stdin );
       cout<<"Ingrese el numero de elementos a promediar: ";
       cin>>c;
       fflush( stdin );
       for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese el elemento "<<n<<": ";
        cin>>b;
        promedio+=b;}
        fflush( stdin );
       promedio=promedio*100/(c*100);
       cout<<endl<<"El promedio es "<<promedio<<" ."<<endl;}
       void Porcentaje(){
        float porcentaje;
        cout<<endl<<"Ingrese el numero: ";
        cin>>b;
        fflush( stdin );
        cout<<endl<<"Ingrese el porcentaje: ";
        cin>>a;
        fflush( stdin );
        porcentaje=b*a/100;
        cout<<endl<<"El "<<a<<"% de "<<b<<"es "<<porcentaje<<endl;}             
      };

class Trigonometricas{
       public:
       float a,pi,r;
       Trigonometricas(){
         pi=3.14159265359;}
       void angulo(){
         cout<<endl<<"Ingrese el angulo: ";
         cin>>a;
         fflush( stdin );
        }
       void seno(){
        angulo();
        r=sin(pi*a/180);
        cout<<endl<<"El seno de "<<a<<" es "<<r<<"."<<endl;
       }
       void coseno(){
        angulo();
        r=cos(pi*a/180);
        cout<<endl<<"El coseno de "<<a<<" es "<<r<<"."<<endl;
       }
       void tangente(){
        angulo();
        r=tan(pi*a/180);
        cout<<endl<<"La tangente de "<<a<<" es "<<r<<"."<<endl;
       }
       void cosecante(){
        angulo();
        r=1/(sin(pi*a/180));
        cout<<endl<<"La cosecante de "<<a<<" es "<<r<<"."<<endl;
       }
       void secante(){
        angulo();
        r=1/(cos(pi*a/180));
        cout<<endl<<"La secante de "<<a<<" es "<<r<<"."<<endl;
       }
       void cotangente(){
        angulo();
        r=1/(tan(pi*a/180));
        cout<<endl<<"La cotangente de "<<a<<" es "<<r<<"."<<endl;
       }
      };
class Ecuaciones_Cuadraticas{
       public:
       float a,b,c,d,x1,x2,r;
       Ecuaciones_Cuadraticas(){};
       void Calcular(){
       cout<<"Bienvenido a la calculadora de raicies cuadradas de la forma ax^2+bx+c=0\n\n"<<endl;
       cout<<"Ingrese a: ";
       cin>>a;
       fflush( stdin );
       cout<<endl<<"Ingrese b: ";
       cin>>b;
       fflush( stdin );
       printf("\n");
       cout<<endl<<"Ingrese c: ";
       cin>>c;
       fflush( stdin );
       cout<<endl;
       d=pow(b,2)-(4*a*c);
       cout<<endl<<"El discriminante es: "<<d<<endl;
       if(a!=0){
        if(d>=0){
                x1=(-b+sqrt(d))/(2*a);
                x2=(-b-sqrt(d))/(2*a);
                cout<<endl<<"x1= "<<x1;
                cout<<endl<<"x2= "<<x2;}
        if(d<0){
               r=sqrt(-d)/(2*a);
               x1=(-b)/(2*a);
               x2=(-b)/(2*a);
               cout<<endl<<"x1= "<<x1<<" + "<<r<<"i .";
               cout<<endl<<"x2= "<<x2<<" - "<<r<<"i .";}}
        else{
          if(c!=0&&b!=0){
          x1=-c/b;
          cout<<endl<<"Tu ecuacion no es cuadratica sino es lineal y por lo tanto\n x= "<<x1<<" .";}
          else{
               cout<<endl<<"x=0";}}}
      };
class Numero_Complejo{
        public:
        float r,i;
        Numero_Complejo(){
         r=0;
         i=0;}
        void Asignar(float real,float imaginario){
         r=real;
         i=imaginario;}
        void mostrar(){
         if(i>=0)
         cout<<r<<"+"<<i<<"i";
         else
         cout<<r<<i<<"i";
        }
      };      
Numero_Complejo operator+(Numero_Complejo a, Numero_Complejo b) {
   Numero_Complejo temp;
   temp.r=a.r+b.r;
   temp.i=a.i+b.i;   
   return temp;
}

Numero_Complejo operator-(Numero_Complejo a, Numero_Complejo b) {
   Numero_Complejo temp;
   temp.r=a.r-b.r;
   temp.i=a.i-b.i;   
   return temp;
}

Numero_Complejo operator*(Numero_Complejo a, Numero_Complejo b) {
   Numero_Complejo temp;
   temp.r=a.r*b.r-a.i*b.i;
   temp.i=a.r*b.i+a.i*b.r;
   return temp;
}
Numero_Complejo operator/(Numero_Complejo a, Numero_Complejo b) {
   Numero_Complejo temp;
   temp.r=(a.r*b.r+a.i*b.i)/(b.r*b.r+b.i*b.i);
   temp.i=(a.i*b.r-a.r*b.i)/(b.r*b.r+b.i*b.i);
   return temp;
}      
class Operaciones_Complejos{
        public:
        float r,i;
        Numero_Complejo a,b,res;
        void Suma(){
         cout<<endl<<"Ingresa la parte real del sumando 1: ";    
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del sumando 1: ";      
         cin>>i;
         fflush( stdin );
         a.Asignar(r,i);
         cout<<endl<<"Ingresa la parte real del sumando 2: ";      
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del sumando 2: ";      
         cin>>i;
         fflush( stdin );
         b.Asignar(r,i);
         res=a+b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Resta(){
         cout<<endl<<"Ingresa la parte real del Minuendo: ";    
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del Minuendo: ";      
         cin>>i;
         fflush( stdin );
         a.Asignar(r,i);
         cout<<endl<<"Ingresa la parte real del Sustraendo: ";      
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del Sustraendo: ";      
         cin>>i;
         fflush( stdin );
         b.Asignar(r,i);
         res=a-b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Multiplicacion(){
         cout<<endl<<"Ingresa la parte real del factor 1: ";    
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del factor 1: ";      
         cin>>i;
         fflush( stdin );
         a.Asignar(r,i);
         cout<<endl<<"Ingresa la parte real del factor 2: ";      
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del factor 2: ";      
         cin>>i;
         fflush( stdin );
         b.Asignar(r,i);
         res=a*b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Division(){
         cout<<endl<<"Ingresa la parte real del dividendo: ";    
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del dividendo: ";      
         cin>>i;
         fflush( stdin );
         a.Asignar(r,i);
         cout<<endl<<"Ingresa la parte real del divisor: ";      
         cin>>r;
         fflush( stdin );
         cout<<endl<<"Ingresa la parte imaginaria del divisor: ";      
         cin>>i;
         fflush( stdin );
         b.Asignar(r,i);
         res=a/b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
      };
class Vector{
        public:
        float x,y,z;
        Vector(){
         x=0;
         y=0;
         z=0;}
        void Asignar(float i,float j, float k){
         x=i;
         y=j;
         z=k;}
        void mostrar(){
         if(y>=0)
         cout<<x<<"i+"<<y<<"j";
         else
         cout<<x<<"i"<<y<<"j";
         if(z>=0)
         cout<<"+"<<z<<"k";
         else
         cout<<z<<"k";
        }
      };  
Vector operator+(Vector a, Vector b) {
   Vector temp;
   temp.x=a.x+b.x;
   temp.y=a.y+b.y;
   temp.z=a.z+b.z;
   return temp;
}
Vector operator-(Vector a, Vector b) {
   Vector temp;
   temp.x=a.x-b.x;
   temp.y=a.y-b.y;
   temp.z=a.z-b.z;
   return temp;
}
Vector operator*(Vector a, Vector b) {
   Vector temp;
   temp.x=a.y*b.z-a.z*b.y;
   temp.y=-a.x*b.z+a.z*b.x;
   temp.z=a.x*b.y-a.y*b.x;
   return temp;
}
Vector operator/(Vector a, Vector b) {
   Vector temp;
   temp.x=a.x*b.x;
   temp.y=a.y*b.y;
   temp.z=a.z*b.z;
   return temp;
}             
class Operaciones_Vectoriales{
        public:
        float x,y,z;
        Vector a,b,res;
        void Lectura(){
             cout<<endl<<"Ingresa el componente x del primer vector: ";    
             cin>>x;
             fflush( stdin );
             cout<<endl<<"Ingresa el componente y del primer vector: ";      
             cin>>y;
             fflush( stdin );
             cout<<endl<<"Ingresa el componente z del primer vector: ";      
             cin>>z;
             fflush( stdin );
             a.Asignar(x,y,z);
             cout<<endl<<"Ingresa el componente x del segundo vector: ";    
             cin>>x;
             fflush( stdin );
             cout<<endl<<"Ingresa el componente y del segundo vector: ";      
             cin>>y;
             fflush( stdin );
             cout<<endl<<"Ingresa el componente z del segundo vector: ";      
             cin>>z;
             fflush( stdin );
             b.Asignar(x,y,z);
         }
        void Suma(){
         Lectura();
         res=a+b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Resta(){
         Lectura();
         res=a-b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Producto_Cruz(){
         Lectura();
         res=a*b;
         cout<<endl<<"El resultado es: ";
         res.mostrar();
        }
        void Producto_Punto(){
         float rpunto;
         Lectura();
         res=a/b;
         rpunto=res.x+res.y+res.z;
         cout<<endl<<"El resultado es: "<<rpunto<<" .";
        }
      };
      
class Coeficientes_de_Pascal{
       public:
        void Coeficiente(){
             int n,k;
             long int a;
             cout<<endl<<"Ingresa la potencia del binomio (no mayor a 12) :  ";
             cin>>n;
             fflush( stdin );
             for(k=0;k<=n;k++){
              a=binomial(n,k);
              if(a!=1)                
              cout<<a;
              if ((n-k)>=2)
              cout<<"x^"<<(n-k);
              else{
                   if ((n-k)==1)
                   cout<<"x";
              }
              if ((k)>=2)
              cout<<"y^"<<(k);
              else{
                   if ((k)==1)
                   cout<<"y";
              }
              if(k!=n){
                cout<<" + ";          
              }        
             }      
        }
        long int binomial(int n,int k){
         return Factorial(n)/(Factorial(k)*Factorial(n-k));                
        }
        long int Factorial(int n){
         int i;
         long int r=1; 
         if (n<2)
         return 1;
         else{
         for(i=1;i<=n;i++){
         r=r*i;}
         return r;} 
        }
      };

class Circuito{
       public:
       int c,n;
       float Total,b;
       public:
       virtual void Serie(){
        Total=0;
        fflush( stdin );
        cout<<"Ingrese el numero de baterias a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese el volatje de la bateria "<<n<<": ";
        cin>>b;
        fflush( stdin );
        Total+=b;}
        cout<<endl<<"El Voltaje total es de "<<Total<<" Volts."<<endl;
       }
       virtual void Paralelo(){
        Total=20000000;
        fflush( stdin );
        cout<<"Ingrese el numero de baterias a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese el volatje de la bateria "<<n<<": ";
        cin>>b;
        fflush( stdin );
        if (b<=Total)
         Total=b;
        else
         Total=Total;}
        cout<<endl<<"El Voltaje total es de "<<Total<<" Volts."<<endl;
       }
      };
      
class Resistencia:public Circuito{
        /**/
        public:
       virtual void Serie(){
        Total=0;
        fflush( stdin );
        cout<<"Ingrese el numero de resistencias a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese la resistencia "<<n<<": ";
        cin>>b;
        fflush( stdin );
        Total+=b;}
        cout<<endl<<"La resistencia total es de "<<Total<<" Ohms."<<endl;
       }
       virtual void Paralelo(){
        Total=0;
        fflush( stdin );
        cout<<"Ingrese el numero de resistencias a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese la resistencia "<<n<<": ";
        cin>>b;
        fflush( stdin );
        Total+=1/b;}
        Total=1/Total;
        cout<<endl<<"La resistencia total es de "<<Total<<" Ohms."<<endl; 
       }
      };
      
class Capacitor:public Circuito{
        public:
        virtual void Serie(){
        Total=0;
        fflush( stdin );
        cout<<"Ingrese el numero de capacitores a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese el capacitor "<<n<<"(uF): ";
        cin>>b;
        fflush( stdin );
        Total+=1/b;}
        Total=1/Total;
        cout<<endl<<"La capacitancia total es de "<<Total<<" uF."<<endl;
       }
        virtual void Paralelo(){
        Total=0;
        fflush( stdin );
        cout<<"Ingrese el numero de capacitores a sumar : ";
        cin>>c;
        fflush( stdin );
        for(n=1;n<=c;n++){
        cout<<endl<<"Ingrese el capacitor "<<n<<" (uF): ";
        cin>>b;
        fflush( stdin );
        Total+=b;}
        cout<<endl<<"La capacitancia total es de "<<Total<<" uF."<<endl; 
       }
      };
     
class Bateria:public Circuito{
        public:
      };    

      
      
