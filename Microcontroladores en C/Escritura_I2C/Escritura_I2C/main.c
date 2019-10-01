/*
 * Escritura_I2C.c
 *
 * Created: 03/06/2018 06:29:49 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define START 0x08
#define MT_SLA_ACK 0x18
#define MT_DATA_ACK 0x28
#define MR_SLA_ACK 0x40
#define MR_DATA_ACK 0x50

#define W 1 
uint8_t Escribir_I2C(uint8_t Direccion,uint8_t Dato){
	TWCR = 0;//Resetear registro de control.
	TWCR|=(1<<TWINT)|(1<<TWSTA)|(1<<TWEN);//Enviar condición de Inicio.
	while (!(TWCR & (1<<TWINT)));//Esperar a la bandera de inicio
	if ((TWSR & 0xF8) != START){
		return 1;//Verificar que no haya código de error en start.
	}
	TWDR = (Direccion<<1)|(1<<W);//Escribir Dirección a transmitir en modo Escritura.
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MT_SLA_ACK){
	    return 1;
	}
	TWDR = Dato;
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición del dato.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MT_DATA_ACK){
		return 1;
	}
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWSTO);//Transmitir condición de paro.
	return 0;
}
uint8_t Dato_Recibido_I2C=0;

uint8_t Leer_I2C(uint8_t Direccion){
	TWCR=(1<<TWINT)|(1<<TWSTA)|(1<<TWEN);//Enviar condición de Inicio.
	while (!(TWCR & (1<<TWINT)));//Esperar a la bandera de inicio.
	if ((TWSR & 0xF8) != START){
		return 1;//Verificar que no haya código de error en start.
	}
	TWDR = (Direccion<<1)&(0xFE);//Escribir Dirección a transmitir en modo Lectura.
	TWCR = (1<<TWINT)|(1<<TWEN);//Limpiar banderas para comenzar la transmición de la dirección.
	while (!(TWCR & (1<<TWINT)));//Esperar el ACK.
	if ((TWSR & 0xF8) !=MR_SLA_ACK){
		return 1;
	}
	TWCR = (1<<TWINT)|(1<<TWEN)| (1<<TWEA);//Limpiar banderas para comenzar la lectura del dato.
	while (!(TWCR & (1<<TWINT)));//Esperar haber recibido el dato.
	if ((TWSR & 0xF8) !=MR_DATA_ACK){
		return 1;
	}
	Dato_Recibido_I2C=TWDR;
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWSTO);//Transmitir condición de paro.
	return 0;
}

uint8_t Lectura_I2C(uint8_t Direccion){
	while(Leer_I2C(Direccion));
	return Dato_Recibido_I2C;
}
void Inicializar_I2C(){
	 
	 //TWI Bit Rate Register
	 TWBR=0X01;
	 //TWI Control Register;
	 TWCR=(0<<TWINT)|(0<<TWEA)|(0<<TWSTA)|(0<<TWSTO)|(0<<TWWC)|(0<<TWEN)|(0<<1)|(0<<TWIE);
	 // TWINT: TWI Interrupt Flag, TWEA: TWI Enable Acknowledge Bit, TWSTA: TWI START Condition Bit, TWSTO: TWI STOP Condition Bit, TWWC: TWI Write Collision Flag, TWEN: TWI Enable Bit, TWIE: TWI Interrupt Enable.
	 // TWI Status Register
	 TWSR=(0<<TWS7)|(0<<TWS6)|(0<<TWS5)|(0<<TWS4)|(0<<TWS3)|(0<<2)|(0<<TWPS1)|(0<<TWPS0);//Prescalador de 1.
	 // TWS: TWI Status (codes), TWPS: TWI Prescaler Bits
	 //– TWI Data Register
	 //TWDR=
	 //TWI (Slave) Address Register
	 //TWAR
}
int main(void)
{
	 uint8_t Dir=0x68;
	 
	/* Replace with your application code */
    while (1) 
    {
	    Escribir_I2C(Dir,);
		_delay_ms(2500);
    }
}

