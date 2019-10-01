/*
 * SPI_HC595.c
 *
 * Created: 03/06/2018 08:40:20 a. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define DD_CS DDB0
#define DD_SCK DDB1
#define DD_MOSI DDB2
#define PORT_SPI PORTB
#define DDR_SPI DDRB
void Inicializar_SPI(){
	DDR_SPI=(1<<DD_CS)|(1<<DD_MOSI)|(1<<DD_SCK);
	SPCR=(0<<SPIE)|(1<<SPE)|(0<<DORD)|(1<<MSTR)|(0<<CPOL)|(0<<CPHA)|(1<<SPR1)|(0<<SPR0);
	//SPIE: SPI Interrupt Enable, SPE: SPI Enable,DORD: Data Order,MSTR: Master/Slave Select,CPOL: Clock Polarity,CPHA: Clock Phase,SPR1, SPR0: SPI Clock Rate Select 1 and 0.
	SPSR=(0<<SPIF)|(0<<WCOL)|(1<<5)|(1<<4)|(1<<3)|(1<<2)|(1<<1)|(1<<SPI2X);
	//SPIF: SPI Interrupt Flag, WCOL: Write COLlision Flag, SPI2X: Double SPI Speed Bit.
	//SPDR – SPI Data Register
}
uint8_t Byte_Alto,Byte_Bajo;
void Cargar_Dato(){
	 PORT_SPI|=(1<<DD_CS);
	 for (uint8_t i=0;i<10;i++){}
	 PORT_SPI&=!(1<<DD_CS);
}
void Escribir_Dato(uint8_t Dato){
	 SPDR=Dato;
	 while(!(SPSR & (1<<SPIF)));
}
void Escribir_SPI_Byte(uint8_t Dato){
	SPDR=Dato;
	while(!(SPSR & (1<<SPIF)));
	Cargar_Dato();
}
void Escribir_SPI_Word(uint16_t Dato){
	SPDR=*(&Dato+1);
	while(!(SPSR & (1<<SPIF)));
	SPDR=*(&Dato);
	while(!(SPSR & (1<<SPIF)));
	Cargar_Dato();
}
int main(void)
{
    uint16_t i=1024;
	Inicializar_SPI();
	/* Replace with your application code */
    while (1){
		Escribir_SPI_Word(i);
		i++;
		//_delay_ms(500);
    }
}

