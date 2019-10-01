/*
 * Practica_5b.asm
 *
 *  Created: 13/05/2016 12:31:47 p. m.
 *   Author: LuisFernando
 */ 
 
 //TRANSMISION SERIAL
.org 0x000 jmp config;
.equ       Car_0='0'; Define el valor de la constante para generar un "0" en un display LCD.
.equ       Car_1='1'; Define el valor de la constante para generar un "1" en un display LCD.
.equ       Car_2='2'; Define el valor de la constante para generar un "2" en un display LCD.
.equ       Car_3='3'; Define el valor de la constante para generar un "3" en un display LCD.
.equ       Car_4='4'; Define el valor de la constante para generar un "4" en un display LCD.
.equ       Car_5='5'; Define el valor de la constante para generar un "5" en un display LCD.
.equ       Car_6='6'; Define el valor de la constante para generar un "6" en un display LCD.
.equ       Car_7='7'; Define el valor de la constante para generar un "7" en un display LCD.
.equ       Car_8='8'; Define el valor de la constante para generar un "8" en un display LCD.
.equ       Car_9='9'; Define el valor de la constante para generar un "9" en un display LCD.
.equ       Car_A='A'; Define el valor de la constante para generar la letra "A" en un display LCD.
.equ       Car_B='B'; Define el valor de la constante para generar la letra "B" en un display LCD.
.equ       Car_C='C'; Define el valor de la constante para generar la letra "C" en un display LCD.
.equ       Car_D='D'; Define el valor de la constante para generar la letra "D" en un display LCD.
.equ       Car_E='E'; Define el valor de la constante para generar la letra "E" en un display LCD.
.equ       Car_F='F'; Define el valor de la constante para generar la letra "F" en un display LCD.

.equ       ADC_Alto=0x100; Define el lugar de la RAM donde se guarda el dato.
.equ       ADC_Bajo=0x101; Define el lugar de la RAM donde se guarda el dato.
config: ldi R16, LOW(RAMEND);
        out spl, R16;
        ldi R16, HIGH(RAMEND);
        out sph, R16;
        clr R16;
		out DDRB, R16;Configura el puerto B.
        ldi R16,0x02;
        out DDRD, R16;Configura el puerto D.
		ldi R16,0x00;
        out DDRC, R16; Configura el puerto C.
		;ADC
        ldi R16,0x61; Carga 0x0C.
        sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA iZQUIERDA, CANAL 0.
        ldi R16,0x97; Carga 0x97 a R16.
        sts ADCSRA,R16;Activar ADC y prescalador de 128 desactivando ADIF.
        ldi R16,0x00; Carga 0x00 a R16.
        sts ADCSRB,R16;Desactivar Comparador de voltaje y fuentes de autotrigger del ADC.
        ldi R16,0x3C; Carga 0x3C a R16.
        sts DIDR0,R16;Activar ADC0 y ADC1.
        ;Timer 0 PWM
        ldi R16,0x08;
        sts UCSR0B, R16;Configura la transmisición sin Interrupciones, sin noveno bit y con Tx activado.
        ldi R16,0x06;
        sts UCSR0C, R16;Configura la transmisición Asincrona, sin paridad, con 1 bit de parada y 8 bits.
        clr R16;
        sts UBRR0H, R16;
        ldi R16,25;
        sts UBRR0L, R16;Configura los BAUDS a 2400 con un reloj de 1 MHz.          
		jmp inicio;

inicio: sbis pinB,0;
        jmp inicio;Regresa si el Pin0D es 0;

		ldi R16,0x97; Carga 0x87 a R16.
		sts ADCSRA,R16;Activar ADC y prescalador de 32 desactivando ADIF.
	    sbis PINB,1;Verificar que señal se eligira.
	    jmp CANAL_0;
	    jmp CANAL_1;
CANAL_0:
        ldi R16,0x60; Carga 0x70 a R16.
        sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA IZQUIERDA, CANAL 0.
		jmp Ob_Dato; 
CANAL_1:
        ldi R16,0x61; Carga 0x71 a R16.
        sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA IZQUIERDA, CANAL 1.
Ob_Dato:
        ldi R16,0xC7; Carga 0xC7 a R16.
		sts ADCSRA,R16;Activa ADSC.
