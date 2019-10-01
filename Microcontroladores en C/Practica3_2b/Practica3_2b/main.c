/*
 * Practica3_2b.c
 *
 * Created: 02/05/2018 05:21:40 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <avr/io.h>
#include <Teclado_Matricial_lib.h>
#include <Lcd4bits.h>

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

uint16_t Valor_Dir, Valor_Dato;
uint8_t Valor_Lectura;
char Decimal[3];
char Hexadecimal[2];
char Binario[8];

uint8_t Recibir_Opcion(void);
uint8_t Recibir_Numero(void);
void Presionar_Aceptar(void);
uint8_t Verificar_Valor_Direccion(uint8_t Dir1,uint8_t Dir2,uint8_t Dir3);
uint8_t Verificar_Valor_Dato(uint8_t Dato1,uint8_t Dato2,uint8_t Dato3);
void Imprimir_Valores(uint8_t Valor_Leido);
void Obtener_Decimal(uint8_t Valor_Leido);
void Obtener_Hexadecimal(uint8_t Valor_Leido);
void Obtener_Binario(uint8_t Valor_Leido);

uint8_t Recibir_Numero(void){
	uint8_t Dig;
	Dig=Obtener_Tecla();
	while((Dig>0x39)){
		Dig=Obtener_Tecla();
	}
	while(Obtener_Tecla()==Dig);
	return Dig;
}

void Presionar_Aceptar(void){
	while(Obtener_Tecla()!=Tecla_A);
}

uint8_t Verificar_Valor_Direccion(uint8_t Dir1,uint8_t Dir2,uint8_t Dir3){
	uint8_t Bandera=1;
	Dir1-=0x30;
	Dir2-=0x30;
	Dir3-=0x30;
	Valor_Dir=Dir1*100+Dir2*10+Dir3;
	if (Valor_Dir>511)
	{
		Bandera=0;
	}
	return Bandera;
}

uint8_t Verificar_Valor_Dato(uint8_t Dato1,uint8_t Dato2,uint8_t Dato3){
	uint8_t Bandera=1;
	Dato1-=0x30;
	Dato2-=0x30;
	Dato3-=0x30;
	Valor_Dato=Dato1*100+Dato2*10+Dato3;
	if (Valor_Dato>255)
	{
		Bandera=0;
	}
	return Bandera;
}

void Imprimir_Valores(uint8_t Valor_Leido){
	int i;
	Obtener_Decimal(Valor_Leido);
	Obtener_Hexadecimal(Valor_Leido);
	Obtener_Binario(Valor_Leido);
	LIMPIA_LCD();
	POS_LINEA1(2);
	for (i=0;i<3;i++){
	 ENVIA_DATO(Decimal[i]);
	}
	POS_LINEA1(9);
	for (i=0;i<2;i++){
		ENVIA_DATO(Hexadecimal[i]);
	}
	POS_LINEA2(5);
	for (i=0;i<8;i++){
		ENVIA_DATO(Binario[i]);
	}
}

void Obtener_Decimal(uint8_t Valor_Leido){
	uint8_t i;
	for (i = 0; i <3; i++){
		Decimal[i]=0x30;
	}
	while(Valor_Leido>=100){
		Valor_Leido-=100;
		Decimal[0]++;
	}
	while(Valor_Leido>=10){
		Valor_Leido-=10;
		Decimal[1]++;
	}
	Decimal[2]=0x30+Valor_Leido;
}
uint8_t Hex0,Hex1;
void Obtener_Hexadecimal(uint8_t Valor_Leido){
	Hex0=(Valor_Leido&0xf0)>>4;
	Hex1=Valor_Leido&0X0f;
	if (Hex0>9){Hexadecimal[0]=Hex0+0x41-0x0A;} 
	else{Hexadecimal[0]=Hex0+0x30;}
	if (Hex1>9){Hexadecimal[1]=Hex1+0x41-0x0A;}
	else{Hexadecimal[1]=Hex1+0x30;}
}

void Obtener_Binario(uint8_t Valor_Leido){
	uint8_t i,Enmascaramiento=0b10000000;
	for (i=0;i<8;i++){
		if(Valor_Leido&Enmascaramiento){Binario[i]='1';}
		else{Binario[i]='0';}
		Enmascaramiento=Enmascaramiento>>1;
	}
}

int main(void)
{
	uint8_t Dir1,Dir2,Dir3,Dato1,Dato2,Dato3,opcion;
	uint8_t Valor_Leido;
	DDRC=0xFF;
	LCD_INICIALIZA();
	ENVIA_CMD(0b00001100);
	Inicializar_Teclado();
	while (1)
	{
	 LIMPIA_LCD();
	 POS_LINEA1(1);
	 ENVIA_CADENA("1-Leer EEPROM");
	 POS_LINEA2(2);
	 ENVIA_CADENA("2-Escribir EEPROM");
	 //Leer opción
	 opcion=Recibir_Numero();
	 LIMPIA_LCD();
	 POS_LINEA1(1);
	 ENVIA_CADENA("Opcion Elegida:");
	 POS_LINEA2(5);
	 ENVIA_DATO(opcion);
	 Presionar_Aceptar();
	 //Opciones
	 LIMPIA_LCD();
	 if(opcion=='1'){//Ingresar direccion
		 POS_LINEA1(1);
		 ENVIA_CADENA("Ingrese Dir:");
		 POS_LINEA2(5);
		 Dir1=Recibir_Numero();
		 ENVIA_DATO(Dir1);
		 Dir2=Recibir_Numero();
		 ENVIA_DATO(Dir2);
		 Dir3=Recibir_Numero();
		 ENVIA_DATO(Dir3);
		 Presionar_Aceptar();
		 if(Verificar_Valor_Direccion(Dir1,Dir2,Dir3)){
			 //Valor_Leido=EEPROM_read(Valor_Dir);
			 Valor_Lectura=EEPROM_read(Valor_Dir);
			 Imprimir_Valores(Valor_Lectura);
		 }
		 else{
			 LIMPIA_LCD();
			 POS_LINEA1(1);
			 ENVIA_CADENA("Direccion");
			 POS_LINEA2(1);
			 ENVIA_CADENA("Invalida");
		 }
		 Presionar_Aceptar();
	 }
	 else if (opcion=='2')
	 {
		 POS_LINEA1(1);
		 ENVIA_CADENA("Ingrese Dir:");
		 POS_LINEA2(5);
		 Dir1=Recibir_Numero();
		 ENVIA_DATO(Dir1);
		 Dir2=Recibir_Numero();
		 ENVIA_DATO(Dir2);
		 Dir3=Recibir_Numero();
		 ENVIA_DATO(Dir3);
		 Presionar_Aceptar();
		 if(Verificar_Valor_Direccion(Dir1,Dir2,Dir3)){
			 //Valor_Leido=EEPROM_read(Valor_Dir);
			 Valor_Lectura=EEPROM_read(Valor_Dir);
			 Imprimir_Valores(Valor_Lectura);
			 _delay_ms(2000);
			 LIMPIA_LCD();
			 POS_LINEA1(1);
			 ENVIA_CADENA("Ingrese Dato:");
			 POS_LINEA2(5);
			 Dato1=Recibir_Numero();
			 ENVIA_DATO(Dato1);
			 Dato2=Recibir_Numero();
			 ENVIA_DATO(Dato2);
			 Dato3=Recibir_Numero();
			 ENVIA_DATO(Dato3);
			 Presionar_Aceptar();
			 if (Verificar_Valor_Dato(Dato1,Dato2,Dato3)){
				 EEPROM_write(Valor_Dir,(uint8_t)Valor_Dato);
				 Valor_Leido=EEPROM_read(Valor_Dir);
				 Imprimir_Valores(Valor_Leido);
			 }
			 else{
				 LIMPIA_LCD();
				 POS_LINEA1(1);
				 ENVIA_CADENA("Dato");
				 POS_LINEA2(1);
				 ENVIA_CADENA("Invalido");
			 }
		 }
		 else{
			 LIMPIA_LCD();
			 POS_LINEA1(1);
			 ENVIA_CADENA("Direccion");
			 POS_LINEA2(1);
			 ENVIA_CADENA("Invalida");
		 }
		 Presionar_Aceptar();
	 }
	 else{
		 POS_LINEA1(1);
		 ENVIA_CADENA("Opcion:");
		 POS_LINEA2(1);
		 ENVIA_CADENA("Invalida");
		 Presionar_Aceptar();
	 }
	}
}
 