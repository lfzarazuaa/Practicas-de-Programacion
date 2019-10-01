/*
 * Practica_1A.asm
 *
 *  Created: 08/03/2016 10:06:59 p.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio

 config: 
   clr R16; Limpia el registro 16.
   out DDRB, R16; Configura el puerto B como entrada.
   out DDRC, R16; Configura el puerto C como entrada.
   ser R16;Pone en alto todo el registro.
   out DDRD, R16; Configura el puerto D como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   
inicio:
   ;RB7 RB6 RB5 RB4 RB3 RB2 RB1 RB0;
   ;--  --  --  --  Vel   Comb  On/Off.
   clr R16; Limpia R16.
   out PortD,R16; Pone en cero todas las salidas.
   in R16, PinB;Manda las entradas del puerto B a R16.
   mov R17, R16;Copia el contenido de R16 a R17.
   sbrs R16,0; Verifica que RB0 sea 0.
   jmp inicio; Esta apagado.
   sbrs R16,3; Verifica que RB3 sea 0.
   jmp Carga_100;
   jmp Carga_400;
Carga_100:
   ldi R19,0x01;
   jmp Combinacion;
Carga_400:
   ldi R19,0x04;
   jmp Combinacion;
Combinacion:
   andi R17,0x06;Enmascaramiento con 0x06 para elegir la combinacion.
   cpi R17, 0x00;Resta 0x00 para prender z si son iguales.
   breq Comb_0; Si la combinacion es igual a 0 nos manda a Comb_0.
   cpi R17, 0x02;Resta 0x00 para prender z si son iguales.
   breq Comb_1; Si la combinacion es igual a 0 nos manda a Comb_1.
   cpi R17, 0x04;Resta 0x00 para prender z si son iguales.
   breq Comb_2; Si la combinacion es igual a 0 nos manda a Comb_2.
   jmp Comb_3; Si la combinacion es igual a 0 nos manda a Comb_3.
Comb_0: 
   ldi R16,0x55;Cargamos 0x55 a R16.
   out PortD,R16;Cargamos 0x55 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0xAA;Cargamos 0xAA a R16.
   out PortD,R16;Cargamos 0xAA a PortD.
   Rcall Retardo;Llama al Retardo.
   rjmp inicio;Reinicia el Programa.

Comb_1: 
   ldi R16,0x80;Cargamos 0x80 a R16.
   out PortD,R16;Cargamos 0x80 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x40;Cargamos 0x40 a R16.
   out PortD,R16;Cargamos 0x40 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x20;Cargamos 0x20 a R16.
   out PortD,R16;Cargamos 0x20 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x10;Cargamos 0x10 a R16.
   out PortD,R16;Cargamos 0x10 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x08;Cargamos 0x08 a R16.
   out PortD,R16;Cargamos 0x08 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x04;Cargamos 0x04 a R16.
   out PortD,R16;Cargamos 0x04 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x02;Cargamos 0x02 a R16.
   out PortD,R16;Cargamos 0x02 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x01;Cargamos 0x01 a R16.
   out PortD,R16;Cargamos 0x01 a PortD.
   Rcall Retardo;Llama al Retardo.
   rjmp inicio;Reinicia el Programa.

Comb_2: 
   ldi R16,0xCC;Cargamos 0xCC a R16.
   out PortD,R16;Cargamos 0xCC a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x66;Cargamos 0x66 a R16.
   out PortD,R16;Cargamos 0x66 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x33;Cargamos 0x33 a R16.
   out PortD,R16;Cargamos 0x33 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x99;Cargamos 0x99 a R16.
   out PortD,R16;Cargamos 0x99 a PortD.
   Rcall Retardo;Llama al Retardo.
   rjmp inicio;Reinicia el Programa.

Comb_3: 
   ldi R16,0x81;Cargamos 0x81 a R16.
   out PortD,R16;Cargamos 0x81 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x42;Cargamos 0x42 a R16.
   out PortD,R16;Cargamos 0x42 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x24;Cargamos 0x24 a R16.
   out PortD,R16;Cargamos 0x24 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x18;Cargamos 0x18 a R16.
   out PortD,R16;Cargamos 0x18 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x24;Cargamos 0x24 a R16.
   out PortD,R16;Cargamos 0x24 a PortD.
   Rcall Retardo;Llama al Retardo.
   ldi R16,0x42;Cargamos 0x42 a R16.
   out PortD,R16;Cargamos 0x42 a PortD.
   Rcall Retardo;Llama al Retardo.
   rjmp inicio;Reinicia el Programa.


Retardo:
; delaying 99990 cycles:
          push R19;
		  push R17;
		  push R16;
WGLOOP3:
          ldi  R16, 0xA5
WGLOOP0:  ldi  R17, 0xC9
WGLOOP1:  dec  R17
          brne WGLOOP1
          dec  R16
          brne WGLOOP0
; ----------------------------- 
; delaying 9 cycles:
          ldi  R16, 0x03
WGLOOP2:  dec  R16
          brne WGLOOP2
; ----------------------------- 
; delaying 1 cycle:
          nop;
		  dec  R19;
		  brne WGLOOP3;
		  pop R16;
		  pop R17;
		  pop R19;
; =============================
          ret;

