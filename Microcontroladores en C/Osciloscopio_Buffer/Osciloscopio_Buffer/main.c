/*
 * Osciloscopio_Buffer.c
 *
 * Created: 25/05/2018 10:58:22 p. m.
 * Author : LuisFernando
 */ 

/*
 * Osciloscopio_USART.c
 *
 * Created: 24/05/2018 09:32:13 p. m.
 * Author : LuisFernando
 */ 

#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
uint16_t Valor_ADC=0;
uint8_t Digito[4];
uint8_t Buffer[20];
uint8_t cont=0,cont2=0;

void Obtener_Digitos(uint16_t X){
	Digito[1]=0;
	Digito[2]=0;
	if (X>=1000){
	    X-=1000;
		Digito[0]='1';} 
	else{Digito[0]='0';}
    while (X>=100){
	 X-=100;
	 Digito[1]++;}
	Digito[1]+='0';
	while (X>=10){
		X-=10;
		Digito[2]++;}
	Digito[2]+='0';
	Digito[3]=X+'0';
}

void Anadir_Buffer(uint8_t Dato){
	if (cont==0){
		UDR0=Dato;
		cont++;
	}
	else{
		Buffer[cont]=Dato;
		cont++;
	}
}
uint8_t bandera=0;
void Enviar_Dato(uint8_t Dato){
    while ( !( UCSR0A & (1<<UDRE0)) );
	UDR0=Dato;
}
void Enviar_ADC(){
	Enviar_Dato(Digito[0]);
	Enviar_Dato(Digito[1]);
	Enviar_Dato(Digito[2]);
	Enviar_Dato(Digito[3]);
	Enviar_Dato(10);
}
ISR(TIMER0_COMPA_vect){
	//Enviar_ADC();
	//Anadir_Buffer(Digito[0]);
	//Anadir_Buffer(Digito[1]);
	//Anadir_Buffer(Digito[2]);
	//Anadir_Buffer(Digito[3]);
	//Anadir_Buffer(',');
}

ISR(USART0_UDRE_vect){//Primero en Entrar, Primero en salir
	if (cont>0){
	   UDR0=Buffer[cont2];
	   cont2++;
	   cont--;
	}
}

ISR(ADC_vect){//ADC Conversión Completa
   Valor_ADC=ADC;
   Obtener_Digitos(Valor_ADC);
   Enviar_ADC();
}

int main(void)
{
	DDRE=(1<<1);
    //Configurar Timer0 en modo CTC a 1ms
	TCCR0A=(0<<COM0A1)|(0<<COM0A0)|(0<<COM0B1)|(0<<COM0B0)|(0<<3)|(0<<2)|(1<<WGM01)|(0<<WGM00);//Desconectar OC0A y Modo CTC.
	TCCR0B=(0<<FOC0A)|(0<<FOC0B)|(0<<5)|(0<<4)|(0<<WGM02)|(0<<CS02)|(1<<CS01)|(1<<CS00);//Modo CTC y Prescalador a 64.
	TIMSK0=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<OCIE0B)|(1<<OCIE0A)|(0<<TOIE0);//Interrupciones solo por OCIE0A.
	TCNT0=0x00;
	OCR0A=249;
	OCR0B=0x00;
	//Configurar ADC
	ADMUX=(0<<REFS1)|(1<<REFS0)|(0<<ADLAR)|(0<<MUX4)|(0<<MUX3)|(0<<MUX2)|(0<<MUX1)|(0<<MUX0);//(AREF Conectado) REFS1:0=0, Ajustado a la derecha(ADLAR=0), ACD0 Seleccionado MUX5:0=0.
	ADCSRA=(1<<ADEN)|(0<<ADSC)|(1<<ADATE)|(0<<ADIF)|(1<<ADIE)|(0<<ADPS2)|(0<<ADPS1)|(4<<ADPS0);//Activar ADC ADEN=1, Sin comenzar conversión ADSC=0,Activar Trigger ADATE=1, Bandera sin activar ADIF=0,Activar Interupción de conversión completa ADIE=1,División de 16 para ahorrar energia ADPS2:0=4
	ADCSRB=(0<<7)|(0<<ACME)|(0<<5)|(0<<4)|(0<<MUX5)|(0<<ADTS2)|(0<<ADTS1)|(3<<ADTS0);//Timer 0 Compare Match A ADTS2:0=3.
	//Solo lectura ADC,ADCH,ADCL=
	//Desactivar entradas digitales para ahorro de energia
	DIDR0=(0<<ADC7D)|(0<<ADC6D)|(0<<ADC5D)|(0<<ADC4D)|(0<<ADC3D)|(0<<ADC2D)|(0<<ADC1D)|(1<<ADC0D);
	//DIDR1=(0<<7)|(0<<6)|(0<<5)|(0<<4)|(0<<3)|(0<<2)|(0<<AIN1D)|(0<<AIN0D);
	DIDR2=(0<<ADC15D)|(0<<ADC14D)|(0<<ADC13D)|(0<<ADC12D)|(0<<ADC11D)|(0<<ADC10D)|(0<<ADC9D)|(0<<ADC8D);
	//Configurar UART
	//UDR0=
	UCSR0A=(0<<RXC0)|(0<<TXC0)|(0<<UDRE0)|(0<<FE0)|(0<<DOR0)|(0<<UPE0)|(0<<U2X0)|(0<<MPCM0);//Registros de Estado del UART.
	UCSR0B=(0<<RXCIE0)|(0<<TXCIE0)|(0<<UDRIE0)|(0<<RXEN0)|(1<<TXEN0)|(0<<UCSZ02)|(0<<RXB80)|(0<<TXB80);//Interrupcion por Transmición,
	//UMSEL (Usuart mode select),UPM(Parity Mode),USBS(Stop Bit Select),UCPOL0(Clock Polarity Only USUART)
	UCSR0C=(0<<UMSEL01)|(0<<UMSEL00)|(0<<UPM01)|(0<<UPM00)|(0<<USBS0)|(0<<UCSZ01)|(3<<UCSZ00)|(0<<UCPOL0);//UART,Paridad Par,1 bit de parada,8 datos.
	UBRR0=103;
	sei();
	/* Replace with your application code */
    while (1) 
    {
	  //_delay_ms(250);
	  //Enviar_ADC();
	 //for (uint8_t i=0x30;i<0x3A;i++){
		//_delay_ms(500);
		//Enviar_Dato(i);}
    }
}

