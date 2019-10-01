/*
 * Practica5_2.c
 *
 * Created: 19/04/2018 12:44:08 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Carga_Inicial 34286;//Carga inicial para oscilar a 4Hz.
ISR(TIMER1_OVF_vect){
	TCNT1=Carga_Inicial;
	if(PORTB>=0x80){
	PORTB=(PORTB<<1)|0x01;}
	else{
	PORTB=PORTB<<1;}
}
int main(void)
{
	cli();
	DDRB=(1<<DDB7)|(1<<DDB6)|(1<<DDB5)|(1<<DDB4)|(1<<DDB3)|(1<<DDB2)|(1<<DDB1)|(1<<DDB0);//Todo el puerto es salida
	PORTB=(0<<PB7)|(0<<PB6)|(1<<PB5)|(1<<PB4)|(0<<PB3)|(0<<PB2)|(0<<PB1)|(1<<PB0);//Valor inicial de 10110001
	//Configuración del Timer 1
	TCCR1A=(0<<COM1A1)|(0<<COM1A0)|(0<<COM1B1)|(0<<COM1B0)|(0<<FOC1A)|(0<<FOC1B)|(0<<WGM11)|(0<<WGM10);//Sin comparación, modo normal,0C2 desconectado,
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(0<<WGM13)|(0<<WGM12)|(0<<CS12)|(1<<CS11)|(0<<CS10);//prescalador a 8.
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(1<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Interrupción por overflow de Timer 1.
	TCNT1=Carga_Inicial;
	OCR1A=0X00;
	sei();
	/* Replace with your application code */
	while (1)
	{
		
	}
}


