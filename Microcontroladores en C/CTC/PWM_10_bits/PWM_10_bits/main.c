/*
 * PWM_10_bits.c
 *
 * Created: 28/03/2018 10:05:01 a. m.
 * Author : LuisFernando
 */ 

#include <avr/io.h>
#define F_CPU 16000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
int main(void)
{
	uint8_t cont=0;
	DDRB=(1<<PB7)|(1<<PB6)|(1<<PB5);
	DDRL=(1<<PL5)|(1<<PL4)|(1<<PL3);
	//PORTB=(0<<PB7)|(0<<PB6);
	//PORTL=(0<<PL5)|(0<<PL4)|(0<<PL3);
	//Configuracion Timer 1 en CTC
	TCCR1A=(0<<COM1A1)|(1<<COM1A0)|(0<<COM1B1)|(1<<COM1B0)|(0<<COM1C1)|(1<<COM1C0)|(0<<WGM11)|(0<<WGM10);//Conectar OC1A y Modo CTC.
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(0<<WGM13)|(1<<WGM12)|(0<<CS12)|(0<<CS11)|(1<<CS10);//Modo CTC y Prescalador a 1.
	TCCR1C=(0<<FOC1A)|(1<<FOC1B)|(1<<FOC1C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Forzar comparaciones B y C.
	TIMSK1=(0<<7)|(0<<6)|(0<<ICIE1)|(0<<4)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(0<<TOIE1);//Sin Interrupciones.
	TCNT1=0x0000;
	ICR1=0x0000;
	OCR1A=128;//66;
	OCR2A=66*2/3;
	OCR1C=66*1/3;
	//Configuración Timer 5 en modo PWM Phase Correct 10 bits
	TCCR5A=(1<<COM5A1)|(0<<COM5A0)|(1<<COM5B1)|(0<<COM5B0)|(1<<COM5C1)|(0<<COM5C0)|(1<<WGM51)|(1<<WGM50);//Conectar OC3A OC3B OC3C y Modo PWM 10 bits.
	TCCR5B=(0<<ICNC5)|(0<<ICES5)|(0<<5)|(0<<WGM53)|(0<<WGM52)|(1<<CS52)|(1<<CS51)|(0<<CS50);//Modo Nomal con fuente externa de reloj.
	TCCR5C=(0<<FOC5A)|(0<<FOC5B)|(0<<FOC5C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Sin forzar las 3 comparaciones.
	TIMSK5=(0<<7)|(0<<6)|(0<<ICIE5)|(0<<4)|(0<<OCIE5C)|(0<<OCIE5B)|(0<<OCIE5A)|(0<<TOIE5);//Sin interrupciones.
	TCNT5=0x0000;
	ICR5=0x0000;
	OCR5A=1023*7/8;
	OCR5B=1023*6/8;
	OCR5C=1023*5/8;
	/* Replace with your application code */
	while (1)
	{
		_delay_ms(10);
		OCR5A=OCR5A+1;
		if (OCR5A>900)
		{
		 PORTB^=(1<<PB7);
		 OCR5A=0;
		 cont++;
		 if (cont==1)
		 {
			 OCR1A=128;
		 }
		 //else if(cont==2)
		 //{
			 //OCR1A=255;
		 //}
		 else
		 {
			 OCR1A=66;
			 cont=0;
		 }
		} 
	}
}



