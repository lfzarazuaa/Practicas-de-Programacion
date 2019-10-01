/*
 * Practica3_2.c
 *
 * Created: 20/04/2018 09:26:58 a. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <Teclado_Matricial_lib.h>

void EEPROM_write(uint16_t Direccion,uint8_t Dato);
uint8_t EEPROM_read(uint16_t Direccion);

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
uint8_t Tec;
int main(void)
{
	cli();
	DDRA=0x00;//Leer Dato (Entradas)
	DDRB=0x00;//Dirección (Entradas)
	DDRC=0xFF;//Mostrar Dato (Salidas)
	Inicializar_Teclado();
	//Habilitar la interrupción global
	sei();
	/* Replace with your application code */
	while (1)
	{
		Tec=Obtener_Tecla();
		if(Tec!=Tecla_Nula){
			if(Tec==Tecla_1){
			  Leer_Direccion_EEPROM();
			}
			else if(Tec==Tecla_2){
			  Escribir_Dato_EEPROM();
			}
		}
		_delay_ms(1);
	}
}