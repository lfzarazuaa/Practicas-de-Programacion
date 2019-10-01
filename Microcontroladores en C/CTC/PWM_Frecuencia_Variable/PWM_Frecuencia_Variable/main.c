/*
 * PWM_Frecuencia_Variable.c
 *
 * Created: 27/03/2018 01:13:02 p. m.
 * Author : LuisFernando
 */ 

#include <avr/io.h>
#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
//Interrupcion del Timer por flanco externo
ISR(TIMER1_COMPA_vect){
	PORTB^=(1<<PB7)|(1<<PB6);//Alternar puerto B.
}
ISR(TIMER1_COMPB_vect){
	PORTB^=(1<<PB6);//Alternar puerto B.
}
ISR(TIMER1_COMPC_vect){
	PORTB^=(1<<PB7);//Alternar puerto B.
}
//Interrupcion del Timer
ISR(TIMER4_OVF_vect){
	PORTL^=(1<<PL5)|(1<<PL4)|(1<<PL3);//Alternar puerto E.
	//TCNT5=64512;//0xFC00.
    TCNT4H=0xFC;//0XFC00
    TCNT4L=0x00;
}
ISR(TIMER5_COMPA_vect){
	PORTL^=(1<<PL3);//Alternar puerto E.
}
ISR(TIMER5_COMPB_vect){
	PORTL^=(1<<PL4);//Alternar puerto E.
}
ISR(TIMER5_COMPC_vect){
	PORTL^=(1<<PL5);//Alternar puerto E.
}
int main(void)
{
	DDRB=(1<<PB7)|(1<<PB6)|(1<<PB5);
	DDRL=(1<<PL5)|(1<<PL4)|(1<<PL3);
	PORTB=(0<<PB7)|(0<<PB6);
	PORTL=(0<<PL5)|(0<<PL4)|(0<<PL3);
	//Configuracion Timer 1 en CTC
	TCCR1A=(0<<COM1A1)|(1<<COM1A0)|(0<<COM1B1)|(0<<COM1B0)|(0<<COM1C1)|(0<<COM1C0)|(0<<WGM11)|(0<<WGM10);//Conectar OC1A y Modo CTC.
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(0<<WGM13)|(1<<WGM12)|(0<<CS12)|(0<<CS11)|(1<<CS10);//Modo CTC y Prescalador a 1.
	TCCR1C=(0<<FOC1A)|(1<<FOC1B)|(1<<FOC1C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Forzar comparaciones B y C.
	TIMSK1=(0<<7)|(0<<6)|(0<<ICIE1)|(0<<4)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(0<<TOIE1);//Interrupcion por comparacion.
	TCNT1=0x0000;
	ICR1=0x0000;
	OCR1A=66;
	OCR2A=66*2/3;
	OCR1C=66*1/3;
	//Configuración Timer 5 en modo Normal
	TCCR5A=(0<<COM5A1)|(0<<COM5A0)|(0<<COM5B1)|(0<<COM5B0)|(0<<COM5C1)|(0<<COM5C0)|(0<<WGM51)|(0<<WGM50);//DesConectar OC3A OC3B OC3C y Modo Normal.
	TCCR5B=(0<<ICNC5)|(0<<ICES5)|(0<<5)|(0<<WGM53)|(0<<WGM52)|(0<<CS52)|(1<<CS51)|(0<<CS50);//Modo Nomal con fuente externa de reloj.
	TCCR5C=(1<<FOC5A)|(1<<FOC5B)|(1<<FOC5C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Forzar las 3 comparaciones.
	TIMSK5=(0<<7)|(0<<6)|(0<<ICIE5)|(0<<4)|(1<<OCIE5C)|(1<<OCIE5B)|(1<<OCIE5A)|(1<<TOIE5);//Interrupción por desbordamiento.
	//TCNT5=64512;//0XFC00
	TCNT5H=0xFC;//0XFC00
	TCNT5L=0x00;
	ICR5=0x0000;
	OCR5A=64512+(65535-64512)*3/4;
	OCR5B=64512+(65535-64512)*2/4;
	OCR5C=64512+(65535-64512)*1/4;
	sei();
	/* Replace with your application code */
	while (1)
	{
	 //TCNT5=65534;//0XFC00
	}
}

