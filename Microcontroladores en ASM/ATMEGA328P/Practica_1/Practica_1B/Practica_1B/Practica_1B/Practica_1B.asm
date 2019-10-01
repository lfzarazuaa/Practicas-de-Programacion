/*
 * Practica_1B.asm
 *
 *  Created: 09/03/2016 08:30:37 a.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio

 config: 
   clr R16; Limpia el registro 16.
   out DDRB, R16; Configura el puerto B como entrada.
   ser R16;Pone en alto todo el registro.
   out DDRD, R16; Configura el puerto D como salida.
   out DDRC, R16; Configura el puerto C como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   
Inicio:
   ;RB7 RB6 RB5 RB4 RB3 RB2 RB1 RB0;
   ;--  --  --  --  Vel   Comb  On/Off.
   clr R16; Limpia R16.
   clr R17; Limpia R17.
Contar:
   Rcall Decodificar;
   Rcall Retardo;
   inc R16;
   cpi R16, 0x09;Resta 0x09 para prender z si son iguales.
   brne Contar; Si es distinto de 0x09 sigue contando.
   inc R17;
   cpi R17, 0x06;Resta 0x06 para prender z si son iguales.
   brne Contar; Si es distinto de 0x06 sigue contando.
   jmp Inicio;

   


Retardo:
; delaying 99990 cycles:
		  push R17;
		  push R16;
          ldi  R16, $21
WGLOOP0:  ldi  R17, $D6
WGLOOP1:  ldi  R18, $EB
WGLOOP2:  in R18,PINB;
          sbrc R18,1;
		  jmp  Ver_bajo;
Regresa:  dec  R18
          brne WGLOOP2
          dec  R17
          brne WGLOOP1
          dec  R16
          brne WGLOOP0
		  pop R16;
		  pop R17;
; =============================
          ret;
Ver_bajo:
          in R18,PINB;
          sbrs R18,1;
		  jmp Regresa;
          jmp Ver_bajo;          

