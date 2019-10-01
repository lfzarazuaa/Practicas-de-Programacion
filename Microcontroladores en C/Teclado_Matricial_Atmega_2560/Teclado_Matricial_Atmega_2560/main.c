/*
 * Teclado_Matricial_Atmega_2560.c
 *
 * Created: 14/03/2018 10:09:19 p. m.
 * Author : LuisFernando
 */ 
#define PR_LCD_RS	PORTF 	//define MCU pin connected to LCD RS
#define DR_LCD_RS	DDRF  	//define MCU pin connected to LCD RS

#define PR_LCD_E	PORTF	//define MCU pin connected to LCD E
#define DR_LCD_E	DDRF	//define MCU pin connected to LCD E

#define PR_LCD_D4	PORTF	//define MCU pin connected to LCD D3
#define DR_LCD_D4	DDRF	//define MCU pin connected to LCD D3

#define PR_LCD_D5	PORTF	//define MCU pin connected to LCD D4
#define DR_LCD_D5	DDRF	//define MCU pin connected to LCD D4

#define PR_LCD_D6	PORTF	//define MCU pin connected to LCD D5
#define DR_LCD_D6	DDRF	//define MCU pin connected to LCD D5

#define PR_LCD_D7	PORTF	//define MCU pin connected to LCD D6
#define DR_LCD_D7	DDRF	//define MCU pin connected to LCD D6

#define LCD_RS	0 	//define MCU pin connected to LCD RS
#define LCD_E	1	//define MCU pin connected to LCD E
#define LCD_D4	2	//define MCU pin connected to LCD D4
#define LCD_D5	3	//define MCU pin connected to LCD D5
#define LCD_D6	4	//define MCU pin connected to LCD D6
#define LCD_D7	5	//define MCU pin connected to LCD D7

#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <lcd_lib.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define Entrada 0
#define Salida 1
#define Carga_Inicial_del_Timer_0 240
#define Tecla_Nula 235
#define Tecla_0 '0'
#define Tecla_1 '1'
#define Tecla_2 '2'
#define Tecla_3 '3'
#define Tecla_4 '4'
#define Tecla_5 '5'
#define Tecla_6 '6'
#define Tecla_7 '7'
#define Tecla_8 '8'
#define Tecla_9 '9'
#define Tecla_A 'A'
#define Tecla_B 'B'
#define Tecla_C 'C'
#define Tecla_D 'D'
#define Tecla_Num '#'
#define Tecla_Ast '*'

