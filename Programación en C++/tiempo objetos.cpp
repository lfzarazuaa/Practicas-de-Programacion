#include <iostream>
#include <conio.h>
//declaracion de clase

using namespace std;
class tiempo{
 int hora;
 int min;
 int seg;
 public:
 	tiempo(){
 		hora = 0;
 		min = 0;
 		seg = 0;
 	}
 	tiempo(int h, int m, int s){
 		hora = (h >=0 && h <24) ? h : 0;
 		min = (m >=0 && m <60) ? m :0;
 		seg = (s >=0 && s < 60) ? s : 0;
 	}
void f12h () {
  cout << ((hora == 0 || hora  == 12) ? 12 : hora%12 )
  << ":" << min << ":" << seg 
  << (hora < 12 ? "  AM" : "  PM");
 }
void f24h() {
	cout << hora << ":" << min << ":" << seg << "  horas";
}
}; //los atributos y metodos al ser parte de la clase no es necesario poner (tiempo t) y t.hora porque tienen acceso directo a la clase


main(){
	
	int h, m,s;
	cout << "Ingresa la hora porfavor: " << endl;
	cin >> h;
	cout << "Ingresa los minutos: ";
	cin >> m;
	cout << "Ingresa los segundos: ";
	cin >> s;
	
	tiempo t2, t1(h, m, s);
	t1.f12h();
	cout <<endl;
	t1.f24h();
	t2.f12h();
	t2.f24h();
	
	getch();
}
