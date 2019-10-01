/*
 * Marquesina_doble.c
 *
 * Created: 16/03/2018 10:39:46 a. m.
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
void Mostrar_Mensaje_1(void);
void Mostrar_Mensaje_2(void);
uint8_t mensaje1[16]="Hola";
uint8_t mensaje2[16]="Luis Fernando";
uint8_t mensajeA[59]="               Eduardo Adrian Estrada Maya Eduardo Adrian ";
//uint8_t mensajeB[62]="               Instituto Politecnico Nacional Instituto Polit";
uint8_t mensajeB[66]="               Boleta:2013640233 Boleta:2013640233 Boleta:20136402";
int main(void)
{
	int r,v,cont1=14,cont2=14;
	LCDinit();
    for(v=0;v<16;v++){
	for(r=0;r<16;r++){
	   mensaje1[r]=mensajeA[r+v];
	   mensaje2[r]=mensajeB[r+v];
	 }
	 Mostrar_Mensaje_1();
	 Mostrar_Mensaje_2();
	 _delay_ms(150);
	}
	//char *__fmt var1[]="Hola";
	//printf("%c %d",var1,r);
	LCDGotoXY(0,2);
	LCDGotoXY(0,3);
    /* Replace with your application code */
    while (1) 
    {
		cont1++;
	    cont2++;
		if(cont1>59-17){
			cont1=15;
		}
		if(cont2>66-17){
			cont2=15;
		}
		for(r=0;r<16;r++){
			mensaje1[r]=mensajeA[r+cont1];
			mensaje2[r]=mensajeB[r+cont2];
		}
		Mostrar_Mensaje_1();
		Mostrar_Mensaje_2();
		_delay_ms(150);
		//LCDclr();
    }
}

void Mostrar_Mensaje_1(){
	LCDGotoXY(0,0);
	for(uint8_t i=0;i<16;i++){
		LCDsendChar(mensaje1[i]);
	}
}
void Mostrar_Mensaje_2(){
	LCDGotoXY(0,1);
	for(uint8_t i=0;i<16;i++){
		LCDsendChar(mensaje2[i]);
	}
}