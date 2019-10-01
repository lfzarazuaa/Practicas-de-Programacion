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

////*************************************************************************************************
////DETERMINA LOS PUERTOS QUE CONTROLARAN CADA PIN DEL LCD - SELECT PORTS TO LCD CONTROL EACH LCD PIN
////*************************************************************************************************
//
//#define PR_LCD_RS	PORTC 	//define MCU pin connected to LCD RS
//#define DR_LCD_RS	DDRC  	//define MCU pin connected to LCD RS
//
//#define PR_LCD_E	PORTC	//define MCU pin connected to LCD E
//#define DR_LCD_E	DDRC	//define MCU pin connected to LCD E
//
//#define PR_LCD_D4	PORTD	//define MCU pin connected to LCD D3
//#define DR_LCD_D4	DDRD	//define MCU pin connected to LCD D3
//
//#define PR_LCD_D5	PORTD	//define MCU pin connected to LCD D4
//#define DR_LCD_D5	DDRD	//define MCU pin connected to LCD D4
//
//#define PR_LCD_D6	PORTB	//define MCU pin connected to LCD D5
//#define DR_LCD_D6	DDRB	//define MCU pin connected to LCD D5
//
//#define PR_LCD_D7	PORTB	//define MCU pin connected to LCD D6
//#define DR_LCD_D7	DDRB	//define MCU pin connected to LCD D6
//
////*************************************************************************************
////DETERMINA EL NUMERO DE PIN ESPECIFICADO PARA CONTROLAR EL LCD - SELECT THE PIN NUMBER
////*************************************************************************************
//
//#define LCD_RS	0 	//define MCU pin connected to LCD RS
//#define LCD_E	1	//define MCU pin connected to LCD E
//#define LCD_D4	2	//define MCU pin connected to LCD D4
//#define LCD_D5	6	//define MCU pin connected to LCD D5
//#define LCD_D6	3	//define MCU pin connected to LCD D6
//#define LCD_D7	5	//define MCU pin connected to LCD 

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


//--------------    FUNCION QUE PERMITE VISUALIZAR NUMEROS EN EL LCD  -----------------
static int LCDsendstream(char c, FILE *stream);
static FILE LCD_caracter = FDEV_SETUP_STREAM(LCDsendstream, NULL, _FDEV_SETUP_WRITE);//UBICA LA STRING DE SALIDA EN EL LCD
static int LCDsendstream(char c , FILE *stream)  //  establece en el  LCD la funcion stream
{
	LCDsendChar(c);
	return 0;
}


void LCDinit(void)
{
	DR_LCD_RS|=(1<<LCD_RS);
	DR_LCD_E|= (1<<LCD_E);
	DR_LCD_D4|=(1<<LCD_D4);
	DR_LCD_D5|=(1<<LCD_D5);
	DR_LCD_D6|=(1<<LCD_D6);
	DR_LCD_D7|=(1<<LCD_D7);

	PR_LCD_RS &=~(1<<LCD_RS);
	PR_LCD_E&=~(1<<LCD_E);
	PR_LCD_D4&=~(1<<LCD_D4);
	PR_LCD_D5&=~(1<<LCD_D5);
	PR_LCD_D6&=~(1<<LCD_D6);
	PR_LCD_D7&=~(1<<LCD_D7);
	_delay_ms(20);

	PR_LCD_RS &=~(1<<LCD_RS);

	LCDsend_nibble(0b0010);LCD_EnableCmd();_delay_ms(6);
	LCDsend_nibble(0b1000);LCD_EnableCmd();_delay_ms(7);				
	LCDsend_nibble(0b0000);LCD_EnableCmd();_delay_ms(7);				
	LCDsend_nibble(0b0101);LCD_EnableCmd();_delay_ms(7);
	LCDsend_nibble(0b0000);LCD_EnableCmd();_delay_ms(7);
	LCDsend_nibble(0b0001);LCD_EnableCmd();_delay_ms(7);
	LCDsend_nibble(0b0000);LCD_EnableCmd();_delay_ms(7);
	LCDsend_nibble(0b1100);LCD_EnableCmd();_delay_ms(7);
	//LCDsend_nibble(0b0011);LCD_EnableCmd();
	//LCDsend_nibble(0b0001);LCD_EnableCmd();
	//LCDsend_nibble(0b0011);LCD_EnableCmd();
	//LCDsend_nibble(0b0110);LCD_EnableCmd();
	
	stdout = &LCD_caracter;//  PERMITE VISUALIZAR numeros y letras en el lcd con la funcion =>  printf	
}

