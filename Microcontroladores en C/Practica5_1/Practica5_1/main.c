/*
 * Practica5_1.c
 *
 * Created: 18/04/2018 03:55:48 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define Carga_Inicial 12;//Carga inicial para oscilar a 4Hz.
ISR(TIMER2_OVF_vect){
   TCNT2=Carga_Inicial;
   if(PORTB>=0x80){
     PORTB=(PORTB<<1)|0x01;}
   else{
	 PORTB=PORTB<<1;}	
}
int main(void)
{
    cli();
    DDRB=(1<<DDB7)|(1<<DDB6)|(1<<DDB5)|(1<<DDB4)|(1<<DDB3)|(1<<DDB2)|(1<<DDB1)|(1<<DDB0);//Todo el puerto es salida
    PORTB=(0<<PB7)|(0<<PB6)|(0<<PB5)|(1<<PB4)|(0<<PB3)|(0<<PB2)|(0<<PB1)|(1<<PB0);//Valor inicial de 00010001.
	//Configuración del Timer 2
	TCCR2=(0<<FOC2)|(0<<WGM20)|(0<<COM21)|(0<<COM20)|(0<<WGM21)|(1<<CS22)|(1<<CS21)|(1<<CS20);//Sin comparación, modo normal,0C2 desconectado,prescalador a 1024.
    TIMSK=(0<<OCIE2)|(1<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(0<<TOIE0);//Interrupción solo por overflow de Timer 2.
    TCNT2=Carga_Inicial;
    OCR2=0X00;
    sei();
	/* Replace with your application code */
    while (1) 
    {
		
    }
}

