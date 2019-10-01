/*
 * GccApplication1.c
 *
 * Created: 14/03/2018 11:47:26 a. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1600000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#define Entrada 0
#define Salida 1
#define Carga_Inicial_del_Timer_0 244
#define Tecla_Nula 0
#define Tecla_0 '0'
#define Tecla_1 '1'
#define Tecla_2 '2'
#define Tecla_3 '3'
#define Tecla_4 '4'
#define Tecla_5 '5'
#define Tecla_6 '6'
#define Tecla_7 '7'
#define Tecla_8 '8'
#define Tecla_9 '9'
#define Tecla_A 'A'
#define Tecla_B 'B'
#define Tecla_C 'C'
#define Tecla_D 'D'
#define Tecla_Num '#'
#define Tecla_Ast '*'
uint8_t Tecla_Presionada=Tecla_Nula,Ultima_Tecla_Presionada=Tecla_Nula,conteo=0;
char UTecla[4];
void Detectar_Tecla(uint8_t,uint16_t,uint16_t,uint16_t,uint16_t);
ISR(TIMER0_OVF_vect){
 TCNT0=Carga_Inicial_del_Timer_0;
 conteo++;
 if (conteo==1){
	 PORTB=0b01111111;
	 if((PIND&(1<<PIND2))==(1<<PIND2)&&(Ultima_Tecla_Presionada==Tecla_1||Ultima_Tecla_Presionada==Tecla_2||Ultima_Tecla_Presionada==Tecla_3||Ultima_Tecla_Presionada==Tecla_A)){
		 Ultima_Tecla_Presionada=Tecla_Nula;
	 }
	 //if((PIND&(1<<PIND2))==(1<<PIND2)){
		 //UTecla[0]=true;
	 //}
 } 
 else if(conteo==2){
	 PORTB=0b10111111;
	 if((PIND&(1<<PIND2))==(1<<PIND2)&&(Ultima_Tecla_Presionada==Tecla_4||Ultima_Tecla_Presionada==Tecla_5||Ultima_Tecla_Presionada==Tecla_6||Ultima_Tecla_Presionada==Tecla_B)){
		 Ultima_Tecla_Presionada=Tecla_Nula;
	 }
 }
 else if(conteo==3){
	 PORTB=0b11011111;
     if((PIND&(1<<PIND2))==(1<<PIND2)&&(Ultima_Tecla_Presionada==Tecla_7||Ultima_Tecla_Presionada==Tecla_8||Ultima_Tecla_Presionada==Tecla_9||Ultima_Tecla_Presionada==Tecla_C)){
	     Ultima_Tecla_Presionada=Tecla_Nula;
     }
 }
 else{
	 PORTB=0b11101111;
	 conteo=0;
	 if((PIND&(1<<PIND2))==(1<<PIND2)&&(Ultima_Tecla_Presionada==Tecla_Ast||Ultima_Tecla_Presionada==Tecla_0||Ultima_Tecla_Presionada==Tecla_Num||Ultima_Tecla_Presionada==Tecla_D)){
		 Ultima_Tecla_Presionada=Tecla_Nula;
	 }
 }
}
ISR(INT0_vect){
 uint8_t A=~PINB&(0X0F);
 if (conteo==1){
	 Detectar_Tecla(A,Tecla_1,Tecla_2,Tecla_3,Tecla_A); 
 }
 else if(conteo==2){
	 //Detectar_Tecla(A,Tecla_Ast,Tecla_0,Tecla_Num,Tecla_D);
	 Detectar_Tecla(A,Tecla_4,Tecla_5,Tecla_6,Tecla_B); 
 }
 else if(conteo==3){
	 Detectar_Tecla(A,Tecla_7,Tecla_8,Tecla_9,Tecla_C); 
 }
 else{
	//Detectar_Tecla(A,Tecla_4,Tecla_5,Tecla_6,Tecla_B); 
	Detectar_Tecla(A,Tecla_Ast,Tecla_0,Tecla_Num,Tecla_D); 
 }
}
void Detectar_Tecla(uint8_t var,uint16_t F1,uint16_t F2,uint16_t F3,uint16_t F4){
	if (var==0x01){
		Tecla_Presionada=F4;
		Ultima_Tecla_Presionada=F4;
	}
	else if(var==0x02){
		Tecla_Presionada=F3;
		Ultima_Tecla_Presionada=F3;
	}
	else if(var==0x04){
		Tecla_Presionada=F2;
		Ultima_Tecla_Presionada=F2;
	}
	else{
		Tecla_Presionada=F1;
		Ultima_Tecla_Presionada=F1;
	}
}
int main(void)
{
    /* Replace with your application code */
	cli();
	DDRA=(Salida<<PINA7)|(Salida<<PINA6)|(Salida<<PINA5)|(Salida<<PINA4)|(Salida<<PINA3)|(Salida<<PINA2)|(Salida<<PINA1)|(Salida<<PINA0);
	DDRB=(Salida<<PINB7)|(Salida<<PINB6)|(Salida<<PINB5)|(Salida<<PINB4)|(Entrada<<PINB3)|(Entrada<<PINB2)|(Entrada<<PINB1)|(Entrada<<PINB0);
	DDRC=(Salida<<PINC7)|(Salida<<PINC6)|(Salida<<PINC5)|(Salida<<PINC4)|(Salida<<PINC3)|(Salida<<PINC2)|(Salida<<PINC1)|(Salida<<PINC0);
    DDRD=(Entrada<<PIND7)|(Entrada<<PIND6)|(Entrada<<PIND5)|(Entrada<<PIND4)|(Entrada<<PIND3)|(Entrada<<PIND2)|(Entrada<<PIND1)|(Entrada<<PIND0);
	PORTB=0b11101111;//Activar pullup en puerto B;
    PORTD=0xFF;//Activar pullup en puerto D;
	//Configuracion del Timer0 como 50ms;
	TCCR0=(0<<FOC0)|(0<<WGM00)|(0<<COM01)|(0<<COM00)|(0<<WGM01)|(0<<CS02)|(1<<CS01)|(1<<CS00);//Modo Normal y Prescalador a 1024.
	TIMSK=(0<<OCIE2)|(0<<TOIE2)|(0<<TICIE1)|(0<<OCIE1A)|(0<<OCIE1B)|(0<<TOIE1)|(0<<OCIE0)|(1<<TOIE0);//Interrupción solo por Overflow del Timer0.
	TCNT0=Carga_Inicial_del_Timer_0;
	//Configuración de Int0;
	MCUCR=(0<<SM2)|(0<<SE)|(0<<SM1)|(0<<SM0)|(0<<ISC11)|(0<<ISC10)|(1<<ISC01)|(0<<ISC00);//Configuracion Flancos de bajada en INT0.
	GICR=(0<<INT1)|(1<<INT0)|(0<<INT2)|(0<<4)|(0<<3)|(0<<INT2)|(0<<IVSEL)|(0<<IVCE);//Habilitar Interrupcion por INT0.
	//Habilitar una interrupción global
	sei();
	while (1) 
    {
		PORTC=Tecla_Presionada;
		PORTA=Ultima_Tecla_Presionada;
    }
}