void LCDclr(void)
{	
	LCDsendCommand(0b00000001);//Limpiar Display 
	LCDhome();
}

void LCDhome(void)
{	
	LCDsendCommand(0b00000010);//Envia el cursor a la posicion inicial	
}

void LCDcursorOn(void)
{	
	LCDsendCommand(0b00001110);//Cursor on
}

void LCDcursorOFF(void)
{	LCDsendCommand(0b00001100);//Cursor oFF
}

void LCDcursorOnBlink(void)
{	
	LCDsendCommand(0b00001111);// Mostrar Cursor + Blink 
}

void LCDblinkOn(void)
{ 	
	LCDsendCommand(0b00001101);//Activa parpadeo //  Blink On
}

void LCDblank(void)
{	
	LCDsendCommand(0b00001000); //APAGA DISPLAY
}

void LCDvisible(void)
{	
	LCDsendCommand(0b00001100);//ENCIENDE DISPLAY	
}

void LCDwriteRight(void)
{	
	LCDsendCommand(0b00000110);//ESCRIBE DE IZQUIERDA A DERECHA 
}
void LCDwriteLeft(void)
{	
	LCDsendCommand(0b00000100);//ESCRIBE DE DERECHA A IZQUIERDA
} 

void LCDcursorLeft(uint8_t n)	//MUEVE EL CURSOR "n" POSICIONES A LA IZQUIERDA
{	
	uint8_t i=0;
	
	for (i=0;i<n;i++)
	{
		LCDsendCommand(0b00010000);//MUEVE EL CURSOR A LA IZQUIERDA  
	}
}
void LCDcursorRight(uint8_t n)	//MUEVE EL CURSOR "n" POSICIONES A LA DERECHA
{
	uint8_t i=0;
	for ( i=0;i<n;i++)
	{
		LCDsendCommand(0b00010100);//MUEVE EL CURSOR A LA DERECHA
	}
}

void LCDshiftLeft(uint8_t n)
{
	uint8_t i=0;
	for (i=0;i<n;i++)
	{
		LCDsendCommand(0b00011000);//DESPLAZA EL TXT DEL LCD A LA IZQUIERDA
	}
}

void LCDshiftRight(uint8_t n)
{
	uint8_t i=0;
	for ( i=0;i<n;i++)
	{
		LCDsendCommand(0b00011100);//DESPLAZA EL TXT DEL LCD A LA DERECHA
	}
}

void LCDstring(uint8_t* data, uint8_t nBytes)	//SALIDA DE LA STRING HACIA EL LCD
{
	register uint8_t i;
	if (!data) return;

	for(i=0; i<nBytes; i++)
	{
		LCDsendChar(data[i]);
	}
}

void LCDGotoXY(uint8_t x, uint8_t y)	//POSICIONA EL CURSOR EN X y Y
{
	register uint8_t DDRAMAddr;

	switch(y)
	{
	case 0: DDRAMAddr = LCD_LINE0_DDRAMADDR+x; break;
	case 1: DDRAMAddr = LCD_LINE1_DDRAMADDR+x; break;
	case 2: DDRAMAddr = LCD_LINE2_DDRAMADDR+x; break;
	case 3: DDRAMAddr = LCD_LINE3_DDRAMADDR+x; break;
	default: DDRAMAddr = LCD_LINE0_DDRAMADDR+x;
	}
	
	LCDsendCommand(1<<LCD_DDRAM | DDRAMAddr);
}
	
void CopyStringtoLCD(const uint8_t *FlashLoc, uint8_t x, uint8_t y)
{
	uint8_t i;

	LCDGotoXY(x,y); 

	for(i=0;(uint8_t)pgm_read_byte(&FlashLoc[i]);i++)
	{
		LCDsendChar((uint8_t)pgm_read_byte(&FlashLoc[i]));
	}
}

