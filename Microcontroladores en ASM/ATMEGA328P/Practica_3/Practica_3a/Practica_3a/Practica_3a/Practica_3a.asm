/*
 * Practica_3a.asm
 *
 *  Created: 20/04/2016 06:59:19 a.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;
 .org 0x0002 jmp INT_0 ; INT0.
 .org 0x0004 jmp INT_1 ; INT1.
 .org 0x0006 jmp PC_INT0 ; PCINT0.
 .org 0x0020 jmp TIM0_OVF ; Timer0 Overflow.
 config: 
   ldi R16,0x00; Limpia el registro 16.
   out DDRD, R16; Configura el puerto D como entrada.
   out DDRC, R16; Configura el puerto C como entrada.
   ldi R16,0xFF;
   out DDRB, R16; Configura el puerto B como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   clr R16;Limpia R16.
   out TCCR0A,R16;Limpia el Registro TCCR0A para dejarlo en modo Normal.
   ldi R16,0x03; Carga 0x05 a R16.
   out TCCR0B,R16; Usar el prescalador a un factor de 64.
   ldi R16,0x00;Deshabilita TOV0.
   out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0.
   ldi R16,0x01; Carga 0x01 a R16.
   sts TIMSK0,R16; Habilita la interrupción de TIMER0 por overflow.
   ldi R16,0x0F; Carga 0x0F a R16.
   sts EICRA,R16; Configura las interrupciones de INT0 e INT1 en flanco de Subida.
   ldi R16,0x03; Carga 0x01 a R16.
   sts EIMSK,R16; Habilita la interrupción de INT0 e INT1.
   sei;Habilita interrupciones globales.
   clr R20;
   clr R21;
   clr R22;
   ldi R16,99;Carga 99 a R16.
   out TCNT0,R16;Carga inicial del timer de 99 para lograr la frecuencia de 100Hz.
   ldi R16,0x3C; Carga 0x3C a R16.
   sts EIFR,R16; Limpia las interrupciones pendientes de INT0 e INT1.
   jmp inicio;F=100.16025Hz.
INT_0:
       ldi R22,0x01;Pone en 1 el registro R22.
	   mov R18,R20;Copia R20 a R18.
       inc R18;Incrementa en 1 R18.
	   mov R19,R21;Copia R20 a R19.
       inc R19;Incrementa en 1 R19.
	   reti;
INT_1:
       ldi R22,0x00;Pone en 0 el registro R22.
	   reti;
PC_INT0:
        reti;
TIM0_OVF:
		 inc R20;Incrementa en 1 R20.
		 cpi R20,0x06; Comparara si es 6.
		 brne Fin_Temp;Finaliza la int si no es 6.
		 clr R20;Limpia R20.
		 inc R21;Incrementa en 1 R21.
		 cpi R21,0x06; Comparara si es 6.
		 brne Fin_Temp;Finaliza la int si no es 6.
		 clr R21;Limpia R21.
Fin_Temp:sbrs R22,0;Verifica que el bit 0 sea 1.
	     jmp Carga_Al;Si es cero carga el numero Aleatorio.
	     jmp Fin_1;Finaliza la interrupción.
Carga_Al:mov R18,R20;Copia R20 a R18.
         inc R18;Incrementa en 1 R18.
		 mov R19,R21;Copia R20 a R19.
         inc R19;Incrementa en 1 R19.
Fin_1:   ldi R16,11;Carga un 11 a R16.
         out TCNT0,R16;Carga inicial del timer para freq de 100Hz.
		 reti;Regresa de la interrupción.
inicio:
	   call Muestra_Display;
       jmp inicio;Reinicia el Programa.

Muestra_Display:
       out PortB,R18;Carga el dato.
	   sbi PortB,4;Prende el display 1.
	   call Retardo;Retardo para el display.
	   cbi PortB,4;Apaga el display 1.
	   out PortB,R19;Carga el dato.
	   sbi PortB,5;;Prende el display 2.
	   call Retardo;Retardo para el display.
	   cbi PortB,5;Apaga el display 2.
	   ret;Regresa de la subrutina.

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