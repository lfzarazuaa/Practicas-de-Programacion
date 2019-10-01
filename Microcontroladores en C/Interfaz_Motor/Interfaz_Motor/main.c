/*
 * Interfaz_Motor.c
 *
 * Created: 04/05/2018 04:51:47 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <Teclado_Mega.h>
#include <Lcd4bits_Mega.h>

void Calcular_Referencia(uint8_t Dig1,uint8_t Dig2,uint8_t Dig3);
void Presionar_Numero(uint8_t Tecla);
uint8_t Contador_Digito,Digito1,Digito2,Digito3;
uint8_t Referencia;

void Accion_Tecla_0(void){
	Presionar_Numero('0');
}
void Accion_Tecla_1(void){
	Presionar_Numero('1');
}
void Accion_Tecla_2(void){
	Presionar_Numero('2');
}
void Accion_Tecla_3(void){
	Presionar_Numero('3');
}
void Accion_Tecla_4(void){
	Presionar_Numero('4');
}
void Accion_Tecla_5(void){
	Presionar_Numero('5');
}
void Accion_Tecla_6(void){
	Presionar_Numero('6');
}
void Accion_Tecla_7(void){
	Presionar_Numero('7');
}
void Accion_Tecla_8(void){
	Presionar_Numero('8');
}
void Accion_Tecla_9(void){
	Presionar_Numero('9');
}
void Accion_Tecla_A(void){
	
}
void Accion_Tecla_B(void){
	
}
void Accion_Tecla_C(void){
	
}
void Accion_Tecla_D(void){
	
}

void Accion_Tecla_Ast(void){
	if (Contador_Digito>=3){
		Calcular_Referencia(Digito1,Digito2,Digito3);
		POS_LINEA2(1);
		ENVIA_CADENA("Dato Introducido");
		POS_LINEA1(3);
		Contador_Digito=0;
	}
}
void Accion_Tecla_Num(void){
	
}
uint16_t Posicion;
void Calcular_Referencia(uint8_t Dig1,uint8_t Dig2,uint8_t Dig3){
	 Dig1-=0x30;
	 Dig2-=0x30;
	 Dig3-=0x30;
	 Posicion=Dig1*100+Dig2*10+Dig3;
	 if (Posicion<=360)
	 {
		Referencia=Posicion*160/360; 
	 }
}

void Presionar_Numero(uint8_t Tecla){
	switch (Contador_Digito)
	{
		case 0:
		 Digito1=Tecla;
		 LIMPIA_LCD();
		 POS_LINEA2(1);
		 ENVIA_CADENA("Intro: Dato");
		 POS_LINEA1(3);
		 ENVIA_DATO(Tecla);
		break;
		case 1:
		 Digito2=Tecla;
		 POS_LINEA1(4);
		 ENVIA_DATO(Tecla);
		break;
		case 2:
		 Digito3=Tecla;
		 POS_LINEA1(5);
		 ENVIA_DATO(Tecla);
		break;
		default:
		 Contador_Digito--;
		break;
	}
	Contador_Digito++;
}

int main(void)
{
	cli();
	DDRB=(1<<PB7)|(1<<PB6);//Pines de PWM
	Inicializar_Teclado();
	LCD_INICIALIZA();
	//Configuración Timer1 PWM 10 bits phase correct
	TCCR1A=(1<<COM1A1)|(1<<COM1A0)|(1<<COM1B1)|(0<<COM1B0)|(1<<COM1C1)|(0<<COM1C0)|(1<<WGM11)|(1<<WGM10);//Phase Correct PWM 10 bits OCR1A OCR1B y OCR1C conectados.
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(0<<WGM13)|(0<<WGM12)|(0<<CS12)|(1<<CS11)|(0<<CS10);//Modo Phase Correct PWM 10 bits y Prescalador a 8.
	TCCR1C=(0<<FOC1A)|(0<<FOC1B)|(0<<FOC1C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Sin forzar comparaciones.
	TIMSK1=(0<<7)|(0<<6)|(0<<ICIE1)|(0<<4)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(0<<TOIE1);//Sin interrupciones de PWM.
	TCNT1=0x0000;
	ICR1=0x0000;
	OCR1A=0x0000;
	OCR2A=0x0000;
	OCR1C=0x0000;
	Referencia=80;
	//Configuración Interrupciones Externas
	  
	//
	LIMPIA_LCD();
	POS_LINEA2(1);
	ENVIA_CADENA("Intro: Dato");
	POS_LINEA1(3);
	sei();
    /* Replace with your application code */
    while (1) 
    {
		
    }
}