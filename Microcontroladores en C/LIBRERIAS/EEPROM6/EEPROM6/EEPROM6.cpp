/*
 * EEPROM6.cpp
 *
 * Created: 20/03/2018 08:52:36 p.m.
 *  Author: Adrian
 */ 


#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/eeprom.h>
#include <util/delay.h>
#include  "Lcd4bits.h"

uint8_t EEMEM *direccion;
uint8_t dato;

void LEER_EEPROM();
void ESCRIBIR_EEPROM();

int main(void)
{
	short int indice;
	DDRA = 0X00;
	PORTA = 0XFF;
	
	DDRC = 0X00;
	PORTC = 0XFF;
	
	DDRB = 0XFF;
	
	DDRD=0x00;
	PORTD = 0XFF;

	while(1)
	{
		indice = PINC & 0x03;
		switch(indice)
		{
			case 1:
			LEER_EEPROM();
			break;
			
			case 2:
			ESCRIBIR_EEPROM();
			break;
		}
	}
}

void LEER_EEPROM()
{
	//*direccion = PINA;
	dato = eeprom_read_byte((uint8_t*)PINA);
	_delay_ms(1000);
	PORTB = dato;
	_delay_ms(1000);
	PORTB = 0x00;
}

void ESCRIBIR_EEPROM()
{
	//*direccion = PINA;
	dato = PIND;
	eeprom_write_byte((uint8_t*)PINA,dato);
	_delay_ms(1000);
	PORTB = EEDR;
	_delay_ms(1000);
	PORTB = EEAR;
	_delay_ms(1000);
	PORTB = 0x00;
	_delay_ms(1000);
}
