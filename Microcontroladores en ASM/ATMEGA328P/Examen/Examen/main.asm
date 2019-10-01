;
; Examen.asm
;
; Created: 11/04/2016 10:11:44
; Author : nestor
;


; Replace with your application code
.include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio
 .org 0x0020 jmp Temp_0;Ejecuta interrupción por Timer
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
         clr R16;
         out DDRC, R16; Configura el puerto C como entrada.
         ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
         out SPL,R16;Carga el Stack pointer low con la direccion correcta.
         ldi R16,high(RAMEND);Carga el nivel alto de la pila.
         out SPH,R16;Carga el Stack pointer high con la direccion correcta.
		 ;
         clr R16;Limpia R16.
         out TCCR0A,R16;Limpia el Registro TCCR0A para dejarlo en modo Normal.
         ldi R16,0x04; Carga 0x04 a R16.
         out TCCR0B,R16; Usar el prescalador a un factor de 256.
         ldi R16,0x00;Limpia TOV0.
         out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0
         ldi R16,0x01; Carga 0x01 a R16.
         sts TIMSK0,R16; Habilita la interrupción de TIMER0 por overflow.
         sei;Habilita interrupciones globales.
         clr R17;
         ldi R20,0xEC;Carga 236.
         out TCNT0,R16;Carga inicial del timer de 236 para lograr la frecuencia de 2000Hz.
         clr R21; Pone en paro al motor
         jmp inicio;



Temp_0:
        push R16;
        out TCNT0,R20;Carga inicial del timer.
		;
		sbrs R21,5;Verifica que R21 sea 0.
        jmp Parar; Esta apagado.
		in R18,PortD;Carga las salidas de PortD a R18.
		andi R18,0x0F;Emascaramiento para obtener el nibble 0.
		cpi R18,0x00;Compara si es 0.
		breq Poner_1;Si es 0 pone en uno para hacer el giro.
        sbrs R21,4; Verifica que el bit 4 sea 0 o 1.
        jmp Derecha;Hace el giro hacia la derecha
		jmp Izquierda;Hace el giro hacia la izquierda.
Parar:
        clr R18;Cargar un cero.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Poner_1:
        ldi R18,0x01;Cargar un uno.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Derecha:
        lsr R18;Recorre a la derecha el dato.
		cpi R18,0x00;Compara si es 0.
		breq Cargar_8;Va a la etiqueta para cargar el recorrimiento correcto.
        jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar_8:
        ldi R18,0x08;Carga un 0x08 para el motor a pasos.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Izquierda:
        lsl R18;Recorre a la izquierda el dato.
		cpi R18,0x10;Compara si es 8.
		breq Cargar_1;Va a la etiqueta para cargar el recorrimiento correcto.
        jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar_1:
        ldi R18,0x01;Carga un 0x01 para el motor a pasos.
		jmp Cargar;Va a la etiqueta para cargar el dato al motor a pasos.
Cargar:
        out PortD,R18;Actualizar el motor a pasos.
		ldi R16,0x00;Deshabilita TOV0.
        out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0
		pop R16;
	    reti;Rgresa de la interrupción;

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
		 ldi R16,Tecla_N;Carga el valor de la Tecla Nula a R16.
Regresa: ;
		 nop;
		 ;call Retardo;
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

Op_0:    nop;
         jmp Regresa;Devuele a la rutina.
Op_1:    ldi R20,0x46;Carga 70.  
         nop;    
         jmp Regresa;Devuele a la rutina.
Op_2:    ldi R20,0x1E;Carga 30.
         nop;
         jmp Regresa;Devuele a la rutina..
Op_3:    ldi R20,0x0F;Carga 10.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_4:    ldi R21,0x30;Pone el motor en derecha.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_5:    ldi R21,0x20;Pone el motor en izquierda.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_6:    ldi R21,0x00;Pone el motor en paro.
         nop;
         jmp Regresa;Devuele a la rutina.
Op_7:    nop;
         jmp Regresa;Devuele a la rutina.
Op_8:    nop;
         jmp Regresa;Devuele a la rutina.
Op_9:    nop;
         jmp Regresa;Devuele a la rutina.
Op_A:    nop;
         jmp Regresa;Devuele a la rutina.
Op_B:    nop;
         jmp Regresa;Devuele a la rutina.
Op_C:    nop;
         jmp Regresa;Devuele a la rutina.
Op_D:    nop;
         jmp Regresa;Devuele a la rutina.
Op_E:    nop;
         jmp Regresa;Devuele a la rutina.
Op_F:    nop;
         jmp Regresa;Devuele a la rutina.

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
