/*
 * Control_Motor.c
 *
 * Created: 04/05/2018 06:25:07 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000UL
#include <avr/io.h>
#include <math.h>
#include <avr/interrupt.h>
#include <Teclado_Mega.h>
#include <Lcd4bits_Mega.h>

void Calcular_Referencia(uint8_t Dig1,uint8_t Dig2,uint8_t Dig3);
void Presionar_Numero(uint8_t Tecla);
uint8_t Contador_Digito,Digito1,Digito2,Digito3,Direccion;
uint8_t Referencia=90,Contador_Posicion=0;
uint16_t Posicion;
float Error,U;
float k=1;
#define Margen_Error 0
#define Valor_Inicial_PWM 25
char Decimal[3];

void Giro_motor(void);
void Obtener_Decimal(uint8_t Valor_Leido);
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
		Contador_Digito=0;
	}
}
void Accion_Tecla_Num(void){
	
}

void Calcular_Referencia(uint8_t Dig1,uint8_t Dig2,uint8_t Dig3){
	Dig1-=0x30;
	Dig2-=0x30;
	Dig3-=0x30;
	Posicion=Dig1*100+Dig2*10+Dig3;
	if (Posicion<=360)
	{
		Referencia=Posicion*160/360;
		POS_LINEA2(1);
		ENVIA_CADENA("Dato Introducido");
		POS_LINEA1(3);
	}
	else{
		POS_LINEA2(1);
		ENVIA_CADENA("Dato Erroneo");
		POS_LINEA1(3);
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

ISR(INT0_vect){
   if (PIND&(1<<PIND1)){
	   Direccion=1;
	   if (Contador_Posicion==160){Contador_Posicion=0;}
	   else{Contador_Posicion++;}
   } 
   else{
	   Direccion=0;
	   if (Contador_Posicion==0){Contador_Posicion=160;}
	   else{Contador_Posicion--;}
   }
}

int main(void)
{
	cli();
	DDRB=(1<<PB7)|(1<<PB6)|(1<<PB5);//Pines de PWM
	DDRD=(0<<PIND7)|(0<<PIND6)|(0<<PIND5)|(0<<PIND4)|(0<<PIND3)|(0<<PIND2)|(0<<PIND1)|(0<<PIND0);
	PORTD=0x07;//Activar pullup en para entradas de motor;
	Inicializar_Teclado();
	LCD_INICIALIZA();
	//Configuración Timer1 PWM 10 bits phase correct
	TCCR1A=(1<<COM1A1)|(0<<COM1A0)|(1<<COM1B1)|(0<<COM1B0)|(1<<COM1C1)|(0<<COM1C0)|(1<<WGM11)|(1<<WGM10);//Phase Correct PWM 10 bits OCR1A OCR1B y OCR1C conectados.
	TCCR1B=(0<<ICNC1)|(0<<ICES1)|(0<<5)|(0<<WGM13)|(0<<WGM12)|(0<<CS12)|(1<<CS11)|(0<<CS10);//Modo Phase Correct PWM 10 bits y Prescalador a 8.
	TCCR1C=(0<<FOC1A)|(0<<FOC1B)|(0<<FOC1C)|(0<<4)|(0<<3)|(0<<2)|(0<<1)|(0<<0);//Sin forzar comparaciones.
	TIMSK1=(0<<7)|(0<<6)|(0<<ICIE1)|(0<<4)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(0<<TOIE1);//Sin interrupciones de PWM.
	TCNT1=0x0000;
	ICR1=0x0000;
	OCR1A=0x0000;
	OCR2A=0x0000;
	OCR1C=0x0000;
	//Referencia=80;
	//Configuración de Int0 para lectura de motor;
	MCUCR=(0<<JTD)|(0<<6)|(0<<5)|(0<<PUD)|(0<<3)|(0<<2)|(0<<IVSEL)|(0<<IVCE);
	EICRA=(0<<ISC31)|(0<<ISC30)|(0<<ISC21)|(0<<ISC20)|(0<<ISC11)|(0<<ISC10)|(1<<ISC01)|(1<<ISC00);//Configuración Flancos de subida en INT0 e INT1.
	EIMSK=(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(0<<INT1)|(1<<INT0);//Habilitar Interrupcion por INT0.
	//
	LIMPIA_LCD();
	POS_LINEA2(1);
	ENVIA_CADENA("Intro: Dato");
	POS_LINEA1(3);
	sei();
	//int i;
	/* Replace with your application code */
	while (1)
	{
	  Error=(float)Referencia-Contador_Posicion;
	  U=k*Error;
	  _delay_ms(1);
	  Giro_motor();
	  //Obtener_Decimal(Contador_Posicion);
	  //POS_LINEA1(7);
	  //for (i=0;i<3;i++){
		  //ENVIA_DATO(Decimal[i]);
	  //}
	  //_delay_ms(5);
	}
}

void Giro_motor(void){
	///Marcar límites del error.
	//if (U>160){U=160;}
	//else if (U<-160){U=-160;}
	//Determina el valor del PWM y el Giro.
	//if(U>32767){//Giro en sentido horario
	//	OCR1A=5;//(uint16_t) Valor_Inicial_PWM+(Ux/160)*(1023-Valor_Inicial_PWM);
	//	OCR1B=0;
	//}
	if(U<-Margen_Error){//Giro en sentido antihorario
		OCR1B=(uint16_t) Valor_Inicial_PWM+(U/160)*(Valor_Inicial_PWM-1023);
		OCR1A=0;
	}
	else{//No gira
		if (U>Margen_Error)
		{
		 OCR1A=(uint16_t) Valor_Inicial_PWM+(U/160)*(1023-Valor_Inicial_PWM);
		 OCR1B=0;
		} 
		else
		{
			OCR1A=0;
			OCR1B=0;
		}
		
	}
}

void Obtener_Decimal(uint8_t Valor_Leido){
	uint8_t i;
	for (i = 0; i <3; i++){
		Decimal[i]=0x30;
	}
	while(Valor_Leido>=100){
		Valor_Leido-=100;
		Decimal[0]++;
	}
	while(Valor_Leido>=10){
		Valor_Leido-=10;
		Decimal[1]++;
	}
	Decimal[2]=0x30+Valor_Leido;
}