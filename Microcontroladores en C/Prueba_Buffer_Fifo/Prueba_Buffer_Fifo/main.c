/*
 * Prueba_Buffer_Fifo.c
 *
 * Created: 25/05/2018 11:23:30 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 16000000
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#define tbuffer 20
#define mbuffer tbuffer-1
uint8_t contador=0,cont1=0,cont2=0;
uint8_t i;
uint8_t Buffer[tbuffer];
void Recorrer_Buffer(){
	if (cont2>0)
	{
		for (i=0;i<cont2;i++){
		Buffer[i]=Buffer[i+cont2];}
		cont2=0;
	}
}
void Anadir_Buffer(uint8_t Dato){
	Recorrer_Buffer();
	if (cont1==0){
		PORTK=Dato;
		cont1++;
	}
	else{
		Buffer[cont1-1]=Dato;
		cont1++;
	}
}

ISR(INT0_vect){
	Anadir_Buffer(contador);
	contador++;
}

ISR(INT1_vect){
	if (cont1>1){//Hay al menos un dato en el buffer
		PORTK=Buffer[cont2];
		cont2++;
		cont1--;
	}
	else if(cont1==1)//Se terminó de enviar el dato por el modulo.
	{
		cont1--;
	}
	else if(cont1==0){
	  Recorrer_Buffer();
	}
}

int main(void)
{
    DDRD=(0<<PIND7)|(0<<PIND6)|(0<<PIND5)|(0<<PIND4)|(0<<PIND3)|(0<<PIND2)|(0<<PIND1)|(0<<PIND0);
    PORTD=0x03;//Activar pullup.
	DDRK=255;
	PORTK=0;
	//Configuración de Int0 para lectura de motor;
    MCUCR=(0<<JTD)|(0<<6)|(0<<5)|(0<<PUD)|(0<<3)|(0<<2)|(0<<IVSEL)|(0<<IVCE);
    EICRA=(0<<ISC31)|(0<<ISC30)|(0<<ISC21)|(0<<ISC20)|(1<<ISC11)|(1<<ISC10)|(1<<ISC01)|(1<<ISC00);//Configuración Flancos de subida en INT0 e INT1.
    EIMSK=(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(1<<INT1)|(1<<INT0);//Habilitar Interrupcion por Int0 e Int1.
	/* Replace with your application code */
	sei();
    while (1) 
    {
    }
}



