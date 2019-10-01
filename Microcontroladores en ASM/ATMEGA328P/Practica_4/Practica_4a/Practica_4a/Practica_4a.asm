/*
 * Practica_4a.asm
 *
 *  Created: 09/05/2016 11:52:45 p.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;
 .org 0x002A jmp ADC_INT; INT0.
 
 config: 
   ldi R16,0x0C; Carga 0x0C.
   out DDRD, R16; Configura el puerto D .
   ldi R16,0x0C; Carga 0x0C.
   out DDRC, R16; Configura el puerto C.
   ldi R16,0xFF;
   out DDRB, R16; Configura el puerto B como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   ldi R16,0x41; Carga 0x71 a R16.
   sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA DERECHA, CANAL 0.
   ldi R16,0x97; Carga 0x97 a R16.
   sts ADCSRA,R16;Activar ADC y prescalador de 128 desactivando ADIF.
   ldi R16,0x00; Carga 0x00 a R16.
   sts ADCSRB,R16;Desactivar Comparador de voltaje y fuentes de autotrigger del ADC.
   ldi R16,0x3C; Carga 0x3C a R16.
   sts DIDR0,R16;Activar ADC0 y ADC1.
   sei;
   jmp inicio;

ADC_INT:
         nop;
		 reti;Regresa de la interrupción.

inicio:
        ldi R16,0x87; Carga 0x87 a R16.
		sts ADCSRA,R16;Activar ADC y prescalador de 32 desactivando ADIF.
	    sbis PIND,0;Verificar que señal se eligira.
	    jmp CANAL_0;
	    jmp CANAL_1;
CANAL_0:
        ldi R16,0x40; Carga 0x70 a R16.
        sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA DERECHA, CANAL 0.
		jmp Ob_Dato; 
CANAL_1:
        ldi R16,0x41; Carga 0x71 a R16.
        sts ADMUX,R16;ADC AREF, JUSTIFICADO A LA DERECHA, CANAL 1.
Ob_Dato:
        ldi R16,0xC7; Carga 0xC7 a R16.
		sts ADCSRA,R16;Activa ADSC.
Loop1:  lds R16,ADCSRA;Carga ADCSRA con ADIF a R16;
	    sbrs R16,ADIF; Verifica el bit de conversión
		jmp Loop1;Si no esta lista la conversión regresa.
		call Retardo;
		lds R16,ADCL;Carga la parte baja del ADC a R16.
		out PORTB,R16;Carga al puerto B lo que hay en ADCL.
		sbi PORTD,2;Actualiza el Flip Flop D.
		call Retardo;
		cbi PORTD,2;Termina el pulso en el Flip Flop D.
		lds R16,ADCH;Carga la parte alta del ADC a R16.
		andi R16,0x03;Enmascara el dato con 0x03;
		out PORTB,R16;Carga al puerto B lo que hay en ADCH.
		sbi PORTD,3;Actualiza el Flip Flop D.
		call Retardo;
		cbi PORTD,3;Termina el pulso en el Flip Flop D.
        jmp inicio;Reinicia el Programa.
Retardo:
        ; ============================= 
        ;    delay loop generator 
        ;     500 cycles:
        ; ----------------------------- 
        ; delaying 498 cycles:
          ldi  R23, 0xA6;
WGLOOP0:  dec  R23;
          brne WGLOOP0;
        ; ----------------------------- 
        ; delaying 2 cycles:
          nop;
          nop;
        ; =============================
		ret;Regresa de la interrupción.

