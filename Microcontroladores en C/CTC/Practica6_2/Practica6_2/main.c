/*
 * Practica6_2.c
 *
 * Created: 19/04/2018 09:38:11 a. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Tiempo_Inicial 400 //us
#define Tiempo_Final 2000 //us
void Posicion_Servomotor_1(uint8_t);
int main(void)
{
	int i;
	cli();
	DDRB=(0<<DDB7)|(0<<DDB6)|(0<<DDB5)|(0<<DDB4)|(1<<DDB3)|(0<<DDB2)|(0<<DDB1)|(0<<DDB0);//PB3 es OC0.
	DDRD=(0<<DDD7)|(0<<DDD6)|(0<<DDD5)|(1<<DDD4)|(0<<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);//PD4 es OC1B.
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(1<<WGM00)|(1<<COM01)|(0<<COM00)|(0<<WGM01)|(1<<CS02)|(0<<CS01)|(1<<CS00);//Comparación, modo PWM Phase Correct,0C0 Conectado,prescalador a 64.
	TCNT0=0x00;
	OCR0=128;
	//Configuración Timer1
	TCCR1A=(0<<COM1A1)|(0<<COM1A0)|(1<<COM1B1)|(0<<COM1B0)|(0<<FOC1A)|(0<<FOC1B)|(0<<WGM11)|(1<<WGM10);//Con comparación, modo PWM Phase and Frecuency Correct,0C1A desconectado y OC1B Conectado.
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(1<<WGM13)|(0<<WGM12)|(0<<CS12)|(0<<CS11)|(1<<CS10);//prescalador a 8.
	TCNT1=0x0000;
	OCR1A=10000;
	OCR1B=0x00;
	//Habilitación interrupciones Timer0 y Timer1
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Sin Interrupciones.
	sei();
	/* Replace with your application code */
	while (1)
	{
	   for(i=0;i<=180;i=i+5){
		   Posicion_Servomotor_1(i);
		   _delay_ms(500);
	   }
	   for(i=180;i>=0;i=i-5){
		   Posicion_Servomotor_1(i);
		   _delay_ms(500);
	   }
	}
}

void Posicion_Servomotor_1(uint8_t Grados){
	//OCR0=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/1000000*(F_CPU/(64*2));//64 es el valor del preescalador y el 2 por PWM phase correct.
	OCR0=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/2;
}