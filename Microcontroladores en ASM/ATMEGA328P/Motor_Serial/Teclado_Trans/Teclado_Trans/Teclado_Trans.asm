/*
 * Teclado_Trans.asm
 *
 *  Created: 10/12/2016 06:29:55 p. m.
 *   Author: Sala1
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio
 .equ       Tecla_N=0x00; Define el valor de la Tecla Nula.
 .equ       Tecla_0=0x7E; Define el valor de la constante para generar un "0".
 .equ       Tecla_1=0x85; Define el valor de la constante para generar un "1" .
 .equ       Tecla_2=0x8D; Define el valor de la constante para generar un "2" .
 .equ       Tecla_3=0x95; Define el valor de la constante para generar un "3" .
 .equ       Tecla_4=0x9E; Define el valor de la constante para generar un "4" .
 .equ       Tecla_5=0xA8; Define el valor de la constante para generar un "5" .
 .equ       Tecla_6=0xB2; Define el valor de la constante para generar un "6" .
 .equ       Tecla_7=0xBD; Define el valor de la constante para generar un "7" .
 .equ       Tecla_8=0xD4; Define el valor de la constante para generar un "8" .
 .equ       Tecla_9=0xE0; Define el valor de la constante para generar un "9" .
 .equ       Tecla_A=0xEE; Define el valor de la constante para generar una "A" .
 .equ       Tecla_B=0x00; Define el valor de la constante para generar una "B" .
 .equ       Tecla_C=0x00; Define el valor de la constante para generar una "C" .
 .equ       Tecla_D=0x00; Define el valor de la constante para generar una "D" .
 .equ       Tecla_E=0x00; Define el valor de la constante para generar una "E" .
 .equ       Tecla_F=0x00; Define el valor de la constante para generar una "F" .

 config: 
         ldi R16,0x0F; Carga 0X0F a R16.
         out DDRB, R16; Configura el puerto B(7-4) como entrada B(3-0) como salida.
         ldi R16,0xFF;Carga la constante 0xFF.
         out DDRD, R16; Configura el puerto D como salida.
         clr R16;Limpia el registro R16.
         out DDRC, R16; Configura el puerto C como entrada.
         ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
         out SPL,R16;Carga el Stack pointer low con la direccion correcta.
         ldi R16,high(RAMEND);Carga el nivel alto de la pila.
         out SPH,R16;Carga el Stack pointer high con la direccion correcta.
		 ;
         ldi R16,0x98;
         sts UCSR0B, R16;Configura la transmisición con Interrupción por Rx con Rx activado y con Tx activado..
         ldi R16,0x06;
         sts UCSR0C, R16;Configura la transmisición Asincrona, sin paridad, con 1 bit de parada y 8 bits.
         clr R16;
         sts UBRR0H, R16;
         ldi R16,25;
         sts UBRR0L, R16;Configura los BAUDS a 2400 con un reloj de 1 MHz.          
         sei;
   	     jmp inicio;

Inicio:
   ;     in<=====PinD
   ;     out=====>PortD
         ;Fila 1
         ldi R16,0x01;Carga la constante 0x01;
		 out PORTB,R16;Carga el valor para acceder a la Fila 1.
		 nop;Espera para obtener el dato
		 in R16,PINB;Lee el valor del Puerto B.
         andi R16,0XF0;Enmascara el valor leido para comparar.
		 cpi R16, 0x00;Resta 0x00 para prender z si son iguales.
         brne Fila_1; Si es distinto de 0x00 sigue recorriendose.
		 ;Fila 2
		 ldi R16,0x02;Carga la constante 0x02;
		 out PORTB,R16;Carga el valor para acceder a la Fila 2.
		 nop;Espera para obtener el dato
		 in R16,PINB;Lee el valor del Puerto B.
         andi R16,0XF0;Enmascara el valor leido para comparar.
		 cpi R16, 0x00;Resta 0x00 para prender z si son iguales.
         brne Fila_2; Si es distinto de 0x00 sigue recorriendose.
		 ;Fila 3
		 ldi R16,0x04;Carga la constante 0x04;
		 out PORTB,R16;Carga el valor para acceder a la Fila 3.
		 nop;Espera para obtener el dato
		 in R16,PINB;Lee el valor del Puerto B.
         andi R16,0XF0;Enmascara el valor leido para comparar.
		 cpi R16, 0x00;Resta 0x00 para prender z si son iguales.
         brne Fila_3; Si es distinto de 0x00 sigue recorriendose.
		 ;Fila 4
		 ldi R16,0x08;Carga la constante 0x08;
		 out PORTB,R16;Carga el valor para acceder a la Fila 4.
		 nop;Espera para obtener el dato.
		 in R16,PINB;Lee el valor del Puerto B.
         andi R16,0XF0;Enmascara el valor leido para comparar.
		 cpi R16, 0x00;Resta 0x00 para prender z si son iguales.
         brne Fila_4; Si es distinto de 0x00 sigue recorriendose.
		 ;ldi R16,0x02;Carga 0x02.
		 ;ldi R16,Tecla_N;Carga el valor de la Tecla Nula a R16.
		 ;nop;
         jmp Inicio;Regresa al inicio a detectar el teclado matricial.
Regresa: 
         mov R16,R19;Copia la Opción a R17
		 call trans;Envia el dato por el puerto serial.
		 mov R16,R18;Copia la Instrucción a R17.
		 call trans;Envia el dato por el puerto serial.
		 nop;
		 ;call Retardo;
         jmp Inicio;Regresa al inicio a detectar el teclado matricial.

Fila_1: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_1; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_2; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x40 para prender z si son iguales.
         breq Op_3; Si es distinto de 0x00 sigue verificando.
		 jmp Op_A;Como es distinto es la Tecla A.

Fila_2: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_4; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_5; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x40 para prender z si son iguales.
         breq Op_6; Si es distinto de 0x00 sigue verificando.
		 jmp Op_B;Como es distinto es la Tecla B.

Fila_3: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_7; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_8; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x40 para prender z si son iguales.
         breq Op_9; Si es distinto de 0x00 sigue verificando.
		 jmp Op_C;Como es distinto es la Tecla C.

Fila_4: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_B; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_0; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x40 para prender z si son iguales.
         breq Op_B; Si es distinto de 0x00 sigue verificando.
		 jmp Op_D;Como es distinto es la Tecla D.

Op_0:    nop;
         jmp Inicio;Devuele a la rutina.
Op_1:    ldi R18,248;Carga 248.
         ldi R19,0x00;Identifica que mando la opción 1. 
         nop;    
         jmp Regresa;Devuele a la rutina.
Op_2:    ldi R18,236;Carga 236.
         ldi R19,0x00;Identifica que mando la opción 1.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_3:    ldi R18,178;Carga 178.
         ldi R19,0x00;Identifica que mando la opción 1.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_4:    ldi R18,0x30;Pone el motor en izquierda.
         ldi R19,0x01;Identifica que mando la opción 2.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_5:    ldi R18,0x00;Pone el motor en paro.
         ldi R19,0x01;Identifica que mando la opción 2.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_6:    ldi R18,0x20;Pone el motor en derecha.
         ldi R19,0x01;Identifica que mando la opción 2.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_7:    nop;
         jmp Inicio;Devuele a la rutina.
Op_8:    nop;
         jmp Inicio;Devuele a la rutina.
Op_9:    nop;
         jmp Inicio;Devuele a la rutina.
Op_A:    nop;
         jmp Inicio;Devuele a la rutina.
Op_B:    nop;
         jmp Inicio;Devuele a la rutina.
Op_C:    nop;
         jmp Inicio;Devuele a la rutina.
Op_D:    nop;
         jmp Inicio;Devuele a la rutina.
Op_E:    nop;
         jmp Inicio;Devuele a la rutina.
Op_F:    nop;
         jmp Inicio;Devuele a la rutina.

trans:  lds R17,UCSR0A;
        sbrs R17,UDRE0;Verifica el bit Registro Vacío.
        rjmp trans;
        sts UDR0,R16;Mueve el dato al registro de transmición.
trans1: lds R17,UCSR0A;
        sbrs R17,TxC0;Verifica el bit de transmición.
        rjmp trans1;
        ret;

Retardo:
         ; ============================= 
         ;    delay loop generator 
         ;     500000 cycles:
         ; ----------------------------- 
         ; delaying 499995 cycles:
          ldi  R17, $0F
WGLOOP0:  ldi  R18, $37
WGLOOP1:  ldi  R19, $C9
WGLOOP2:  dec  R19
          brne WGLOOP2
          dec  R18
          brne WGLOOP1
          dec  R17
          brne WGLOOP0
        ; -----------------------------  
        ; delaying 3 cycles:
          ldi  R17, $01
WGLOOP3:  dec  R17
          brne WGLOOP3
       ; ----------------------------- 
       ; delaying 2 cycles:
          nop
          nop
       ; ============================= 
	    ret;