uint8_t Tecla_Presionada=Tecla_Nula,Ultima_Tecla_Presionada=Tecla_Nula,conteo=0;
char UTecla[4];
void Detectar_Tecla(uint8_t,uint16_t,uint16_t,uint16_t,uint16_t);
ISR(TIMER0_OVF_vect){
	TCNT0=Carga_Inicial_del_Timer_0;
	conteo++;
	if (conteo==1){
		PORTK=0b01111111;
		if((PIND&(1<<PIND0))==(1<<PIND0)&&(Ultima_Tecla_Presionada==Tecla_1||Ultima_Tecla_Presionada==Tecla_2||Ultima_Tecla_Presionada==Tecla_3||Ultima_Tecla_Presionada==Tecla_A)){
			Ultima_Tecla_Presionada=Tecla_Nula;
		}
		//if((PIND&(1<<PIND2))==(1<<PIND2)){
		//UTecla[0]=true;
		//}
	}
	else if(conteo==2){
		PORTK=0b10111111;
		if((PIND&(1<<PIND0))==(1<<PIND0)&&(Ultima_Tecla_Presionada==Tecla_4||Ultima_Tecla_Presionada==Tecla_5||Ultima_Tecla_Presionada==Tecla_6||Ultima_Tecla_Presionada==Tecla_B)){
			Ultima_Tecla_Presionada=Tecla_Nula;
		}
	}
	else if(conteo==3){
		PORTK=0b11011111;
		if((PIND&(1<<PIND0))==(1<<PIND0)&&(Ultima_Tecla_Presionada==Tecla_7||Ultima_Tecla_Presionada==Tecla_8||Ultima_Tecla_Presionada==Tecla_9||Ultima_Tecla_Presionada==Tecla_C)){
			Ultima_Tecla_Presionada=Tecla_Nula;
		}
	}
	else{
		PORTK=0b11101111;
		conteo=0;
		if((PIND&(1<<PIND0))==(1<<PIND0)&&(Ultima_Tecla_Presionada==Tecla_Ast||Ultima_Tecla_Presionada==Tecla_0||Ultima_Tecla_Presionada==Tecla_Num||Ultima_Tecla_Presionada==Tecla_D)){
			Ultima_Tecla_Presionada=Tecla_Nula;
		}
	}
}
ISR(INT0_vect){
	uint8_t A=~PINK&(0X0F);
	if (conteo==1){
		Detectar_Tecla(A,Tecla_1,Tecla_2,Tecla_3,Tecla_A);
	}
	else if(conteo==2){
		//Detectar_Tecla(A,Tecla_Ast,Tecla_0,Tecla_Num,Tecla_D);
		Detectar_Tecla(A,Tecla_4,Tecla_5,Tecla_6,Tecla_B);
	}
	else if(conteo==3){
		Detectar_Tecla(A,Tecla_7,Tecla_8,Tecla_9,Tecla_C);
	}
	else{
		//Detectar_Tecla(A,Tecla_4,Tecla_5,Tecla_6,Tecla_B);
		Detectar_Tecla(A,Tecla_Ast,Tecla_0,Tecla_Num,Tecla_D);
	}
}
void Detectar_Tecla(uint8_t var,uint16_t F1,uint16_t F2,uint16_t F3,uint16_t F4){
	if (var==0x01){
		Tecla_Presionada=F4;
		Ultima_Tecla_Presionada=F4;
	}
	else if(var==0x02){
		Tecla_Presionada=F3;
		Ultima_Tecla_Presionada=F3;
	}
	else if(var==0x04){
		Tecla_Presionada=F2;
		Ultima_Tecla_Presionada=F2;
	}
	else{
		Tecla_Presionada=F1;
		Ultima_Tecla_Presionada=F1;
	}
}
int main(void)
{
	/* Replace with your application code */
	cli();
	DDRA=(Salida<<PINA7)|(Salida<<PINA6)|(Salida<<PINA5)|(Salida<<PINA4)|(Salida<<PINA3)|(Salida<<PINA2)|(Salida<<PINA1)|(Salida<<PINA0);
	DDRK=(Salida<<PINK7)|(Salida<<PINK6)|(Salida<<PINK5)|(Salida<<PINK4)|(Entrada<<PINK3)|(Entrada<<PINK2)|(Entrada<<PINK1)|(Entrada<<PINK0);
	///DDRF=(Salida<<PINF7)|(Salida<<PINF6)|(Salida<<PINF5)|(Salida<<PINF4)|(Salida<<PINF3)|(Salida<<PINF2)|(Salida<<PINF1)|(Salida<<PINF0);
	DDRD=(Entrada<<PIND7)|(Entrada<<PIND6)|(Entrada<<PIND5)|(Entrada<<PIND4)|(Entrada<<PIND3)|(Entrada<<PIND2)|(Entrada<<PIND1)|(Entrada<<PIND0);
	PORTK=0b01111111;//Activar pullup en puerto B;
	PORTD=0x01;//Activar pullup en puerto D;
	LCDinit();
	//Configuracion del Timer0 como 50ms;
	TCCR0A=(0<<COM0A1)|(0<<COM0A0)|(0<<COM0B1)|(0<<COM0B0)|(0<<3)|(0<<2)|(0<<WGM01)|(0<<WGM00);//Modo Normal y Prescalador a 1024.
	TCCR0B=(0<<FOC0A)|(0<<FOC0B)|(0<<5)|(0<<4)|(0<<WGM02)|(0<<CS02)|(0<<CS01)|(1<<CS00);//Modo Normal y Prescalador a 1024.
	TIMSK0=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<OCIE0B)|(0<<OCIE0A)|(1<<TOIE0);//Interrupción solo por Overflow del Timer0.
	TCNT0=Carga_Inicial_del_Timer_0;
	//Configuración de Int0;
	MCUCR=(0<<JTD)|(0<<6)|(0<<5)|(0<<PUD)|(0<<3)|(0<<2)|(0<<IVSEL)|(0<<IVCE);//Configuracion Flancos de bajada en INT0.
	EIMSK=(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(0<<INT1)|(1<<INT0);//Habilitar Interrupcion por INT0.
	//Habilitar una interrupción global
	sei();
	LCDGotoXY(0,0);
	LCDsendChar('H');
	LCDsendChar('O');
	LCDsendChar('L');
	LCDsendChar('A');
	LCDsendChar(' ');
	LCDsendChar('L');
	LCDsendChar('I');
	LCDsendChar('J');
	while (1)
	{
		LCDGotoXY(8,0);
		LCDsendChar(Tecla_Presionada);
		LCDGotoXY(8,1);
		LCDsendChar(Ultima_Tecla_Presionada);
		//PORTF=Tecla_Presionada;
		PORTA=Ultima_Tecla_Presionada;
	}
}
