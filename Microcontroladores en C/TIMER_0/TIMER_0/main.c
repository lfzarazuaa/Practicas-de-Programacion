/*
 * TIMER_0.c
 *
 * Created: 09/03/2018 12:05:41 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 16000000UL	
#include <avr/io.h>
#include <avr/interrupt.h>
uint8_t cont=0;
uint16_t cont1=0;
ISR(TIMER0_OVF_vect){
   TCNT0=12;
   cont++;
   if(cont>25){
	 cont=0;
	 PORTB=PORTB^((1<<PB0));//Toggle.  
   }
}
//ISR(TIMER1_OVF_vect){
	//TCNT1=0x0001;
	//cont1++;
	//if(cont1>25){
		//cont1=0;
		//PORTB=PORTB^((1<<PB5));//Toggle.
	//}
//}
int main(void)
{
    /* Replace with your application code */
	DDRB|=(1<<PB5)|(1<<PB0);
	TCCR0A|=(1<<CS00);
	TCCR0B|=(1<<CS02);
	TIMSK0|=(1<<TOIE0);
	//TCCR1A|=;
	//TCCR1B|=;
	//TCCR1C|=;
	//TIMSK1|=;
	
	sei();
    while (1) 
    {
		
    }
}