Loop1:  lds R16,ADCSRA;Carga ADCSRA con ADIF a R16.
	    sbrs R16,ADIF; Verifica el bit de conversión.
		jmp Loop1;Si no esta lista la conversión regresa.
		call Retardo;
		lds R18,ADCL;Carga la parte baja del ADC a R18.
		lds R18,ADCH;Carga la parte alta del ADC a R18.
		mov R16,R18;Guarda el valor del ADC en R16.
        andi R16,0x0F;
		call Decodificar;
		sts ADC_Bajo,R16;Guarda el ASCCI del ADC_Bajo(Nibble 0 de ADCH).
		mov R16,R18;Guarda el valor del ADC en R16.
        andi R16,0xF0;
		swap R16;
		call Decodificar;
		sts ADC_Alto,R16;Guarda el ASCCI del ADC_Alto(Nibble 1 de ADCH).
		lds R16,ADC_Alto;
        call trans;Envia el dato por el puerto serial(Nibble 1 de ADCH en ASCCI).
		lds R16,ADC_Bajo;
        call trans;Envia el dato por el puerto serial(Nibble 0 de ADCH en ASCCI).
		ldi R16,10;
		call trans;Envia el dato por el puerto serial(Terminador de cadena Retorno de carro).
        jmp inicio;Regresa al inicio.

trans:  lds R17,UCSR0A;
        sbrs R17,UDRE0;Verifica el bit Registro Vacío.
        rjmp trans;
        sts UDR0,R16;Mueve el dato al registro de transmición.
trans1: lds R17,UCSR0A;
        sbrs R17,TxC0;Verifica el bit de transmición.
        rjmp trans1;
        ret;

;     200000 cycles:
; ----------------------------- 
; delaying 199998 cycles:
Retardo:
          push R17;
		  push R18;
		  push R19;
          ldi  R17, $06;
WGLOOP0:  ldi  R18, $37;
WGLOOP1:  ldi  R19, $C9;
WGLOOP2:  dec  R19;
          brne WGLOOP2;
          dec  R18;
          brne WGLOOP1;
          dec  R17;
          brne WGLOOP0;
; ----------------------------- 
; delaying 2 cycles:
          nop;
          nop;
		  pop R19;
		  pop R18;
		  pop R17;
; =============================
          ret;
Decodificar:
         cpi R16, 0x0F;Resta 0x0F para prender z si son iguales.
         breq Asignar_F; Si es distinto de 0x0F sigue contando.           
         cpi R16, 0x0E;Resta 0x0E para prender z si son iguales.
         breq Asignar_E; Si es distinto de 0x0E sigue contando.           
         cpi R16, 0x0D;Resta 0x0D para prender z si son iguales.
         breq Asignar_D; Si es distinto de 0x0D sigue contando.           
         cpi R16, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_C; Si es distinto de 0x0C sigue contando.           
         cpi R16, 0x0C;Resta 0x0C para prender z si son iguales.
         breq Asignar_B; Si es distinto de 0x0B sigue contando.           
         cpi R16, 0x0B;Resta 0x0B para prender z si son iguales.
         breq Asignar_A; Si es distinto de 0x0A sigue contando.
         cpi R16, 0x0A;Resta 0x0A para prender z si son iguales.
         breq Asignar_9; Si es distinto de 0x09 sigue contando.           
         cpi R16, 0x08;Resta 0x08 para prender z si son iguales.
         breq Asignar_8; Si es distinto de 0x08 sigue contando.           
         cpi R16, 0x07;Resta 0x07 para prender z si son iguales.
         breq Asignar_7; Si es distinto de 0x07 sigue contando.           
         cpi R16, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_6; Si es distinto de 0x06 sigue contando.           
         cpi R16, 0x05;Resta 0x05 para prender z si son iguales.
         breq Asignar_5; Si es distinto de 0x05 sigue contando.           
         cpi R16, 0x04;Resta 0x04 para prender z si son iguales.
         breq Asignar_4; Si es distinto de 0x04 sigue contando.           
         cpi R16, 0x03;Resta 0x03 para prender z si son iguales.
         breq Asignar_3; Si es distinto de 0x03 sigue contando.
		 cpi R16, 0x02;Resta 0x02 para prender z si son iguales.
         breq Asignar_2; Si es distinto de 0x02 sigue contando.           
         cpi R16, 0x01;Resta 0x01 para prender z si son iguales.
         breq Asignar_1; Si es distinto de 0x01 sigue contando.           
         jmp Asignar_0;Va a la etiqueta 0.
Asignar_F: ldi R16, Car_F;            
           ret;
Asignar_E: ldi R16, Car_E;            
           ret;
Asignar_D: ldi R16, Car_D;            
           ret;
Asignar_C: ldi R16, Car_C;            
           ret;
Asignar_B: ldi R16, Car_B;            
           ret;
Asignar_A: ldi R16, Car_A;            
           ret;
Asignar_9: ldi R16, Car_9;            
           ret;
Asignar_8: ldi R16, Car_8;            
           ret;
Asignar_7: ldi R16, Car_7;            
           ret;
Asignar_6: ldi R16, Car_6;            
           ret;
Asignar_5: ldi R16, Car_5;            
           ret;
Asignar_4: ldi R16, Car_4;            
           ret;
Asignar_3: ldi R16, Car_3;            
           ret;
Asignar_2: ldi R16, Car_2;            
           ret;
Asignar_1: ldi R16, Car_1;            
           ret;
Asignar_0: ldi R16, Car_0; 
		   ret;
