/*
 * Practica6_4.c
 *
 * Created: 19/04/2018 12:17:13 a. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
void Velocidad_Motor(uint8_t);
int main(void)
{
	cli();
	DDRB=(0<<DDB7)|(0<<DDB6)|(0<<DDB5)|(0<<DDB4)|(1<<DDB3)|(0<<DDB2)|(0<<DDB1)|(0<<DDB0);//PB3 es OC0.
	DDRD=(1<<DDD7)|(0<<DDD6)|(0<<DDD5)|(0<<DDD4)|(0<<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);//PD7 es OC2.
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(1<<WGM00)|(1<<COM01)|(1<<COM00)|(0<<WGM01)|(1<<CS02)|(0<<CS01)|(1<<CS00);//Comparación, modo PWM Phase Correct,0C0 Conectado,prescalador a 256.
	TCNT0=0x00;
	OCR0=0x00;
	//Habilitación interrupciones
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Sin Interrupciones.
	sei();
	/* Replace with your application code */
	int i;
	while (1)
	{
		for(i=0;i<=255;i=i+1){
			Velocidad_Motor(i);
			_delay_ms(50);
		}
		for(i=180;i>=0;i=i-5){
			Velocidad_Motor(i);
			_delay_ms(50);
		}
	}
}

void Velocidad_Motor(uint8_t Velocidad){
	OCR0=Velocidad;
}