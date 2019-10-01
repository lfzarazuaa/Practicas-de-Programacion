/*
 * Ejercicio_1.c
 *
 * Created: 21/02/2018 09:40:59 p. m.
 * Author : LuisFernando
 */
#define F_CPU 16000000UL
#include <avr/io.h>;
#define DDR1E DDRF
#define DDR2E DDRK
#define PORT1E PORTF
#define PORT2E PORTK
#define PIN1E PINF
#define PIN2E PINK

#include <util/delay.h>
void Ejercicio_0(void);
void Ejercicio_1(void);
void Ejercicio_2(void);
void Ejercicio_3(void);
void Ejercicio_4(void);
void Ejercicio_5(void);
void Ejercicio_6(void);

int main(void)
{
    DDR1E=0x00;//Declara como entrada el registro.
	DDR2E=0xFF;//Declara como salida el registro.
	/* Replace with your application code */
    while (1) 
    {
    // _delay_ms(5000);
     Ejercicio_5();
	 /*_delay_ms(5000);
	 Ejercicio_2();
	 _delay_ms(5000);
	 Ejercicio_3();
	 _delay_ms(5000);
	 Ejercicio_4();
	 _delay_ms(5000);
	 Ejercicio_5();
	 _delay_ms(5000);
	 Ejercicio_6();
	 _delay_ms(5000);*/
	}
}
void Ejercicio_0(void){
	PORT2E=PIN1E;
}
void Ejercicio_1(void){
    PORT2E=PIN1E+PIN1E+PIN1E;	
}
void Ejercicio_2(void){
	PORT2E=3*PIN1E;
}
void Ejercicio_3(void){
	PORT2E=PORT1E|0b11110000;
}
void Ejercicio_4(void){
	PORT2E=PORT1E&0b01010101;
}
void Ejercicio_5(void){
	PORT2E=((PIN1E&0x0F)<<4)|((PIN1E&0xF0)>>4);	
}
void Ejercicio_6(void){
	PORT2E=(PIN1E&0x0F)<<1;
}