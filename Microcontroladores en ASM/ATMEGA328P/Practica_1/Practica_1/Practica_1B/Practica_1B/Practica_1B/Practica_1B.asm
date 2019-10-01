/*
 * Practica_1B.asm
 *
 *  Created: 09/03/2016 08:30:37 a.m.
 *   Author: Luis
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio

.equ       Car_0=0xC0; Define el valor de la constante para generar un "0" en un display de 7 segmentos.
.equ       Car_1=0xF9; Define el valor de la constante para generar un "1" en un display de 7 segmentos.
.equ       Car_2=0xA4; Define el valor de la constante para generar un "2" en un display de 7 segmentos.
.equ       Car_3=0xB0; Define el valor de la constante para generar un "3" en un display de 7 segmentos.
.equ       Car_4=0x99; Define el valor de la constante para generar un "4" en un display de 7 segmentos.
.equ       Car_5=0x92; Define el valor de la constante para generar un "5" en un display de 7 segmentos.
.equ       Car_6=0x82; Define el valor de la constante para generar un "6" en un display de 7 segmentos.
.equ       Car_7=0xF8; Define el valor de la constante para generar un "7" en un display de 7 segmentos.
.equ       Car_8=0x80; Define el valor de la constante para generar un "8" en un display de 7 segmentos.
.equ       Car_9=0x90; Define el valor de la constante para generar un "9" en un display de 7 segmentos.
.equ       Car_A=0x88; Define el valor de la constante para generar la letra "A" en un display de 7 segmentos.
.equ       Car_B=0x83; Define el valor de la constante para generar la letra "B" en un display de 7 segmentos.
.equ       Car_C=0xC6; Define el valor de la constante para generar la letra "C" en un display de 7 segmentos.
.equ       Car_D=0xA1; Define el valor de la constante para generar la letra "D" en un display de 7 segmentos.
.equ       Car_E=0x86; Define el valor de la constante para generar la letra "E" en un display de 7 segmentos.
.equ       Car_F=0x8E; Define el valor de la constante para generar la letra "F" en un display de 7 segmentos.


 config: 
         clr R16; Limpia el registro 16.
         out DDRC, R16; Configura el puerto B como entrada.
         ser R16;Pone en alto todo el registro.
         out DDRD, R16; Configura el puerto D como salida.
         out DDRB, R16; Configura el puerto C como salida.
         ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
         out SPL,R16;Carga el Stack pointer low con la direccion correcta.
         ldi R16,high(RAMEND);Carga el nivel alto de la pila.
         out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   
Inicio:
   ;RB7 RB6 RB5 RB4 RB3 RB2 RB1 RB0;
   ;--  --  --  --  Vel   Comb  On/Off.
         clr R16; Limpia R16.
         clr R17; Limpia R17.
		   jmp Saltar;
Contar:
         Rcall Retardo;
Saltar:	 mov R18,R16;
         Rcall Decodificar;
         out PortD,R18;
         mov R18,R17;
         Rcall Decodificar;
         out PortB,R18;
         inc R16;
         cpi R16, 0x0A;Resta 0x09 para prender z si son iguales.
         brne Contar; Si es distinto de 0x09 sigue contando.
         clr R16;
         inc R17;
         cpi R17, 0x06;Resta 0x06 para prender z si son iguales.
         brne Contar; Si es distinto de 0x06 sigue contando.
         clr R16; Limpia R16.
         clr R17; Limpia R17.
		 jmp Contar;
Decodificar:
         cpi R18, 0x09;Resta 0x09 para prender z si son iguales.
         breq Asignar_9; Si es distinto de 0x09 sigue contando.           
         cpi R18, 0x08;Resta 0x08 para prender z si son iguales.
         breq Asignar_8; Si es distinto de 0x08 sigue contando.           
         cpi R18, 0x07;Resta 0x07 para prender z si son iguales.
         breq Asignar_7; Si es distinto de 0x07 sigue contando.           
         cpi R18, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_6; Si es distinto de 0x06 sigue contando.           
         cpi R18, 0x05;Resta 0x05 para prender z si son iguales.
         breq Asignar_5; Si es distinto de 0x05 sigue contando.           
         cpi R18, 0x04;Resta 0x04 para prender z si son iguales.
         breq Asignar_4; Si es distinto de 0x04 sigue contando.           
         cpi R18, 0x03;Resta 0x03 para prender z si son iguales.
         breq Asignar_3; Si es distinto de 0x03 sigue contando.
		 cpi R18, 0x02;Resta 0x02 para prender z si son iguales.
         breq Asignar_2; Si es distinto de 0x02 sigue contando.           
         cpi R18, 0x01;Resta 0x01 para prender z si son iguales.
         breq Asignar_1; Si es distinto de 0x01 sigue contando.           
         jmp Asignar_0;Va a la etiqueta 0.

Asignar_9: ldi R18, Car_9;            
           ret;
Asignar_8: ldi R18, Car_8;            
           ret;
Asignar_7: ldi R18, Car_7;            
           ret;
Asignar_6: ldi R18, Car_6;            
           ret;
Asignar_5: ldi R18, Car_5;            
           ret;
Asignar_4: ldi R18, Car_4;            
           ret;
Asignar_3: ldi R18, Car_3;            
           ret;
Asignar_2: ldi R18, Car_2;            
           ret;
Asignar_1: ldi R18, Car_1;            
           ret;
Asignar_0: ldi R18, Car_0;            
           ret;

Retardo:
; delaying 99990 cycles:
		  push R19;
		  push R17;
		  push R16;
          ldi  R16, $2
WGLOOP0:  ldi  R17, $D6
WGLOOP1:  ldi  R19, $EB
WGLOOP2:  in R18,PINC;
          sbrc R18,0;
		  jmp  Resetear_1;
          sbrc R18,1;
		  jmp  Act_Pausa;
Reanudar: dec  R19
          brne WGLOOP2
          dec  R17
          brne WGLOOP1
          dec  R16
          brne WGLOOP0
		  pop R16;
		  pop R17;
		  pop R19;
; =============================
          ret;
;============================
Resetear_1:
		   pop R16;
		   pop R17;
		   pop R19;
		   clr R16; Limpia R16.
           clr R17; Limpia R17.
		   ret;
Act_Pausa: 
           in R18,PINC;
           sbrc R18,0;
		   jmp  Resetear_1;
           sbrs R18,1;
		   jmp Reanudar;
		   jmp Act_Pausa;
           

                        

