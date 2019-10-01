;
; Practica_0a_Mega.asm
;
; Created: 11/02/2019 10:15:22 a. m.
; Author : Zarazua
;

;---Inclusi�n de archivos---
 .include "m2560def.inc"
 ;---Definici�n de Variables
 .def T = r18
 ;---Definici�n del Vector de interrupciones
 .org 0x0000
 RESET:
 ;---Configuraci�n de puertos
 ; Con 0 es como entrada ; Con 1 es como salida
 ldi T, 0b00000000 ;puerto B como entrada
 sts DDRK, T;out DDRK, T
 ldi T, 0b11111111 ;puerto D como salida
 out DDRF, T;
 ;---Limpiamos los registros
 clr T;
 LOOP:
 lds T, PINK;in T, PINK
 out PORTF,T;
 jmp LOOP ;fin