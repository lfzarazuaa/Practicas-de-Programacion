/*
 * Motor.asm
 *
 *  Created: 10/12/2016 07:21:45 p. m.
 *   Author: Sala1
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio
 .org 0x0020 jmp Temp_0;Ejecuta interrupción por Timer 0.
 .org 0x0024 jmp recep;Ejecuta interrupción por Recepción de dato.
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
         ldi R16,0x02; Carga 0X02 a R16.
         out DDRD, R16; Configura el puerto D.
         ldi R16,0xFF;Carga la constante 0xFF.
         out DDRB, R16; Configura el puerto B como salida.
         clr R16;Limpia el registro R16.
         out DDRC, R16; Configura el puerto C como entrada.
         ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
         out SPL,R16;Carga el Stack pointer low con la direccion correcta.
         ldi R16,high(RAMEND);Carga el nivel alto de la pila.
         out SPH,R16;Carga el Stack pointer high con la direccion correcta.
		 ;Configuración Serial
		 ldi R16,0x98;
         sts UCSR0B, R16;Configura la transmisición con Interrupción por Rx con Rx activado y con Tx activado..
         ldi R16,0x06;
         sts UCSR0C, R16;Configura la transmisición Asincrona, sin paridad, con 1 bit de parada y 8 bits.
         clr R16;
         sts UBRR0H, R16;
         ldi R16,25;
         sts UBRR0L, R16;Configura los BAUDS a 2400 con un reloj de 1 MHz.
		 ;
         clr R16;Limpia R16.
         out TCCR0A,R16;Limpia el Registro TCCR0A para dejarlo en modo Normal.
         ldi R16,0x04; Carga 0x04 a R16.
         out TCCR0B,R16; Usar el prescalador a un factor de 256.
         ldi R16,0x00;Limpia TOV0.
         out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0.
         ldi R16,0x01; Carga 0x01 a R16.
         sts TIMSK0,R16; Habilita la interrupción de TIMER0 por overflow.
		 ;
         clr R22;Limpia R22 (Contador de Recepción).
		 clr R23;Limpia R23 (Opción de Velocidad o Estado del motor).
         ldi R20,236;Carga 236.
         out TCNT0,R16;Carga inicial del timer de 236 para lograr la frecuencia de 200Hz.
         clr R21; Pone en paro al motor.
		 sei;Habilita interrupciones globales.
         jmp Inicio;

Temp_0:
        push R16;Guarda el valor de R16 en la pila.
        out TCNT0,R20;Carga inicial del timer para lograr la frecuencia deseada.
		;
		sbrs R21,5;Verifica que R21 en el bit de paro sea 0.
        jmp Parar; Esta apagado y brinca a la etiqueta Parar.
		in R18,PortB;Carga las salidas de PortD a R18.
		andi R18,0x0F;Emascaramiento para obtener el nibble 0.
		cpi R18,0x00;Compara si es 0.
		breq Poner_1;Si es 0 pone en uno para hacer el giro.
        sbrs R21,4; Verifica que el bit 4 sea 0 o 1.
        jmp Derecha;Hace el giro hacia la derecha
		jmp Izquierda;Hace el giro hacia la izquierda.
Parar:
        clr R18;Cargar un cero para parar el motor.
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
        out PortB,R18;Actualizar el motor a pasos.
		ldi R16,0x00;Deshabilita TOV0.
        out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0.
		pop R16;Regresa el dato guardado en la pila a R16.
	    reti;Regresa de la interrupción.

Inicio:
   ;     in<=====PinD
   ;     out=====>PortD
         ;Fila 1
         nop;
         jmp Inicio;Regresa al inicio a detectar el teclado matricial.

recep:  ;lds R16,UCSR0A;
        ; sbrs R16,7;
        ;rjmp recep;
		push R17;
		push R16;
        lds R17,UDR0;Guarda el valor obtenido.
		
		cpi R22, 0x01;Resta 0x01 para prender z si son iguales.
        breq Opcion;Salta a Opcion para asignar dato.
		mov R23,R17;Guarda si es velocidad o estado del motor.
		ldi R22,0x01;Carga para lectura Variable.
		rjmp Fin_int;
Opcion:
        ldi R22,0x00;Carga para lectura de Opción.
		cpi R23, 0x01;Resta 0x01 para prender z si son iguales.
        breq Estado;Salta a Estado para asignar dato.
		mov R20,R17;
		rjmp Fin_int;
Estado:
        mov R21,R17;
Fin_Int:
		pop R16;
		pop R17;
		reti;