/*
 * Mensaje_Marq.cpp
 *
 * Created: 16/03/2018 10:52:53 a. m.
 * Author : LuisFernando
 */ 
#define F_CPU 8000000UL
#include <avr/io.h>

#define PR_LCD_RS	PORTC 	//define MCU pin connected to LCD RS
#define DR_LCD_RS	DDRC  	//define MCU pin connected to LCD RS

#define PR_LCD_E	PORTC	//define MCU pin connected to LCD E
#define DR_LCD_E	DDRC	//define MCU pin connected to LCD E

#define PR_LCD_D4	PORTC	//define MCU pin connected to LCD D3
#define DR_LCD_D4	DDRC	//define MCU pin connected to LCD D3

#define PR_LCD_D5	PORTC	//define MCU pin connected to LCD D4
#define DR_LCD_D5	DDRC	//define MCU pin connected to LCD D4

#define PR_LCD_D6	PORTC	//define MCU pin connected to LCD D5
#define DR_LCD_D6	DDRC	//define MCU pin connected to LCD D5

#define PR_LCD_D7	PORTC	//define MCU pin connected to LCD D6
#define DR_LCD_D7	DDRC	//define MCU pin connected to LCD D6

#define LCD_RS	0 	//define MCU pin connected to LCD RS
#define LCD_E	1	//define MCU pin connected to LCD E
#define LCD_D4	2	//define MCU pin connected to LCD D4
#define LCD_D5	3	//define MCU pin connected to LCD D5
#define LCD_D6	4	//define MCU pin connected to LCD D6
#define LCD_D7	5	//define MCU pin connected to LCD D7
#include <lcd_lib.h>

int main(void)
{
	uint8_t r=0;
	LCDGotoXY(0,0);
	//printf("Hola %d",r);
	LCDGotoXY(0,1);
	LCDGotoXY(0,2);
	LCDGotoXY(0,3);
	/* Replace with your application code */
	while (1)
	{
		
	}
}
