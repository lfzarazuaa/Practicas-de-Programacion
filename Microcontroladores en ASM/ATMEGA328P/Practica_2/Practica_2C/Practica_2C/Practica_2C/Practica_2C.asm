/*
 * Practica_2C.asm
 *
 *  Created: 31/03/2016 10:02:41 a.m.
 *   Author: Luis
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
         ldi R16,0x60;Carga la constante 0x60.
         out DDRD, R16; Configura el puerto D del 5 al 6 como salida y los demas como entrada.
         clr R16;
         out DDRC, R16; Configura el puerto D como entrada.
         ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
         out SPL,R16;Carga el Stack pointer low con la direccion correcta.
         ldi R16,high(RAMEND);Carga el nivel alto de la pila.
         out SPH,R16;Carga el Stack pointer high con la direccion correcta.
		 ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A activo en toggle y B desactivado.
         ldi R16,0x02; Carga 0x02 a R16.
         out TCCR0B,R16; Usar el prescalador a un factor de 8.
         ldi R16,0x00;Limpia el registro.
         out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0 y COMP(A,B).
         ldi R16,0x00; Carga 0x00 a R16.
         sts TIMSK0,R16; Deshabilita la interrupción de COMPB.
         sei;Habilita interrupciones globales.
         clr R17;
         ldi R16,0x00;Limpia R16.
         out TCNT0,R16;Carga inicial del Timer0.
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
		 ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
		 ldi R16,Tecla_N;Carga el valor de la Tecla Nula a R16.
Regresa: out OCR0A,R16;Manda al registro de comparación el valor obtenido.
         cpi R16,Tecla_N;Compara si se esta generando un sonido.
		 breq Inicio;Si es una tecla nula vuelve a leer el teclado.
		 call Retardo;
         jmp Inicio;

Fila_1: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_1; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_2; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x10 para prender z si son iguales.
         breq Op_3; Si es distinto de 0x00 sigue verificando.
		 jmp Op_A;Como es distinto es la Tecla A.

Fila_2: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_4; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_5; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x10 para prender z si son iguales.
         breq Op_6; Si es distinto de 0x00 sigue verificando.
		 jmp Op_B;Como es distinto es la Tecla B.

Fila_3: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_7; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_8; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x10 para prender z si son iguales.
         breq Op_9; Si es distinto de 0x00 sigue verificando.
		 jmp Op_C;Como es distinto es la Tecla C.

Fila_4: 
		 cpi R16, 0x10;Resta 0x10 para prender z si son iguales.
         breq Op_B; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x20;Resta 0x20 para prender z si son iguales.
         breq Op_0; Si es distinto de 0x00 sigue verificando.
		 cpi R16, 0x40;Resta 0x10 para prender z si son iguales.
         breq Op_B; Si es distinto de 0x00 sigue verificando.
		 jmp Op_D;Como es distinto es la Tecla D.

Op_0:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_0;Carga el valor de la Tecla 0.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_1:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_1;Carga el valor de la Tecla 1.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_2:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_2;Carga el valor de la Tecla 2.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_3:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_3;Carga el valor de la Tecla 3.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_4:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_4;Carga el valor de la Tecla 4.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_5:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_5;Carga el valor de la Tecla 5.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_6:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_6;Carga el valor de la Tecla 6.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_7:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_7;Carga el valor de la Tecla 7.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_8:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_8;Carga el valor de la Tecla 8.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_9:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_9;Carga el valor de la Tecla 9.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_A:    ldi R16,0x42;Carga 0x42.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Activo en toggle y B desactivado.
         ldi R16,Tecla_A;Carga el valor de la Tecla A.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_B:    ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
         ldi R16,Tecla_B;Carga el valor de la Tecla B.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_C:    ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
         ldi R16,Tecla_C;Carga el valor de la Tecla C.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_D:    ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
         ldi R16,Tecla_D;Carga el valor de la Tecla D.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_E:    ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
         ldi R16,Tecla_E;Carga el valor de la Tecla E.
         jmp Regresa;Devuele para cargar el valor al Puerto D.
Op_F:    ldi R16,0x02;Carga 0x02.
         out TCCR0A,R16;Pone el Registro TCCR0A en CTC con Comp A Desactivo en toggle y B desactivado.
         ldi R16,Tecla_F;Carga el valor de la Tecla F.
         jmp Regresa;Devuele para cargar el valor al Puerto D.

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