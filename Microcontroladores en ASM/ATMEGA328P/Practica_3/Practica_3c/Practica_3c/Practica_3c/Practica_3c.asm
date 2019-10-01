/*
 * Practica_3c.asm
 *
 *  Created: 20/04/2016 11:31:00 p.m.
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
   ldi R16,0x05; Carga 0x05 a R16.
   out TCCR0B,R16; Usar el prescalador a un factor de 1024.
   ldi R16,0x00;Deshabilita TOV0.
   out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0.
   ldi R16,0x01; Carga 0x01 a R16.
   sts TIMSK0,R16; Habilita la interrupción de TIMER0 por overflow.
   ldi R16,0x0F; Carga 0x0F a R16.
   sts EICRA,R16; Configura las interrupciones de INT0 e INT1 en flanco de Subida.
   ldi R16,0x03; Carga 0x01 a R16.
   sts EIMSK,R16; Habilita la interrupción de INT0 e INT1.
   sei;Habilita interrupciones globales.
   clr R17;Unidades.
   clr R18;Decenas.
   clr R19;.Centenas.
   clr R20;Millares.
   clr R21;Disp_1.
   clr R22;Disp_2.
   clr R23;Disp_3
   clr R24;Disp_4.
   clr R25;Segundo.
   ldi R16,11;Carga 11 a R16.
   out TCNT0,R16;Carga inicial del timer de 11 para lograr la frecuencia de 4Hz.
   ldi R16,0x3C; Carga 0x3C a R16.
   sts EIFR,R16; Limpia las interrupciones pendientes de INT0 e INT1.
   jmp inicio;F=100.16025Hz.
INT_0:
       inc R17;
	   cpi R17,10;
	   brne DBZ;
	   clr R17;
	   ;Decenas
	   inc R18;
	   cpi R18,10;
	   brne DBZ;
	   clr R18;
	   ;Centenas
	   inc R19;
	   cpi R19,10;
	   brne DBZ;
	   clr R19;
	   ;Millares
	   inc R20;
	   cpi R20,10;
	   brne DBZ;
	   clr R20;
DBZ:
	   reti;
INT_1:
       nop;
	   reti;
PC_INT0:
        reti;
TIM0_OVF:
         inc R25;
	     cpi R25,4;
	     brne Fin_1;
	     clr R25;
		 mov R21,R17;
		 mov R22,R18;
		 mov R23,R19;
		 mov R24,R20;
		 clr R17;Unidades.
         clr R18;Decenas.
         clr R19;.Centenas.
         clr R20;Millares.
Fin_1:   ldi R16,11;Carga un 11 a R16.
         out TCNT0,R16;Carga inicial del timer para freq de 4Hz.
		 reti;Regresa de la interrupción.
inicio:
	   call Muestra_Display;
       jmp inicio;Reinicia el Programa.

Muestra_Display:
       out PortB,R21;Carga el dato.
	   sbi PortB,4;Prende el display 1.
	   call Retardo;Retardo para el display.
	   cbi PortB,4;Apaga el display 1.
	   out PortB,R22;Carga el dato.
	   sbi PortB,5;;Prende el display 2.
	   call Retardo;Retardo para el display.
	   cbi PortB,5;Apaga el display 2.
	   out PortB,R23;Carga el dato.
	   sbi PortB,6;Prende el display 3.
	   call Retardo;Retardo para el display.
	   cbi PortB,6;Apaga el display 3.
	   out PortB,R24;Carga el dato.
	   sbi PortB,7;Prende el display 4.
	   call Retardo;Retardo para el display.
	   cbi PortB,7;Apaga el display 4.

	   ret;Regresa de la subrutina.

Retardo:
        ; ============================= 
        ;    delay loop generator 
        ;     500 cycles:
        ; ----------------------------- 
        ; delaying 498 cycles:
          ldi  R26, 0xA6;
WGLOOP0:  dec  R26;
          brne WGLOOP0;
        ; ----------------------------- 
        ; delaying 2 cycles:
          nop;
          nop;
        ; =============================
		ret;Regresa de la interrupción.