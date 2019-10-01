/*
 * Interrupcion.c
 *
 * Created: 28/02/2018 12:00:39 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
ISR(INT0_vect){
	PORTC= 0X0F;
	_delay_ms(1000);
}
ISR(INT1_vect){
	PORTC=0x55;
	_delay_ms(1000);
}
int main(void)
{
	DDRC=0xFF;//Configura el puerto C como entrada.
	DDRD=0x00;//Configura el puerto D como salida.
    PORTD |=(1<<PD2) |(1<<PD3);
	cli();
	//MCUCR |= 0x02
	MCUCR |= (0<<ISC00) | (1<<ISC01) | (0<<ISC10) | (0<<ISC11);//Habilita interrupciones 0 y 1.
	GICR= (1<<INT0) |(1<<INT1);
	sei();
	/* Replace with your application code */
    while (1) 
    {
	 PORTC=0xFF;	
    }
}

