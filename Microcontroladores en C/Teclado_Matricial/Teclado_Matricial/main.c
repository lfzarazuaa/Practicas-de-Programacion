/*
 * Teclado_Matricial.c
 *
 * Created: 22/04/2018 07:53:04 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define DDR_Teclado DDRD
#define Puerto_Teclado PORTD
#define Pin_Teclado PIND
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
uint8_t Tecla_Presionada=Tecla_Nula,Ultima_Tecla_Presionada=Tecla_Nula,conteo=0;

void Inicializar_Teclado(void);
uint8_t Obtener_Tecla(void);
uint8_t Detectar_Tecla(uint8_t,uint8_t,uint8_t,uint8_t);

void EEPROM_write(uint16_t Direccion,uint8_t Dato);
uint8_t EEPROM_read(uint16_t Direccion);

void Inicializar_Teclado(void){
	DDR_Teclado=0xF0;//(1<<DDD7)|(1<<DDD6)|(1<<DDD5)|(1<<DDD4)|(0<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);
	Puerto_Teclado=0xFF;//(1<<PB7)|(1<<PB6)|(1<<PB5)|(1<<PB4)|(1<PB3)|(1<<PB2)|(1<<PB1)|(1<<PB0);
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
		return Tecla;
	}
	else{
	return Tecla_Nula;}
}

uint8_t Detectar_Tecla(uint8_t C1,uint8_t C2,uint8_t C3,uint8_t C4){
	uint8_t var=Pin_Teclado&(0x0F);
	Tecla_Presionada=Tecla_Nula;
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



void EEPROM_write(uint16_t Direccion,uint8_t Dato){
	//Esperar a la escritura anterior.
	while(EECR & (1<<EEWE));
	//Escribir en registros del AVR la dirección y el dato.
	EEAR=Direccion;
	EEDR=Dato;
	//Escribir 1 lógico.
	EECR|=(1<<EEMWE);
	//Empezar la escritura en la EEPROM.
	EECR|=(1<<EEWE);
}

uint8_t EEPROM_read(uint16_t Direccion){
	//Esperar a la escritura anterior.
	while(EECR & (1<<EEWE));
	//Escribir en registros del AVR la dirección.
	EEAR=Direccion;
	//Escribir 1 lógico.
	EECR|=(1<<EERE);
	//Empezar la escritura en la EEPROM.
	return EEDR;
}

void Leer_Direccion_EEPROM(void);
void Escribir_Dato_EEPROM(void);

void Leer_Direccion_EEPROM(void){//LEER
	PORTC=EEPROM_read(PINB);
}

void Escribir_Dato_EEPROM(void){//Escribir
	EEPROM_write(PINB,PINA);
}

int main(void)
{
	//uint8_t Tec;
	cli();
	DDRA=0xFF;
	Inicializar_Teclado();
	//Habilitar la interrupción global
	sei();
	/* Replace with your application code */
	while (1)
	{
		PORTA=Obtener_Tecla();
		_delay_ms(1);
	}
}