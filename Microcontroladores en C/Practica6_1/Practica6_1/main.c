/*
 * Practica6_1.c
 *
 * Created: 18/04/2018 10:40:45 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

int main(void)
{
	cli();
	DDRB=(0<<DDB7)|(0<<DDB6)|(0<<DDB5)|(0<<DDB4)|(1<<DDB3)|(0<<DDB2)|(0<<DDB1)|(0<<DDB0);
	DDRD=(1<<DDD7)|(0<<DDD6)|(0<<DDD5)|(0<<DDD4)|(0<<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(1<<WGM00)|(1<<COM01)|(0<<COM00)|(0<<WGM01)|(1<<CS02)|(0<<CS01)|(1<<CS00);//Comparación, modo PWM Phase Correct,0C1 Conectado,prescalador a 64.
	TCNT0=0x00;
	OCR0=128;
	//Configuración Timer2
	TCCR2=(0<<FOC2)|(1<<WGM20)|(1<<COM21)|(1<<COM20)|(0<<WGM21)|(0<<CS22)|(1<<CS21)|(1<<CS20);//Comparación, modo PWM Phase Correct,0C2 desconectado,prescalador a 32.
	TCNT2=0x00;
	OCR2=220;
	//Habilitación interrupciones Timer0 y Timer2
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Interrupción por overflow de Timer 2.
	sei();
	/* Replace with your application code */
	while (1)
	{
		
	}
}

