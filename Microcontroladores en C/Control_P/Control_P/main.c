/*
 * Control_P.c
 *
 * Created: 12/06/2018 09:52:21 a. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000UL
#include <util/delay.h>
#include <avr/io.h>
#include <math.h>
#include <avr/interrupt.h>

void Calcular_Referencia(uint8_t);
void Presionar_Numero(uint8_t Tecla);
uint8_t Contador_Digito,Digito1,Digito2,Digito3,Direccion;
uint8_t Referencia=80,Contador_Posicion=0;
uint8_t Valor_ADC;
uint16_t Posicion;
float Error,U;
float k=4;
#define Margen_Error 3
#define Valor_Inicial_PWM 25

void Giro_motor(void);


void Calcular_Referencia(uint8_t Posicion)//Función que cálcula y válida el número ingresado por dígitos.
{
	if (Posicion<=255){//Si es menor a 360 cambia la referencia a esa posición y lo indica en el display.
		Referencia=Posicion*160/255;
	}
}

ISR(INT0_vect){//Interrupción para detectar un cambio de posición
	if (PIND&(1<<PIND1))//Verifica si giro en Sentido Horario.
	{	Direccion=1;//Giro Horario
		if (Contador_Posicion==160){Contador_Posicion=0;}//Como el motor posee 160 divisiones de posición al sobrepasarlas regresa a 0.
		else{Contador_Posicion++;}//Incrementa su posición en 1.
	}
	else//Giro Antihorario
	{	Direccion=0;
		if (Contador_Posicion==0){Contador_Posicion=160;}//Como el motor posee 160 divisiones de posición al llegar a 0 regresa a 160.
		else{Contador_Posicion--;}}//Decrementa su posición en 1.
}

uint8_t Leer_ADC(){
	ADCSRA=(1<<ADEN)|(1<<ADSC)|(0<<ADATE)|(0<<ADIF)|(0<<ADIE)|(0<<ADPS2)|(0<<ADPS1)|(4<<ADPS0);
	while(ADCSRA==((1<<ADEN)|(1<<ADSC)|(0<<ADATE)|(0<<ADIF)|(0<<ADIE)|(0<<ADPS2)|(0<<ADPS1)|(4<<ADPS0))){}
	return ADCH;
}
int main(void)
{
	cli();//Impide interrupciones
	DDRB=(1<<PB7)|(1<<PB6)|(1<<PB5);//Pines de PWM
	DDRD=(0<<PIND7)|(0<<PIND6)|(0<<PIND5)|(0<<PIND4)|(0<<PIND3)|(0<<PIND2)|(0<<PIND1)|(0<<PIND0);//Pines para la entrada del motor.
	PORTD=0x07;//Activar pullup en para entradas de motor;
	DDRK=0xFF;
	//Configurar Timer0 en modo CTC a 1ms
	TCCR0A=(0<<COM0A1)|(0<<COM0A0)|(0<<COM0B1)|(0<<COM0B0)|(0<<3)|(0<<2)|(1<<WGM01)|(0<<WGM00);//Desconectar OC0A y Modo CTC.
	TCCR0B=(0<<FOC0A)|(0<<FOC0B)|(0<<5)|(0<<4)|(0<<WGM02)|(1<<CS02)|(0<<CS01)|(0<<CS00);//Modo CTC y Prescalador a 64.
	TIMSK0=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<OCIE0B)|(0<<OCIE0A)|(0<<TOIE0);//Interrupciones solo por OCIE0A.
	TCNT0=0x00;
	OCR0A=249;
	OCR0B=0x00;
	//Configurar ADC
	ADMUX=(0<<REFS1)|(1<<REFS0)|(1<<ADLAR)|(0<<MUX4)|(0<<MUX3)|(0<<MUX2)|(0<<MUX1)|(0<<MUX0);//(AREF Conectado) REFS1:0=0, Ajustado a la izquierda(ADLAR=0), ACD0 Seleccionado MUX5:0=0.
	ADCSRA=(1<<ADEN)|(0<<ADSC)|(0<<ADATE)|(0<<ADIF)|(0<<ADIE)|(0<<ADPS2)|(0<<ADPS1)|(4<<ADPS0);//Activar ADC ADEN=1, Sin comenzar conversión ADSC=0,Desactivar Trigger ADATE=0, Bandera sin activar ADIF=0,Desactivar Interupción de conversión completa ADIE=0,División de 16 para ahorrar energia ADPS2:0=4
	ADCSRB=(0<<7)|(0<<ACME)|(0<<5)|(0<<4)|(0<<MUX5)|(0<<ADTS2)|(0<<ADTS1)|(0<<ADTS0);//Timer 0 Compare Match A ADTS2:0=3.
	//Solo lectura ADC,ADCH,ADCL=
	////Desactivar entradas digitales para ahorro de energia
	DIDR0=(0<<ADC7D)|(0<<ADC6D)|(0<<ADC5D)|(0<<ADC4D)|(0<<ADC3D)|(0<<ADC2D)|(0<<ADC1D)|(1<<ADC0D);
	//DIDR1=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<2)|(0<<AIN1D)|(0<<AIN0D);
	DIDR2=(0<<ADC15D)|(0<<ADC14D)|(0<<ADC13D)|(0<<ADC12D)|(0<<ADC11D)|(0<<ADC10D)|(0<<ADC9D)|(0<<ADC8D);
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
	sei();
	//Calcular_Referencia(150);
	/* Replace with your application code */
	while (1)
	{
		Valor_ADC=Leer_ADC();
	    Calcular_Referencia(Valor_ADC);
		Error=(float)Referencia-Contador_Posicion;//Calcula el Error con respecto a la referencia.
		PORTK=Contador_Posicion*255/160;
		U=k*Error;//Calculo de la parte propocional del control.
		_delay_ms(1);//Tiempo de espera de 1 ms.
		Giro_motor();//Ejecuta el giro del motor para llevarlo a la posición de referencia.
	}
}

void Giro_motor(void){
	if(U<-Margen_Error){//Giro en sentido antihorario si el error es muy grande.
		OCR1B=(uint16_t) Valor_Inicial_PWM+(U/160)*(Valor_Inicial_PWM-1023);//Calcula el valor del PWM en sentido antihorario.
		OCR1A=0;//Apaga la salida para girar en sentido antihorario.
	}
	else{//Giro en sentido horario o sin giro
		if (U>Margen_Error){//Giro en sentido horario si el error es muy grande.
			OCR1A=(uint16_t) Valor_Inicial_PWM+(U/160)*(1023-Valor_Inicial_PWM);//Calcula el valor del PWM en sentido horario.
			OCR1B=0;//Apaga la salida para girar en sentido horario.
		}
		else{//Sin giro.
			OCR1A=0;//Apaga la salida.
			OCR1B=0;//Apaga la salida.
		}
	}
}