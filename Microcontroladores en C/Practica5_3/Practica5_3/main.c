/*
 * Practica5_3.c
 *
 * Created: 18/04/2018 05:05:30 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Carga_Inicial_T0 134;//Frecuencia de 8 Hz.
#define Carga_Inicial_T2 175;//Frecuencia de 12 Hz.
ISR(TIMER0_OVF_vect){
	TCNT0=Carga_Inicial_T0;
	PORTA=PORTA+1;
}
ISR(TIMER2_OVF_vect){
	TCNT2=Carga_Inicial_T2;
	PORTB=PORTB-1;
}
int main(void)
{
	cli();
    DDRA=(1<<DDA7)|(1<<DDA6)|(1<<DDA5)|(1<<DDA4)|(1<<DDA3)|(1<<DDA2)|(1<<DDA1)|(1<<DDA0);//Todo el Puerto A es salida.
	DDRB=(1<<DDB7)|(1<<DDB6)|(1<<DDB5)|(1<<DDB4)|(1<<DDB3)|(1<<DDB2)|(1<<DDB1)|(1<<DDB0);//Todo el Puerto B es salida.
	
	PORTA=(0<<PA7)|(0<<PA6)|(0<<PA5)|(0<<PA4)|(0<<PA3)|(0<<PA2)|(0<<PA1)|(1<<PA0);//Valor Inicial del puerto A.
	PORTB=(0<<PB7)|(0<<PB6)|(0<<PB5)|(0<<PB4)|(0<<PB3)|(0<<PB2)|(0<<PB1)|(1<<PB0);//Valor Inicial del puerto B.
	//Configuración Timer0
	TCCR0=(0<<FOC0)|(0<<WGM00)|(0<<COM01)|(0<<COM00)|(0<<WGM01)|(1<<CS02)|(0<<CS01)|(1<<CS00);//Sin comparación, modo normal,0C0 desconectado,prescalador a 1024.
	TCNT0=Carga_Inicial_T0;
	OCR0=0X00;
	//Configuración Timer2
	TCCR2=(0<<FOC2)|(0<<WGM20)|(0<<COM21)|(0<<COM20)|(0<<WGM21)|(1<<CS22)|(1<<CS21)|(1<<CS20);//Sin comparación, modo normal,0C2 desconectado,prescalador a 1024.
	TCNT2=Carga_Inicial_T2;
	OCR2=0X00;
	//Habilitar las interrupciones
	TIMSK=(0<<OCIE2)|(1<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(1<<TOIE0);//Interrupción por overflow de Timer 0 y Timer 2.
	sei();
	/* Replace with your application code */
	while (1)
	{
		
	}
}