void LCDdefinechar(const uint8_t *pc,uint8_t char_code){
	uint8_t a, pcc;
	uint16_t i;
	a=(char_code<<3)|0x40;
	for (i=0; i<8; i++)
	{
		pcc=pgm_read_byte(&pc[i]);
		LCDsendCommand(a++);
		LCDsendChar(pcc);
	}
}

void LCDsendCommand(uint8_t Dato)
{
	PR_LCD_RS &=~(1<<LCD_RS);

	uint8_t DatAux=Dato;
	Dato>>=4;LCDsend_nibble(Dato);	LCD_EnableCmd();
	LCDsend_nibble(DatAux);LCD_EnableCmd();
}

void LCD_EnableCmd(void)
{
	PR_LCD_E |=1<<LCD_E; _delay_ms(1); PR_LCD_E&=~(1<<LCD_E);_delay_ms(1);   
}

void LCDsendChar(uint8_t Dato)
{
    PR_LCD_RS |=1<<LCD_RS;

	uint8_t DatAux=Dato;
	Dato>>=4;LCDsend_nibble(Dato);	LCD_EnableChar();
	LCDsend_nibble(DatAux);LCD_EnableChar();
}

void LCD_EnableChar(void)
{
	PR_LCD_E |=1<<LCD_E; _delay_us(100); PR_LCD_E&=~(1<<LCD_E);_delay_us(100);
}

void LCDsend_nibble(uint8_t Dat)	//ENVIA EL COMANDO AL LCD
{
	union  LCD_Dat
	{	
		struct Lcd_Bit {
			unsigned int lcd_D4:1; 
			unsigned int lcd_D5:1;  
			unsigned int lcd_D6:1; 
			unsigned int lcd_D7:1; 	
		} Bit;

		struct Lcd_Byte {
			unsigned int lcd_D; 
		} Byte;
	}LCD;

	LCD.Byte.lcd_D=Dat;

	if(LCD.Bit.lcd_D4==0)PR_LCD_D4&=~(1<<LCD_D4);   
	if(LCD.Bit.lcd_D5==0)PR_LCD_D5&=~(1<<LCD_D5);      
	if(LCD.Bit.lcd_D6==0)PR_LCD_D6&=~(1<<LCD_D6);     
	if(LCD.Bit.lcd_D7==0)PR_LCD_D7&=~(1<<LCD_D7);

	if(LCD.Bit.lcd_D4==1)PR_LCD_D4 |=1<<LCD_D4;         
	if(LCD.Bit.lcd_D5==1)PR_LCD_D5 |=1<<LCD_D5;         
	if(LCD.Bit.lcd_D6==1)PR_LCD_D6 |=1<<LCD_D6;      
	if(LCD.Bit.lcd_D7==1)PR_LCD_D7 |=1<<LCD_D7;      	
}

#if (BAR_PROGRES==1)	

void LCDprogressBar(uint8_t progress, uint8_t maxprogress, uint8_t length)
{
	uint8_t i;
	uint16_t pixelprogress;
	uint8_t c;

	// draw a progress bar displaying (progress / maxprogress)
	// starting from the current cursor position
	// with a total length of "length" characters
	// ***note, LCD chars 0-5 must be programmed as the bar characters
	// char 0 = empty ... char 5 = full

	// total pixel length of bargraph equals length*PROGRESSPIXELS_PER_CHAR;
	// pixel length of bar itself is
	pixelprogress = ((progress*(length*PROGRESSPIXELS_PER_CHAR))/maxprogress);
	
	// print exactly "length" characters
	for(i=0; i<length; i++)
	{
		// check if this is a full block, or partial or empty
		// (u16) cast is needed to avoid sign comparison warning
		if( ((i*(uint16_t)PROGRESSPIXELS_PER_CHAR)+5) > pixelprogress )
		{
			// this is a partial or empty block
			if( ((i*(uint16_t)PROGRESSPIXELS_PER_CHAR)) > pixelprogress )
			{
				// this is an empty block
				// use space character?
				c = 32;
			}
			else
			{
				// this is a partial block
				c = pixelprogress % PROGRESSPIXELS_PER_CHAR;
			}
		}
		else
		{
			// this is a full block
			c = 5;
		}
		
		// write character to display
		LCDsendChar(c);
		
	}

}	
				
#endif
