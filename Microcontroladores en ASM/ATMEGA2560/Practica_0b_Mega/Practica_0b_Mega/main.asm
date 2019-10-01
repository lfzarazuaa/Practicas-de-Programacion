;
; Practica_0b_Mega.asm
;
; Created: 06/03/2019 11:19:04 p.m.
; Author : Sanorte
;
;---Inclusión de archivos---
 .include "m2560def.inc"
 ;---Definición de Variables
 .def t = r18
 .def nibble_alto = r17
 .def nibble_bajo = r16
 .def suma= r19
 .def resta= r20
 .def oand= r21
 .def oor= r22
 ;---Definición del Vector de interrupciones
 .org 0x0000
 RESET:
 ;---Configuración de puertos
 ; Con 0 es como entrada ; Con 1 es como salida
 ldi t, 0b00000000 ;puerto K como entrada
 sts DDRK, t;out DDRK, T
 out DDRA, t;Puerto A como entrada
 ldi t, 0b11111111 ;puerto F como salida
 out DDRF, t;
 ldi t,0xff ;puerto K y A con pulldown
 sts portk,t;
 out porta,t;
 ;---Limpiamos los registros
 clr t;
 LOOP:
 lds t, pink;in T, PINK
 ;Obtener nibble bajo en r16
   mov nibble_bajo,t;
   andi nibble_bajo,0x0F;
;Obtener nibble bajo en r17
   mov nibble_alto,t;
   swap nibble_alto;
   andi nibble_alto,0x0F;
;Realizar operaciones
  ;Elegir operacion
  in t,pina;
  andi t,3;Enmascaramiento
  cpi t,0x00;
  breq Es_suma;
  cpi t,0x01;
  breq Es_resta;
  cpi t,0x02;
  breq Es_and;
  cpi t,0x03;
  breq Es_or;

Es_suma:
   mov suma,nibble_alto;
   add suma,nibble_bajo;

   in t,sreg;
   cbr t,(1<<6); cbr t,6;colocar bit 6 en 0;
   sbrc t,1;verificar z 
   sbr  t,(1<<6);colocar bit 6 en 1;
   lsl t;
   andi t,0b11100000;  
   or t,suma;
   jmp final;

Es_resta:           
   mov resta,nibble_alto;
   sub resta,nibble_bajo;
   andi resta,0b00011111; 
   
   in t,sreg;
   cbr t,(1<<6); cbr t,6;colocar bit 6 en 0;
   sbrc t,1;verificar z 
   sbr  t,(1<<6);colocar bit 6 en 1;
   lsl t;
   andi t,0b11100000;  
   or t,resta;
   jmp final;

Es_and:
   mov oand,nibble_alto;
   and oand,nibble_bajo;

   in t,sreg;
   cbr t,(1<<6); cbr t,6;colocar bit 6 en 0;
   sbrc t,1;verificar z 
   sbr  t,(1<<6);colocar bit 6 en 1;
   lsl t;
   andi t,0b11100000;  
   or t,oand;
   jmp final;

Es_or:
   mov oor,nibble_alto;
   or  oor,nibble_bajo;

   in t,sreg;
   cbr t,(1<<6); cbr t,6;colocar bit 6 en 0;
   sbrc t,1;verificar z 
   sbr  t,(1<<6);colocar bit 6 en 1;
   lsl t;
   andi t,0b11100000;  
   or t,oor;
   jmp final;
;
final:
 out portf,t;
 jmp LOOP ;fin
