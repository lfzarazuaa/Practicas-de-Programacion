/*
 * Teclado_Matricial_Mega.c
 *
 * Created: 24/04/2018 11:31:05 a. m.
 * Author : LuisFernando
 */ 
#define F_CPU 16000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#define DDR_Teclado DDRK
#define Puerto_Teclado PORTK
#define Pin_Teclado PINK
#define Tecla_Nula 235
#define Tecla_0 '0'
#define Tecla_1 '1'
#define Tecla_2 '2'
#define Tecla_3 '3'
#define Tecla_4 '4'
#define Tecla_5 '5'
#define Tecla_6 '6'
#define Tecla_7 '7'
#define Tecla_8 '8'
#define Tecla_9 '9'
#define Tecla_A 'A'
#define Tecla_B 'B'
#define Tecla_C 'C'
#define Tecla_D 'D'
#define Tecla_Num '#'
#define Tecla_Ast '*'

void Inicializar_Teclado(void);
uint8_t Obtener_Tecla(void);
uint8_t Detectar_Tecla(uint8_t,uint8_t,uint8_t,uint8_t);
void Accion_Tecla_0(void);
void Accion_Tecla_1(void);
void Accion_Tecla_2(void);
void Accion_Tecla_3(void);
void Accion_Tecla_4(void);
void Accion_Tecla_5(void);
void Accion_Tecla_6(void);
void Accion_Tecla_7(void);
void Accion_Tecla_8(void);
void Accion_Tecla_9(void);
void Accion_Tecla_A(void);
void Accion_Tecla_B(void);
void Accion_Tecla_C(void);
void Accion_Tecla_D(void);
void Accion_Tecla_Ast(void);
void Accion_Tecla_Num(void);
uint8_t Ultima_Tecla_Presionada=Tecla_Nula, Tecla_Presionada=Tecla_Nula;

void Inicializar_Teclado(void){
	DDR_Teclado=0xF0;//(1<<DDD7)|(1<<DDD6)|(1<<DDD5)|(1<<DDD4)|(0<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);
	Puerto_Teclado=0x0F;//(1<<PB7)|(1<<PB6)|(1<<PB5)|(1<<PB4)|(1<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
	//Configuración de Interrupciones;
	MCUCR=(0<<JTD)|(0<<6)|(0<<5)|(0<<PUD)|(0<<3)|(0<<2)|(0<<IVSEL)|(0<<IVCE);//Configuracion Flancos de bajada en INT0.
	PCICR=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(1<<PCIE2)|(0<<PCIE1)|(0<<PCIE0);
	PCMSK2=(0<<PCINT23)|(0<<PCINT22)|(0<<PCINT21)|(0<<PCINT20)|(1<<PCINT19)|(1<<PCINT18)|(1<<PCINT17)|(1<<PCINT16);
}

uint8_t Obtener_Tecla(void){//Filas(7-4) Salidas, Columnas(3-0) Entradas
	uint8_t Tecla, Entrada;
	Puerto_Teclado=0x0F;//(0<<PB7)|(0<<PB6)|(0<<PB5)|(0<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);//Verificar Estado sin modificar pullup.
	Entrada=Pin_Teclado&(0x0F);
	if(Entrada<0x0F){
		Puerto_Teclado=0x7F;//(0<<PB7)|(1<<PB6)|(1<<PB5)|(1<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
		_delay_ms(1);
		Tecla=Detectar_Tecla(Tecla_1,Tecla_2,Tecla_3,Tecla_A);
		if (Tecla==Tecla_Nula)
		{
			Puerto_Teclado=0xBF;//(1<<PB7)|(0<<PB6)|(1<PB5)|(1<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
			_delay_ms(1);
			Tecla=Detectar_Tecla(Tecla_4,Tecla_5,Tecla_6,Tecla_B);
			if (Tecla==Tecla_Nula)
			{
				Puerto_Teclado=0xDF;//(1<<PB7)|(1<<PB6)|(0<<PB5)|(1<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
				_delay_ms(1);
				Tecla=Detectar_Tecla(Tecla_7,Tecla_8,Tecla_9,Tecla_C);
				if (Tecla==Tecla_Nula)
				{
					Puerto_Teclado=0xEF;//(1<<PB7)|(1<<PB6)|(1<<PB5)|(0<<PB4)|(1<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
					_delay_ms(1);
					Tecla=Detectar_Tecla(Tecla_Ast,Tecla_0,Tecla_Num,Tecla_D);
				}
			}
		}
		Tecla_Presionada=Tecla;
		return Tecla;
	}
	else{
		Tecla_Presionada=Tecla_Nula;
	return Tecla_Nula;}
}

