/*
 * Practica6_3.c
 *
 * Created: 18/04/2018 11:21:28 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Tiempo_Inicial 400 //us
#define Tiempo_Final 2000 //us
void Posicion_Servomotor_0(uint8_t);
void Posicion_Servomotor_2(uint8_t);
int main(void)
{
	cli();
	DDRB=(0<<DDB7)|(0<<DDB6)|(0<<DDB5)|(0<<DDB4)|(1<<DDB3)|(0<<DDB2)|(0<<DDB1)|(0<<DDB0);//PB3 es OC0.
	DDRD=(1<<DDD7)|(0<<DDD6)|(0<<DDD5)|(0<<DDD4)|(0<<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);//PD7 es OC2.
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(1<<WGM00)|(1<<COM01)|(1<<COM00)|(0<<WGM01)|(0<<CS02)|(1<<CS01)|(1<<CS00);//Comparación, modo PWM Phase Correct,0C0 Conectado,prescalador a 64.
	TCNT0=0x00;
	OCR0=0x00;
	//Configuración Timer2
	TCCR2=(0<<FOC2)|(1<<WGM20)|(1<<COM21)|(1<<COM20)|(0<<WGM21)|(0<<CS22)|(1<<CS21)|(1<<CS20);//Comparación, modo PWM Phase Correct,0C2 desconectado,prescalador a 32.
	TCNT2=0x00;
	OCR2=0x00;
	//Habilitación interrupciones Timer0 y Timer2
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Interrupción por overflow de Timer 2.
	sei();
	/* Replace with your application code */
	int i;
	while (1)
	{
	  for(i=0;i<=180;i=i+5){
		  Posicion_Servomotor_0(i);
		  Posicion_Servomotor_2(i);
		  _delay_ms(500);
	  }
	  for(i=180;i>=0;i=i-5){
		  Posicion_Servomotor_0(i);
		  Posicion_Servomotor_2(i);
		  _delay_ms(500);
	  }
	}
}

void Posicion_Servomotor_0(uint8_t Grados){
     //OCR0=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/1000000*(F_CPU/(64*2));//64 es el valor del preescalador y el 2 por PWM phase correct.
       OCR0=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/128;
}

void Posicion_Servomotor_2(uint8_t Grados){
     //OCR2=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/1000000*(F_CPU/(32*2));//32 es el valor del preescalador y el 2 por PWM phase correct.
     OCR0=(Tiempo_Inicial+(Tiempo_Final-Tiempo_Inicial)*(Grados/180))/64;
}