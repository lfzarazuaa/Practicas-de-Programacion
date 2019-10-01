/*
 * Practica_4b.asm
 *
 *  Created: 11/05/2016 08:48:00 a.m.
 *   Author: Luis
 */ 
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;
 .org 0x001C jmp CompA_0;Ejecuta interrupción por PWM Timer0.
 .org 0x001E jmp CompB_0;Ejecuta interrupción por PWM Timer0.
 .org 0x002A jmp ADC_INT; INT0.
 
 config:
   ldi R16,0x60; Carga 0x60.
   out DDRD, R16; Configura el puerto D .
   ldi R16,0x0C; Carga 0x0C.
   out DDRC, R16; Configura el puerto C.
   ldi R16,0xFF;
   out DDRB, R16; Configura el puerto B como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
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
   ldi R16,0x03;Carga 0x03.
   out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A y B desconectados.
   ldi R16,0x02; Carga 0x03 a R16.
   out TCCR0B,R16; Usar el prescalador a un factor de 8.
   out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0 y COMP(A,B).
   ldi R16,0x00; Carga 0x06 a R16.
   sts TIMSK0,R16; Deshabilita la interrupción de TIMER0 por COMPA y COMPB.
   sei;Habilita interrupciones globales.
   ldi R16,0x00;Limpia R16.
   out TCNT0,R16;Carga inicial del Timer0.
   out OCR0A,R20;Carga del PWM.
   out OCR0B,R21;Carga del PWM.
   jmp inicio;
CompA_0:
         nop;
		 reti;Regresa de la interrupción.
CompB_0:
         nop;
		 reti;Regresa de la interrupción.
ADC_INT:
         nop;
		 reti;Regresa de la interrupción.
inicio:
        ldi R16,0x97; Carga 0x87 a R16.
		sts ADCSRA,R16;Activar ADC y prescalador de 32 desactivando ADIF.
	    sbis PIND,0;Verificar que señal se eligira.
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
		lds R16,ADCL;Carga la parte baja del ADC a R16.
		lds R16,ADCH;Carga la parte alta del ADC a R16.
		mov R17,R16;
		cpi R16,0x00;Compara con 0.
		breq FUE_0;
		jmp FUE_1;
FUE_0:	in R16,TCCR0A;Obtener el valor del registro.
	    andi R16,0x7F;Desconecta CompA del pin OC0A.
		out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A apagado en flanco de descenso.
		mov R16,R17;;Carga la parte alta del ADC a R16.
		out OCR0A,R16;Carga al PWM el nuevo valor.
		jmp inicio;
FUE_1:  in R16,TCCR0A;Obtener el valor del registro.
	    ori R16,0x80;Conecta CompA al pin OC0A.
		out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A prendido en flanco de descenso.
		mov R16,R17;;Carga la parte alta del ADC a R16.
		out OCR0A,R16;Carga al PWM el nuevo valor.
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

