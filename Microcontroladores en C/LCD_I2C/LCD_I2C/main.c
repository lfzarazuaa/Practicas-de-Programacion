/*
 * LCD_I2C.c
 *
 * Created: 06/06/2018 12:20:02 p. m.
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
uint8_t LCD=0x27;
uint8_t Puerto=0x00;
void Escribir_Puerto(uint8_t Dato){
	Puerto=Dato;
	I2C_Escribir_Direccion(LCD,Dato);
	for (uint8_t i=0;i<10;i++){}
}

#include <util/delay.h>
#include <inttypes.h>

#define LCD_RS      PC0            //Define el pin del Microcontrolador al cua se conecta el pin RS del LCD
#define LCD_E       PC2            //Define el pin del Microcontrolador al cual se conecta el pin E del LCD
#define LCD_BL      PC3            //Define el pin del Microcontrolador al cual se conecta el pin de la luz.

//Prototipos de fnción para LCD en modo de 4 bits
void LCD_INICIALIZA();      //Inicializa el LCD
void ENVIA_CMD(char dato);  //Función para envío de comandos
void ENVIA_DATO(char dato);
void ENVIA_CADENA(char *dato);
void LIMPIA_LCD();                //Limpia la pantalla del LCD
void CURSOR_DER();
void CURSOR_IZQ();
void REGRESO_CASA();
void POS_LINEA1(char posicion);
void POS_LINEA2(char posicion);
void POS_LINEA3(char posicion);
void POS_LINEA4(char posicion);

void LCD_INICIALIZA()
{
	ENVIA_CMD(0x02);
	ENVIA_CMD(0x28); // 0010 1000 DL = 0 comunicacion de 4 bits N = 1 Pantalla de 2 lineas F = 0 Caracteres de 5x7 puntos
	ENVIA_CMD(0x0E); // D=1 Display ON Cursor OFF
	ENVIA_CMD(0x06); // I/D = 1 Incremento Automatico S=0
	ENVIA_CMD(0x01);  // Limpia LCD
	ENVIA_CMD(0X80);
}

void ENVIA_CMD(char dato)
{
	char cmd_enviar;
	cmd_enviar =  (dato & (0xF0));      // se envia el nibble alto y backlight
	Escribir_Puerto(cmd_enviar|(Puerto&(1<<LCD_BL)));       // al puerto
	Escribir_Puerto(Puerto&(~(1<<LCD_RS)));//  RS = 0
	Escribir_Puerto(Puerto|(1<<LCD_E));//  E = 1
	_delay_ms(1);
	Escribir_Puerto(Puerto&(~(1<<LCD_E)));   //   E = 0
	_delay_ms(2);
	
	cmd_enviar =  ((dato<<4) & 0xF0);      // se envia el nibble alto y backlight
	Escribir_Puerto(cmd_enviar|(Puerto&(1<<LCD_BL)));       // al puerto
	Escribir_Puerto(Puerto&(~(1<<LCD_RS)));//  RS = 0
	Escribir_Puerto(Puerto|(1<<LCD_E));//  E = 1
	_delay_ms(1);
	Escribir_Puerto(Puerto&(~(1<<LCD_E)));   //   E = 0
	_delay_ms(2);
	return;
}

void ENVIA_DATO(char dato)
{
	char dto_enviar;
	
	dto_enviar=   (dato & 0xF0);      // se envia el nibble alto y backlight
	Escribir_Puerto(dto_enviar|(Puerto&(1<<LCD_BL)));       // al puerto
	Escribir_Puerto(Puerto|(1<<LCD_RS)|(1<<LCD_E));//  RS = 1   E = 1
	_delay_ms(1);
	Escribir_Puerto(Puerto&(~(1<<LCD_E)));   //   E = 0
	Escribir_Puerto(Puerto&(~(1<<LCD_RS)));//  RS = 0
	_delay_ms(2);
	
	dto_enviar=   ((dato<<4) & 0xF0);      // se envia el nibble bajo y backlight
	Escribir_Puerto(dto_enviar|(Puerto&(1<<LCD_BL)));       // al puerto
	Escribir_Puerto(Puerto|(1<<LCD_RS)|(1<<LCD_E));//  RS = 1   E = 1
	_delay_ms(1);
	Escribir_Puerto(Puerto&(~(1<<LCD_E)));   //   E = 0
	Escribir_Puerto(Puerto&(~(1<<LCD_RS)));//  RS = 0
	_delay_ms(2);
	return;
}

void ENVIA_CADENA(char *dato)
{
	int i;
	for(i=0;dato[i]!='\0';i++)
	ENVIA_DATO(dato[i]);
}

void LIMPIA_LCD()
{
	ENVIA_CMD(0x1);   //0000 0001
}

void REGRESO_CASA()
{
	ENVIA_CMD(0x02);  //0000 0010
}

void CURSOR_DER()
{
	ENVIA_CMD(0x1C);  //0001 1100
}

void CURSOR_IZQ()
{
	ENVIA_CMD(0x18);  // 0001 1000
}

void POS_LINEA1(char posicion)
{
	char linea1 = 0x80;
	posicion= posicion|linea1;
	ENVIA_CMD(posicion);
	
}

void POS_LINEA2(char posicion)
{
	char linea2 = 0xC0;
	posicion= posicion|linea2;
	ENVIA_CMD(posicion);
	
}

void POS_LINEA3(char posicion)
{
	char linea3 = 0x94;
	posicion= posicion|linea3;
	ENVIA_CMD(posicion);
	
}

void POS_LINEA4(char posicion)
{
	char linea4 = 0xD4;
	posicion= posicion|linea4;
	ENVIA_CMD(posicion);
}

void Prender_Backlight(){ 
	 Escribir_Puerto(Puerto|(1<<LCD_BL));//  BL = 1
}
void Apagar_Backlight(){
	Escribir_Puerto(Puerto&(~(1<<LCD_BL)));//  BL = 0
}
void POS_CGRAM(char posicion)
{
	char CGRAM = (1<<6);
	posicion= (posicion*8)|CGRAM;
	ENVIA_CMD(posicion);
}
void Carga_Caracter(char *dato)
{
	uint8_t i;
	for(i=0;i<8;i++){
	 ENVIA_DATO(dato[i]);}
}

char Caracteres_Iniciales[4][8]= {{0b00100,0b01110,0b11111,0b01110,0b01110,0b01110,0b01110,0b01110},
	                              {0b11011,0b10001,0b00000,0b10001,0b10001,0b10001,0b10001,0b10001},
								  {0b00100,0b01100,0b00100,0b00100,0b11111,0b11111,0b01110,0b00000},
								  {0b00100,0b00100,0b00100,0b00100,0b11111,0b11111,0b01110,0b00100}};
int main(void)
{
	uint8_t i=0;
	Inicializar_I2C();
	LCD_INICIALIZA();
	POS_CGRAM(0);
	for(i=0;i<4;i++){
	Carga_Caracter(Caracteres_Iniciales[i]);}
	POS_LINEA1(2);
	ENVIA_DATO(0x00);
	ENVIA_DATO(0x01);
	ENVIA_DATO(0x02);
	ENVIA_DATO(0x03);
	ENVIA_CADENA("HOLA");
	/* Replace with your application code */
	while (1)
	{
		Prender_Backlight();
		_delay_ms(200);
		Apagar_Backlight();
		_delay_ms(200);
	}
}

