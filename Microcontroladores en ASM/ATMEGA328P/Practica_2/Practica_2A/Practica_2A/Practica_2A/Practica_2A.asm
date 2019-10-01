/*
 * Practica_2A.asm
 *
 *  Created: 28/03/2016 02:01:36 p.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio.
 .org 0x0020 jmp Temp_0;Ejecuta interrupción por Timer 0.
 config: 
   ldi R16,0x0F; Limpia el registro 16.
   out DDRB, R16; Configura el puerto B del 0 al 3 como salida y los demas como entrada.
   clr R16;
   out DDRC, R16; Configura el puerto C como entrada.
   out DDRD, R16; Configura el puerto D como entrada.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   clr R16;Limpia R16.
   out TCCR0A,R16;Limpia el Registro TCCR0A para dejarlo en modo Normal.
   ldi R16,0x03; Carga 0x03 a R16.
   out TCCR0B,R16; Usar el prescalador a un factor de 64.
   ldi R16,0x01;Habilita TOV0.
   out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0
   ldi R16,0x01; Carga 0x01 a R16.
   sts TIMSK0,R16; Habilita la interrupción de TIMER0 por overflow.
     sei;Habilita interrupciones globales.
   clr R17;
   ldi R16,0xBE;Limpia R16.
   out TCNT0,R16;Carga inicial del timer de 190 para lograr la frecuencia de 240Hz
   jmp inicio;F=240.3846Hz.

Temp_0:
        ldi R16,0xBE;Limpia R16.
        out TCNT0,R16;Carga inicial del timer de 190 para lograr la frecuencia de 240Hz.
        clr R17;Limpia R17.
        in R16, PinB;Manda las entradas del puerto B a R16.
		sbrs R16,5;Verifica que RB0 sea 0.
        jmp Parar; Esta apagado.
		in R18,PortB;Carga las salidas de PortB a R16.
		andi R18,0x0F;Emascaramiento para obtener el nibble 0.
		cpi R18,0x00;Compara si es 0.
		breq Poner_1;Si es 0 pone en uno para hacer el giro.
        sbrs R16,4; Verifica que RB3 sea 0.
        jmp Derecha;Hace el giro hacia la derecha
		jmp Izquierda;Hace el giro hacia la izquierda.
Parar:
        clr R18;Cargar un cero.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Poner_1:
        ldi R18,0x01;Cargar un uno.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Derecha:
        lsr R18;Recorre a la derecha el dato.
		cpi R18,0x00;Compara si es 0.
		breq Cargar_8;Va a la etiqueta para cargar el recorrimiento correcto.
        jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar_8:
        ldi R18,0x08;Carga un 0x08 para el motor a pasos.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Izquierda:
        lsl R18;Recorre a la izquierda el dato.
		cpi R18,0x10;Compara si es 8.
		breq Cargar_1;Va a la etiqueta para cargar el recorrimiento correcto.
        jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar_1:
        ldi R18,0x01;Carga un 0x01 para el motor a pasos.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar:
        out PortB,R18;Actualizar el motor a pasos.
		ldi R16,0x00;Deshabilita TOV0.
        out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0
	    reti;Rgresa de la interrupción;
inicio:
   ;RB7  RB6   RB5   RB4   RB3 RB2 RB1 RB0;
   ; --  --  On/Off. Giro  D   B   C   A
       jmp inicio;Reinicia el Programa.

   