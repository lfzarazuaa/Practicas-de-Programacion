;
; Practica_1c_Mega.asm
;
; Created: 05/03/2019 09:40:03 p.m.
; Author : Sanorte
;


; Replace with your application code
.include "m2560def.inc";Archivo de definicion de etiquetas.

.equ       Car0='0'; Define el valor de la constante para generar un "0" en un display de 7 segmentos.
.equ       Car1='1'; Define el valor de la constante para generar un "1" en un display de 7 segmentos.
.equ       Car2='2'; Define el valor de la constante para generar un "2" en un display de 7 segmentos.
.equ       Car3='3'; Define el valor de la constante para generar un "3" en un display de 7 segmentos.
.equ       Car4='4'; Define el valor de la constante para generar un "4" en un display de 7 segmentos.
.equ       Car5='5'; Define el valor de la constante para generar un "5" en un display de 7 segmentos.
.equ       Car6='6'; Define el valor de la constante para generar un "6" en un display de 7 segmentos.
.equ       Car7='7'; Define el valor de la constante para generar un "7" en un display de 7 segmentos.
.equ       Car8='8'; Define el valor de la constante para generar un "8" en un display de 7 segmentos.
.equ       Car9='9'; Define el valor de la constante para generar un "9" en un display de 7 segmentos.
.equ       CarA='A'; Define el valor de la constante para generar la letra "A" en un display de 7 segmentos.
.equ       CarB='B'; Define el valor de la constante para generar la letra "B" en un display de 7 segmentos.
.equ       CarC='C'; Define el valor de la constante para generar la letra "C" en un display de 7 segmentos.
.equ       CarD='D'; Define el valor de la constante para generar la letra "D" en un display de 7 segmentos.
.equ       CarAs='*'; Define el valor de la constante para generar la letra "E" en un display de 7 segmentos.
.equ       CarNum='#'; Define el valor de la constante para generar la letra "F" en un display de 7 segmentos.
.equ       CarN=$00;
.equ fil1=$200;
.equ fil2=$201;
.equ fil3=$202;
.equ fil4=$203;
.equ col1=$204;
.equ col2=$205;
.equ col3=$206;
.equ col4=$207;
.equ tecla=$208;
 config:
   ldi r16,$0F;Carga 0x0F a r16.
   out DDRF, r16; Configura el puerto F con (F7-F4) como entrada y (F3-F0) como salida.
   swap r16;Carga 0xF0 a r16.
   out portf,r16; Activa las resistencias de pullup en (F7-F4).
   ser r16;Pone en alto todo el registro.
   sts DDRK, r16;Configura el puerto K como salida.
   ldi r16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,r16;Carga el Stack pointer low con la dirección correcta.
   ldi r16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,r16;Carga el Stack pointer high con la dirección correcta.
Fila1:
   ldi r16,0b11111110;Carga 0b11111110 a r16;
   out portf,r16; Activa las resistencias de pullup en (F7-F4) y coloca 1110 en (F3-F0).
   ldi r16,Car1;
   sts col1,r16;Carga Car1 a col1;
   ldi r16,Car2;
   sts col2,r16;Carga Car2 a col2;
   ldi r16,Car3;
   sts col3,r16;Carga Car3 a col3;
   ldi r16,CarA;
   sts col4,r16;Carga CarA a col4;
   call Retardo;
   in r16,pinf;Lee lo que hay en el puerto f;
   cbr r16,$0F;Enmascara el nibble alto.
   sts fil1,r16;
   call Comparar;
   sts tecla,r16;
   cpi r16,Carn;
   brne CD2;
Fila2:
   ldi r16,0b11111101;Carga 0b11111101 a r16;
   out portf,r16; Activa las resistencias de pullup en (F7-F4) y coloca 1110 en (F3-F0).
   ldi r16,Car4;
   sts col1,r16;Carga Car4 a col1;
   ldi r16,Car5;
   sts col2,r16;Carga Car5 a col2;
   ldi r16,Car6;
   sts col3,r16;Carga Car6 a col3;
   ldi r16,CarB;
   sts col4,r16;Carga CarB a col4;
   call Retardo;
   in r16,pinf;Lee lo que hay en el puerto f;
   cbr r16,$0F;Enmascara el nibble alto.
   sts fil2,r16;
   call Comparar;
   sts tecla,r16;
   cpi r16,Carn;
CD2:
   brne CargarDato;
Fila3:
   ldi r16,0b11111011;Carga 0b11111101 a r16;
   out portf,r16; Activa las resistencias de pullup en (F7-F4) y coloca 1011 en (F3-F0).
   ldi r16,Car7;
   sts col1,r16;Carga Car7 a col1;
   ldi r16,Car8;
   sts col2,r16;Carga Car8 a col2;
   ldi r16,Car9;
   sts col3,r16;Carga Car9 a col3;
   ldi r16,CarC;
   sts col4,r16;Carga CarC a col4;
   call Retardo;
   in r16,pinf;Lee lo que hay en el puerto f;
   cbr r16,$0F;Enmascara el nibble alto.
   sts fil3,r16;
   call Comparar;
   sts tecla,r16;
   cpi r16,Carn;
   brne CargarDato;
Fila4:
   ldi r16,0b11110111;Carga 0b11110111 a r16;
   out portf,r16; Activa las resistencias de pullup en (F7-F4) y coloca 0111 en (F3-F0).
   ldi r16,CarAs;
   sts col1,r16;Carga CarAs a col1;
   ldi r16,Car0;
   sts col2,r16;Carga Car0 a col2;
   ldi r16,CarNum;
   sts col3,r16;Carga CarNum a col3;
   ldi r16,CarD;
   sts col4,r16;Carga CarD a col4;
   call Retardo;
   in r16,pinf;Lee lo que hay en el puerto f;
   cbr r16,$0F;Enmascara el nibble alto.
   sts fil4,r16;
   call Comparar;
   sts tecla,r16;
CargarDato:
   sts portk,r16;
   jmp Fila1;  
Comparar:
   cpi r16,0b11100000;Compara con 0b0001.
   breq Columna1;
   cpi r16,0b11010000;Compara con 0b0010.
   breq Columna2;
   cpi r16,0b10110000;Compara con 0b0100.
   breq Columna3;
   cpi r16,0b01110000;Compara con 0b1000.
   breq Columna4;
   ldi r16,Carn;Carga el caracter nulo.
   ret;
Columna1:
   lds r16,col1;
   ret;
Columna2:
   lds r16,col2;
   ret;
Columna3:
   lds r16,col3;
   ret;
Columna4:
   lds r16,col4;
   ret;
Retardo:
; ============================= 
;    delay loop generator 
;     16000 cycles:
; ----------------------------- 
; delaying 15996 cycles:
          ldi  R17, $1F
WGLOOP0:  ldi  R18, $AB
WGLOOP1:  dec  R18
          brne WGLOOP1
          dec  R17
          brne WGLOOP0
; ----------------------------- 
; delaying 3 cycles:
          ldi  R17, $01
WGLOOP2:  dec  R17
          brne WGLOOP2
; ----------------------------- 
; delaying 1 cycle:
          ret
; ============================= 