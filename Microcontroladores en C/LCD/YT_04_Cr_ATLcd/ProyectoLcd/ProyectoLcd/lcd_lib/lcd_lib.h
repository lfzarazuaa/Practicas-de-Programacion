//********************************************************************************************************************
//********************************************************************************************************************
// File Name	: 'lcd_lib.c'
// Title		: Interface LCD 4 Bits - 4 bit LCd interface
// Author		: Luis Loachamin - proyectos@progsisdel.com - http://www.progsisdel.com
// Explicacion  : http://www.youtube.com/user/progsisdeladvanced
//                VIDEO TUTORIAL ATMEL STUDIO  https://www.youtube.com/user/ProgsisdelAdvanced/playlists
// Creado		: 2011 - 05 - 27
// Revisado		: 2016 - 10 - 09
// Version		: 1.2
// Referencia -> http://winavr.scienceprog.com/
// Este codigo lo he modificado, mejorado y distribuido gratuitamente, así que tiene que ser distribuido de igual manera.
//********************************************************************************************************************
// Mayor Informacion: http://www.progsisdel.com/prodyserv/capacitacion/asesoria
//********************************************************************************************************************

#ifndef LCD_LIB
#define LCD_LIB

#include <stdio.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <inttypes.h>
#include <util/delay.h>

//*************************************************************************************************
//DETERMINA LOS PUERTOS QUE CONTROLARAN CADA PIN DEL LCD - SELECT PORTS TO LCD CONTROL EACH LCD PIN
//*************************************************************************************************

#define PR_LCD_RS	PORTC 	//define MCU pin connected to LCD RS
#define DR_LCD_RS	DDRC  	//define MCU pin connected to LCD RS

#define PR_LCD_E	PORTC	//define MCU pin connected to LCD E
#define DR_LCD_E	DDRC	//define MCU pin connected to LCD E

#define PR_LCD_D4	PORTD	//define MCU pin connected to LCD D3
#define DR_LCD_D4	DDRD	//define MCU pin connected to LCD D3

#define PR_LCD_D5	PORTD	//define MCU pin connected to LCD D4
#define DR_LCD_D5	DDRD	//define MCU pin connected to LCD D4

#define PR_LCD_D6	PORTB	//define MCU pin connected to LCD D5
#define DR_LCD_D6	DDRB	//define MCU pin connected to LCD D5	

#define PR_LCD_D7	PORTB	//define MCU pin connected to LCD D6
#define DR_LCD_D7	DDRB	//define MCU pin connected to LCD D6

//*************************************************************************************
//DETERMINA EL NUMERO DE PIN ESPECIFICADO PARA CONTROLAR EL LCD - SELECT THE PIN NUMBER
//*************************************************************************************

#define LCD_RS	0 	//define MCU pin connected to LCD RS
#define LCD_E	1	//define MCU pin connected to LCD E
#define LCD_D4	2	//define MCU pin connected to LCD D4
#define LCD_D5	6	//define MCU pin connected to LCD D5
#define LCD_D6	3	//define MCU pin connected to LCD D6
#define LCD_D7	5	//define MCU pin connected to LCD D7

//*************************************************************************************
//DETERMINA SI ADICIONAR LA BARRA DE PROGRESO A LA COMPILACION
//*************************************************************************************
#define BAR_PROGRES	1

//******************************************************************************
//INSTRUCCIONES PARA ENVIAR DATOS HACIA EL LCD - INSTRUCTIONS SET TO LCD CONTROL
//******************************************************************************

void LCDinit(void);		//Inicializa lcd - Lcd Init
void LCDblank(void);	//Apaga display pero no borra el contenido - LCD blank but not cleared 
void LCDvisible(void);	//Enciende el Display - LCD visible 
void LCDclr(void);		//Limpia Display y  Envia el cursor a la posicion inicial - Clears LCD  and send  Cursor home
void LCDhome(void);		//Envia el cursor a la posicion inicial - LCD cursor home
void LCDGotoXY(uint8_t, uint8_t);//Cursor to X Y position
void LCDcursorOnBlink(void);	// Mostrar Cursor + Blink - Display Cursor + Blink 
void LCDcursorLeft(uint8_t);	//Mueve el cursor a la izquierda "n" posiciones - Shift cursor left by n 
void LCDcursorRight(uint8_t);	//Mueve el cursor a la derecha "n" posiciones - Shif cursor right by n  
void LCDshiftRight(uint8_t);	//Desplaza el texto a la derecha "n" posiciones - Shift by n characters Right  
void LCDshiftLeft(uint8_t);		//Desplaza el texto a la izquierda "n" posiciones - Shift by n characters Left 
void CopyStringtoLCD(const uint8_t*, uint8_t, uint8_t);//Copia la string de la memoria flash al LCD en una posicion x y - Copies string from flash memory to LCD at x y position
void LCDdefinechar(const uint8_t *,uint8_t);//Escribe un caracter creado a la CGRAM del LCD - Write char to LCD CGRAM 
void LCDstring(uint8_t*, uint8_t);			//Envia una String al LCD - Outputs string to LCD
void LCDsendChar(uint8_t);	 				//Envia caracteres al lcd - send Characters to LCD

//COMANDOS EXTRAS (ADICIONADOS)
void LCDwriteRight(void);	//Permite que el texto en el lcd se escriba de izquierda a derecha FUNCION NORMAL - Allow text be written from left to right - ENTRY MODE SET
void LCDwriteLeft(void); 	//Permite que el texto en el lcd se escriba de derecha a izquierda - Allow text be written from right to left - ENTRY MODE SET
void LCDcursorOn(void);		//Cursor ON 
void LCDblinkOn(void);		//Blink On
void LCDcursorOFF(void);	//Desactiva - Turn OFF (((   LCDcursorOn() - LCDblinkOn() - LCDcursorOnBlink()   )))


//******************************************************************************
//DEFINICIONES Y VARIABLES PARA ENVIAR LOS DATOS DEL LCD ---- NO MODIFICAR ----- 
//DEFINITIONS AND VARIABLES TO LCD CONTROL               ---- NOT  MODIFY  ----- 
//******************************************************************************

// cursor position to DDRAM mapping
#define LCD_LINE0_DDRAMADDR		0x00
#define LCD_LINE1_DDRAMADDR		0x40
#define LCD_LINE2_DDRAMADDR		0x14
#define LCD_LINE3_DDRAMADDR		0x54
#define LCD_CGRAM           6	//DB6: set CG RAM address
#define LCD_DDRAM           7	//DB7: set DD RAM address

void LCD_EnableCmd(void);//Enable  - Habilita escritura de los comandos
void LCD_EnableChar(void);//Enable - Habilita escritura de caracteres
void LCDsendCommand(uint8_t);//Envia los comandos al lcd
void LCDsend_nibble(uint8_t Dat);//Activa los pines en el LCD con los comandos o caracteres a enviar

#if (BAR_PROGRES==1)
		
// progress bar defines
#define PROGRESSPIXELS_PER_CHAR	6

// displays a horizontal progress bar at the current cursor location
// <progress> is the value the bargraph should indicate
// <maxprogress> is the value at the end of the bargraph
// <length> is the number of LCD characters that the bargraph should cover
//adapted from AVRLIB - displays progress only for 8 bit variables
void LCDprogressBar(uint8_t progress, uint8_t maxprogress, uint8_t length);
#endif

#endif

