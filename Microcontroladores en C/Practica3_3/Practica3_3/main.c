/*
 * Practica3_3.c
 *
 * Created: 26/04/2018 07:59:20 a. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1000000UL
#include <avr/io.h>
#include <Teclado_Matricial_lib.h>
#include <Lcd4bits.h>

uint8_t Recibir_Opcion(void);
uint8_t Recibir_Numero(void);
uint8_t Verificar_Contrasena(uint8_t ID_num,uint8_t Digito1,uint8_t Digito2,uint8_t Digito3,uint8_t Digito4);
void Cambiar_Contrasena(uint8_t ID_num);
void Presionar_Aceptar(void);
void EEPROM_write(uint16_t Direccion,uint8_t Dato);
uint8_t EEPROM_read(uint16_t Direccion);
void Cargar_EEPROM_Inicial(void);

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

int main(void)
{
	uint8_t ID_num,Digito1,Digito2,Digito3,Digito4,Opcion,Salida;
    uint8_t ID;
	DDRA=0x00;
	PORTA=0xFF;
	DDRB=0xFF;
	PORTB=0x00;
	DDRC=0xFF;
	LCD_INICIALIZA();
	ENVIA_CMD(0b00001100);
    Inicializar_Teclado();
	if((PINA&0x01)==0){
	  Cargar_EEPROM_Inicial();
	}
    while (1)
    {
		LIMPIA_LCD();
		Salida=0;
		POS_LINEA1(1);
		ENVIA_CADENA("Ingrese ID(0-9):");
		POS_LINEA2(5);
		//Leer ID del Usuario
		ID=Recibir_Numero();
		ID_num=ID-0X30;
		ENVIA_DATO(ID);
		Presionar_Aceptar();
		//Escribir contraseña
		LIMPIA_LCD();
		POS_LINEA1(1);
		ENVIA_CADENA("Ingrese Contraseña:");
		POS_LINEA2(4);
		Digito1=Recibir_Numero();
		ENVIA_DATO(Digito1);
		Digito2=Recibir_Numero();
		ENVIA_DATO(Digito2);
		Digito3=Recibir_Numero();
		ENVIA_DATO(Digito3);
		Digito4=Recibir_Numero();
		ENVIA_DATO(Digito4);
		Presionar_Aceptar();
		//Verificar Contraseña (Direcciones 0(0x00-0x03), 1(0x10-0x13), 2(0x20-0x23) ... 8(0x80-83) 9(0x90-0x93))
		if(Verificar_Contrasena(ID_num,Digito1,Digito2,Digito3,Digito4)){
		  LIMPIA_LCD();
		  POS_LINEA1(0);
		  ENVIA_CADENA("Ingreso Correcto");
		  PORTB=0xFF;
		  _delay_ms(2000);
		  PORTB=0x00;
		  while(Salida==0){
          LIMPIA_LCD();
          POS_LINEA1(1);
          ENVIA_CADENA("1-Nueva Contrasena");
          POS_LINEA2(2);
		  ENVIA_CADENA("2-Salir");
		  Opcion=Recibir_Opcion();
		  Presionar_Aceptar();
		   if (Opcion==0x31){
			 Cambiar_Contrasena(ID_num);
			 Salida=0;
		   }
		   else{//Reiniciar
			 Salida=1;
		   }
		  }
		}
		else{
			LIMPIA_LCD();
			POS_LINEA1(1);
			ENVIA_CADENA("Contrasena");
			POS_LINEA2(1);
			ENVIA_CADENA("Incorrecta");
			_delay_ms(1500);
		}
    }
}

uint8_t Recibir_Opcion(void){
	uint8_t Dig;
	Dig=Obtener_Tecla();
	while((Dig>0x32)|(Dig<0x31)){
		Dig=Obtener_Tecla();
	}
	while(Obtener_Tecla()==Dig);
	return Dig;
}
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

uint8_t Verificar_Contrasena(uint8_t ID_num,uint8_t Digito1,uint8_t Digito2,uint8_t Digito3,uint8_t Digito4){
	uint8_t Sal=0;
	uint8_t Dir_Alto=ID_num<<4;
	if(Digito1==EEPROM_read(Dir_Alto|0x00)){
	  if(Digito2==EEPROM_read(Dir_Alto|0x01)){
	     if(Digito3==EEPROM_read(Dir_Alto|0x02)){
			if(Digito4==EEPROM_read(Dir_Alto|0x03)){
			   Sal=1;
			} 
		 }
	  }
	}
	return Sal;
}
void Cambiar_Contrasena(uint8_t ID_num){
	uint8_t Digito1,Digito2,Digito3,Digito4;
	uint8_t Dir_Alto=ID_num<<4;
	LIMPIA_LCD();
	POS_LINEA1(2);
	ENVIA_CADENA("Nueva Contraseña:");
	POS_LINEA2(4);
	Digito1=Recibir_Numero();
	ENVIA_DATO(Digito1);
	Digito2=Recibir_Numero();
	ENVIA_DATO(Digito2);
	Digito3=Recibir_Numero();
	ENVIA_DATO(Digito3);
	Digito4=Recibir_Numero();
	ENVIA_DATO(Digito4);
	Presionar_Aceptar();
    EEPROM_write(Dir_Alto|(0x00),Digito1);	
	EEPROM_write(Dir_Alto|(0x01),Digito2);	
	EEPROM_write(Dir_Alto|(0x02),Digito3);	
	EEPROM_write(Dir_Alto|(0x03),Digito4);	
}

void Cargar_EEPROM_Inicial(){
	uint8_t i,j;
	for(j=0;j<10;j++){
	 for(i=0;i<3;i++){
	  EEPROM_write((j<<4)|i,'0');
	 }
	  EEPROM_write((j<<4)|i,j+0x30);}
}