uint8_t Detectar_Tecla(uint8_t C1,uint8_t C2,uint8_t C3,uint8_t C4){
	uint8_t var=Pin_Teclado&(0x0F);
	uint8_t Tecla_Presionada=Tecla_Nula;
	if (var==0x0E){//((1<<PB3)|(1<<PB2)|(1<<PB1)|(0<<PB0))
		Tecla_Presionada=C4;
	}
	else if(var==0x0D){//((1<<PB3)|(1<<PB2)|(0<<PB1)|(1<<PB0))
		Tecla_Presionada=C3;
	}
	else if(var==0x0B){//((1<<PB3)|(1<<PB2)|(0<<PB1)|(1<<PB0))
		Tecla_Presionada=C2;
	}
	else if(var==0x07){//((0<<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0))
		Tecla_Presionada=C1;
	}
	return Tecla_Presionada;
}
  
  //void Accion_Tecla_0(void){
	  //
  //}
  //void Accion_Tecla_1(void){
	  //
  //}
  //void Accion_Tecla_2(void){
	  //
  //}
  //void Accion_Tecla_3(void){
	  //
  //}
  //void Accion_Tecla_4(void){
	  //
  //}
  //void Accion_Tecla_5(void){
	  //
  //}
  //void Accion_Tecla_6(void){
	  //
  //}
  //void Accion_Tecla_7(void){
	  //
  //}
  //void Accion_Tecla_8(void){
	  //
  //}
  //void Accion_Tecla_9(void){
	  //
  //}
  //void Accion_Tecla_A(void){
	  //
  //}
  //void Accion_Tecla_B(void){
	  //
  //}
  //void Accion_Tecla_C(void){
	  //
  //}
  //void Accion_Tecla_D(void){
	  //
  //}
  //void Accion_Tecla_Ast(void){
	  //
  //}
  //void Accion_Tecla_Num(void){
	  //
  //}
  
 void Accion_Tecla_0(void){
	 PORTA=Tecla_0;
 }
 void Accion_Tecla_1(void){
	 PORTA=Tecla_1;
 }
 void Accion_Tecla_2(void){
	 PORTA=Tecla_2;
 }
 void Accion_Tecla_3(void){
	 PORTA=Tecla_3;
 }
 void Accion_Tecla_4(void){
	 PORTA=Tecla_4;
 }
 void Accion_Tecla_5(void){
	 PORTA=Tecla_5;
 }
 void Accion_Tecla_6(void){
	 PORTA=Tecla_6;
 }
 void Accion_Tecla_7(void){
	 PORTA=Tecla_7;
 }
 void Accion_Tecla_8(void){
	 PORTA=Tecla_8;
 }
 void Accion_Tecla_9(void){
	 PORTA=Tecla_9;
 }
 void Accion_Tecla_A(void){
	 PORTA=Tecla_A;
 }
 void Accion_Tecla_B(void){
	 PORTA=Tecla_B;
 }
 void Accion_Tecla_C(void){
	 PORTA=Tecla_C;
 }
 void Accion_Tecla_D(void){
	 PORTA=Tecla_D;
 }
 void Accion_Tecla_Ast(void){
	 PORTA=Tecla_Ast;
 }
 void Accion_Tecla_Num(void){
	 PORTA=Tecla_Num;
 }
ISR(PCINT2_vect){
	cli();
	uint8_t Tecla=Obtener_Tecla();
	if (Tecla!=Tecla_Nula){Ultima_Tecla_Presionada=Tecla;}
	switch (Tecla)
	{
	 case Tecla_0: 
	        Accion_Tecla_0();
		    break;
	 case Tecla_1: 
			Accion_Tecla_1();
			break;
	 case Tecla_2:
			Accion_Tecla_2();
			break;
	 case Tecla_3:
			Accion_Tecla_3();
			break;
	 case Tecla_4:
	        Accion_Tecla_4();
	        break;
	 case Tecla_5:
	        Accion_Tecla_5();
	        break;
	 case Tecla_6:
	        Accion_Tecla_6();
	        break;
	 case Tecla_7:
	        Accion_Tecla_7();
	        break;
	 case Tecla_8:
	        Accion_Tecla_8();
	        break;
	 case Tecla_9:
	        Accion_Tecla_9();
	        break;
	 case Tecla_A:
	        Accion_Tecla_A();
	        break;
	 case Tecla_B:
	        Accion_Tecla_B();
	        break;
	 case Tecla_C:
	        Accion_Tecla_C();
	        break;
	 case Tecla_D:
	        Accion_Tecla_D();
	        break;
	 case Tecla_Ast:
	        Accion_Tecla_Ast();
	        break;
	 case Tecla_Num:
	        Accion_Tecla_Num();
	        break;
	 default:
	        break;
	}
	sei();
}
int main(void)
{
	cli();
	DDRA=0xFF;
	DDRB=0xFF;
    Inicializar_Teclado();
	sei();
	/* Replace with your application code */
    while (1) 
    {
	  PORTB=Tecla_Presionada;
    }
}

