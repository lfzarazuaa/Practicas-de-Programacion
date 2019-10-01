/*
 * Practica6_2.c
 *
 * Created: 18/04/2018 10:52:35 p. m.
 * Author : LuisFernando
 */ 


#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Inc0 2
#define Inc2 2
ISR(INT0_vect){
   if (OCR0<(256-Inc0)){OCR0=OCR0+Inc0;}
   else{OCR0=255;}
   if (OCR2<(256-Inc2)){OCR2=OCR2+Inc2;}
   else{OCR2=255;}
}
ISR(INT1_vect){
  if (OCR0>(Inc0)){OCR0=OCR0-Inc0;}
  else{OCR0=0;}
  if (OCR2>(Inc2)){OCR2=OCR2-Inc2;}
  else{OCR2=0;}
}
int main(void)
{
	cli();
	DDRB=(0<<DDB7)|(0<<DDB6)|(0<<DDB5)|(0<<DDB4)|(1<<DDB3)|(0<<DDB2)|(0<<DDB1)|(0<<DDB0);//PB3 es OC0.
	DDRD=(1<<DDD7)|(0<<DDD6)|(0<<DDD5)|(0<<DDD4)|(0<<DDD3)|(0<<DDD2)|(0<<DDD1)|(0<<DDD0);//PD7 es OC2, PD2 es Int0, PD3 es Int1.
    //Configuración Int0 e Int1
	PORTD=(0<<PD7)|(0<<PD6)|(0<<PD5)|(0<<PD4)|(1<<PD3)|(1<<PD2)|(0<<PD1)|(0<<PD0);//Activar pullup en PD2 y PD3.
	MCUCR=(0<<SM2)|(0<<SE)|(0<<SM1)|(0<<SM0)|(1<<ISC11)|(0<<ISC10)|(1<<ISC01)|(0<<ISC00);//Int0 e Int1 en flanco de bajada.
	GICR=(1<<INT1)|(1<<INT0)|(0<<INT2)|(0<<4)|(0<<3)|(0<<2)|(0<<IVSEL)|(0<<IVCE);//Activar Interrupciones por INT0 e INT1.
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(1<<WGM00)|(1<<COM01)|(0<<COM00)|(0<<WGM01)|(1<<CS02)|(0<<CS01)|(1<<CS00);//Comparación, modo PWM Phase Correct,0C0 Conectado,prescalador a 64.
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


