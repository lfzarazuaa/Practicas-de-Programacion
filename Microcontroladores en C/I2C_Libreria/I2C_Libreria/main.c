/*
 * I2C_Libreria.c
 *
 * Created: 03/06/2018 09:57:39 p. m.
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

uint8_t Error;
int main(void)
{
	uint8_t RTC=0x68;
	DDRD=0x00;
	PORTD=0x03;
	DDRA=0xFF;
	Inicializar_I2C();
	/* Replace with your application code */
	while (1)
	{
		Error=I2C_Escribir_Byte(RTC,0x02,0x07);
		PORTA=I2C_LEER_Byte(RTC,00);
		_delay_ms(100);
	}
}

