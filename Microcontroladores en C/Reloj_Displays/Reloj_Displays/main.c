/*
 * Reloj_Displays.c
 *
 * Created: 04/06/2018 12:35:00 a. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define START 0x08
#define MT_SLA_ACK 0x18
#define MT_SLA_NACK 0x20
#define MT_DATA_ACK 0x28
#define MT_DATA_NACK 0x30
#define MR_SLA_ACK 0x40
#define MR_SLA_NACK 0x48
#define MR_DATA_ACK 0x50
#define MR_DATA_NACK 0x58

#define F_SCL 100000UL // Frecuencia de SLC
#define Prescalador 1
#define TWBR_val ((((F_CPU / F_SCL) / Prescalador) - 16 ) / 2)


#define DD_CS DDB0
#define DD_SCK DDB1
#define DD_MOSI DDB2
#define PORT_SPI PORTB
#define DDR_SPI DDRB


void Inicializar_I2C(){
	//TWI Bit Rate Register.
	TWBR = (uint8_t)TWBR_val;
	// TWI Status Register
	TWSR=(0<<TWS7)|(0<<TWS6)|(0<<TWS5)|(0<<TWS4)|(0<<TWS3)|(0<<2)|(0<<TWPS1)|(0<<TWPS0);//Prescalador de 1.
	// TWS: TWI Status (codes), TWPS: TWI Prescaler Bits
	//– TWI Data Register
	//TWI Control Register;
	TWCR=(0<<TWINT)|(0<<TWEA)|(0<<TWSTA)|(0<<TWSTO)|(0<<TWWC)|(0<<TWEN)|(0<<1)|(0<<TWIE);
	// TWINT: TWI Interrupt Flag, TWEA: TWI Enable Acknowledge Bit, TWSTA: TWI START Condition Bit, TWSTO: TWI STOP Condition Bit, TWWC: TWI Write Collision Flag, TWEN: TWI Enable Bit, TWIE: TWI Interrupt Enable.
	//TWDR=
	//TWI (Slave) Address Register
	//TWAR
}
uint8_t Bandera_Estado=0x00;
uint8_t Inicio_I2C_Write(uint8_t Direccion){
	TWCR = 0;//Resetear registro de control.
	TWCR|=(1<<TWINT)|(1<<TWSTA)|(1<<TWEN);//Enviar condición de Inicio.
	while (!(TWCR & (1<<TWINT)));//Esperar a la bandera de inicio
	if ((TWSR & 0xF8) != START){
		Bandera_Estado|=(1<<0);
		return 1;//Verificar que no haya código de error en start.
	}
	
	TWDR = (Direccion<<1)|(0x00);//Escribir Dirección a transmitir en modo Escritura.
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MT_SLA_ACK){
		Bandera_Estado|=(1<<1);
		return 1;//Salir si hay algun error.
	}
	return 0;
}

uint8_t Inicio_I2C_Write_NACK(uint8_t Direccion){
	TWCR = 0;//Resetear registro de control.
	TWCR|=(1<<TWINT)|(1<<TWSTA)|(1<<TWEN);//Enviar condición de Inicio.
	while (!(TWCR & (1<<TWINT)));//Esperar a la bandera de inicio
	if ((TWSR & 0xF8) != START){
		Bandera_Estado|=(1<<0);
		return 1;//Verificar que no haya código de error en start.
	}
	
	TWDR = (Direccion<<1)|(0x00);//Escribir Dirección a transmitir en modo Escritura.
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWEA);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MT_SLA_ACK){
		Bandera_Estado|=(1<<1);
		return 1;//Salir si hay algun error.
	}
	return 0;
}

uint8_t I2C_Escribir(uint8_t Dato){
	TWDR = Dato;//Escribir Dirección a transmitir en modo Escritura.
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MT_DATA_ACK){
		Bandera_Estado|=(1<<2);
		return 1;//Salir si hay algun error.
	}
	return 0;
}

void I2C_Parar(){
	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWSTO);
}

uint8_t I2C_Escribir_Byte(uint8_t Dispositivo,uint8_t Direccion, uint8_t Dato){
	if(Inicio_I2C_Write(Dispositivo)) return 1;
	I2C_Escribir(Direccion);
	if(I2C_Escribir(Dato)) return 1;
	I2C_Parar();
	for (uint8_t i=0;i<100;i++){}
	return 0;
}

uint8_t I2C_Escribir_Bytes(uint8_t Dispositivo, uint8_t Direccion, uint8_t* Dato, uint8_t longitud)
{
	if(Inicio_I2C_Write(Dispositivo)) return 1;
	I2C_Escribir(Direccion);
	for (uint8_t i = 0; i < longitud; i++)
	{
		if (I2C_Escribir(Dato[i])) return 1;
	}
	I2C_Parar();
	return 0;
}


uint8_t Inicio_I2C_Read(uint8_t Direccion){
	TWCR = 0;//Resetear registro de control.
	TWCR|=(1<<TWINT)|(1<<TWSTA)|(1<<TWEN);//Enviar condición de Inicio.
	while (!(TWCR & (1<<TWINT)));//Esperar a la bandera de inicio
	if ((TWSR & 0xF8) != START){
		return 1;//Verificar que no haya código de error en start.
	}
	
	TWDR = (Direccion<<1)|(0x01);//Escribir Dirección a transmitir en modo Lectura.
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWEA);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MR_SLA_ACK){
		return 1;//Salir si hay algun error.
	}
	return 0;
}

uint8_t I2C_LEER_ACK(void){
	Regreso_ACK:
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWEA);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MR_DATA_ACK){
		goto Regreso_ACK;
	}
	return TWDR;
}

uint8_t I2C_LEER_NACK(void){
	Regreso_NACK:
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MR_DATA_NACK){
		Bandera_Estado=(1<<3);
		goto Regreso_NACK;
	}
	return TWDR;
}

uint8_t I2C_Escribir_Direccion(uint8_t Dispositivo,uint8_t Direccion){
	if(Inicio_I2C_Write(Dispositivo)) return 1;
	I2C_Escribir(Direccion);
	I2C_Parar();
	return 0;
}

uint8_t I2C_LEER_Byte(uint8_t Dispositivo,uint8_t Direccion){
	I2C_Escribir_Direccion(Dispositivo,Direccion);
	//I2C_Escribir_Byte(Dispositivo,Direccion,0x0F);
	if(Inicio_I2C_Read(Dispositivo)) return 1;
	uint8_t Dato=I2C_LEER_NACK();
	I2C_Parar();
	for (uint8_t i=0;i<100;i++){}
	return Dato;
}

uint8_t I2C_LEER_Bytes(uint8_t Dispositivo,uint8_t Direccion,uint8_t* Datos, uint8_t longitud){
	I2C_Escribir_Direccion(Dispositivo,Direccion);
	if(Inicio_I2C_Read(Dispositivo)) return 1;
	for (uint8_t i = 0; i < (longitud-1); i++){
		Datos[i] = I2C_LEER_ACK();
	}
	Datos[(longitud-1)] = I2C_LEER_NACK();
	I2C_Parar();
	return 0;
}
uint8_t Dir_RTC=0x68;
uint8_t Leer_Horas(){
	return  I2C_LEER_Byte(Dir_RTC,02);
}

uint8_t Leer_Minutos(){
	return  I2C_LEER_Byte(Dir_RTC,01);
}

uint8_t Leer_Segundos(){
	return I2C_LEER_Byte(Dir_RTC,00);
}

void Escribir_Horas(uint8_t Horas){
	I2C_Escribir_Byte(Dir_RTC,02,Horas);
}

void Escribir_Minutos(uint8_t Minutos){
	I2C_Escribir_Byte(Dir_RTC,01,Minutos);
}

void Escribir_Segundos(uint8_t Segundos){
	I2C_Escribir_Byte(Dir_RTC,00,Segundos);
}

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

void Escribir(uint8_t Display, uint8_t Numero){
	SPDR=Display;
	while(!(SPSR & (1<<SPIF)));
	SPDR=Numero;
	while(!(SPSR & (1<<SPIF)));
	Cargar_Dato();
}

void Inicializar_Display(){
	uint8_t Direccion,Comando;
	Direccion=0x0C;
	Comando=0x01;
	Escribir(Direccion,Comando);//Operación Normal 0x0C01.
	Direccion=0x0B;
	Comando=0x07;
	Escribir(Direccion,Comando);//Todos los digitos Activados 0x0B07.
	Direccion=0x0A;
	Comando=0x08;
	Escribir(Direccion,Comando);//Intensidad Moderada 0x0A08.
	Direccion=0x09;
	Comando=0xFF;
	Escribir(Direccion,Comando);//Decodificar todos 0x09FF.
}

uint8_t Digito[2];
void Obtener_Digitos(uint8_t x){
	Digito[0]=x&(0x0F);
	Digito[1]=(x&(0xF0))>>4;
}



int main(void)
{
	Inicializar_I2C();
	Inicializar_SPI();
	Inicializar_Display();
	//Escribir_Horas(0x12);
	//Escribir_Minutos(0x23);
	//Escribir_Segundos(0x00);
	/* Replace with your application code */
	while (1)
	{
		Obtener_Digitos(Leer_Horas());
		Escribir(8,Digito[1]);
		Escribir(7,Digito[0]);
		Escribir(6,0x0A);
		Obtener_Digitos(Leer_Minutos());
		Escribir(5,Digito[1]);
		Escribir(4,Digito[0]);
		Escribir(3,0x0A);
		Obtener_Digitos(Leer_Segundos());
		Escribir(2,Digito[1]);
		Escribir(1,Digito[0]);
		_delay_ms(10);
	}
}

