;
; Practica_2a_Mega.asm
;
; Created: 06/03/2019 11:51:23 a.m.
; Author : Sanorte
;

 .include "m2560def.inc";Archivo de definicion de etiquetas.; Replace with your application code

.equ       Car_0=$C0; Define el valor de la constante para generar un "0" en un display de 7 segmentos.
.equ       Car_1=$F9; Define el valor de la constante para generar un "1" en un display de 7 segmentos.
.equ       Car_2=$A4; Define el valor de la constante para generar un "2" en un display de 7 segmentos.
.equ       Car_3=$B0; Define el valor de la constante para generar un "3" en un display de 7 segmentos.
.equ       Car_4=$99; Define el valor de la constante para generar un "4" en un display de 7 segmentos.
.equ       Car_5=$92; Define el valor de la constante para generar un "5" en un display de 7 segmentos.
.equ       Car_6=$82; Define el valor de la constante para generar un "6" en un display de 7 segmentos.
.equ       Car_7=$F8; Define el valor de la constante para generar un "7" en un display de 7 segmentos.
.equ       Car_8=$80; Define el valor de la constante para generar un "8" en un display de 7 segmentos.
.equ       Car_9=$90; Define el valor de la constante para generar un "9" en un display de 7 segmentos.
.equ       Car_A=$88; Define el valor de la constante para generar la letra "A" en un display de 7 segmentos.
.equ       Car_B=$83; Define el valor de la constante para generar la letra "B" en un display de 7 segmentos.
.equ       Car_C=$C6; Define el valor de la constante para generar la letra "C" en un display de 7 segmentos.
.equ       Car_D=$A1; Define el valor de la constante para generar la letra "D" en un display de 7 segmentos.
.equ       Car_E=$86; Define el valor de la constante para generar la letra "E" en un display de 7 segmentos.
.equ       Car_F=$8E; Define el valor de la constante para generar la letra "F" en un display de 7 segmentos.

 .equ TCNT0_Inicial=100;
 .equ opciones=$200;
 .equ dado1=$201;
 .equ dado2=$202;
 .org $0000 jmp config;
 .org $0002 jmp INT_0 ; INT0.
 .org $0004 jmp INT_1 ; INT1.
 .org $002E jmp TIM0_OVF ; Timer0 Overflow.
 INT_0:
       ;Leer dados, poner en pausa los contadores y mostrar resultado.
        ldi r16,(0<<OCIE0B)|(0<<OCIE0A)|(0<<TOIE0);
	    sts timsk0,r16;Desactiva la interrupcion por overflow evitando el conteo.
		call Mostrar;
		reti;
 INT_1:
        ;Resetear contadores y ponerlos activos.
	    clr r16;
	    sts dado1,r16;
	    sts dado2,r16;
		ldi r16,(0<<OCIE0B)|(0<<OCIE0A)|(1<<TOIE0);
	    sts timsk0,r16;Activa la interrupcion por overflow continuando el conteo.
		ldi r16,TCNT0_Inicial; Cargar la carga inicial del timer para overflow..
	    out tcnt0,r16;TCNT0 256-156
	    reti;
 TIM0_OVF:
        ldi r16,TCNT0_Inicial; Cargar la carga inicial del timer para overflow.
	    out tcnt0,r16;TCNT0 256-156.
		call Mostrar;
		lds r16,dado1;Leer dado 1.
		inc r16;
		cpi r16,$07;Comparar con 7
		breq Rdado1;
		sts dado1,r16;
	    reti;
Rdado1:
        clr r16;
		sts dado1,r16;
		lds r16,dado2;Leer dado 2.
		inc r16;
		cpi r16,$07;Comparar con 7
		breq Rdado2;
		sts dado2,r16;
		reti;
Rdado2:
        clr r16;
		sts dado2,r16;
		reti;
Mostrar:
		lds r18,dado1;Leer dado 1.
	    call Decodificar;
        out portf,r18;
		lds r18,dado2;Leer dado 2;
	    call Decodificar;
		sts portk,r18;
        ret;
Decodificar:
         cpi r18, 0x09;Resta 0x09 para prender z si son iguales.
         breq Asignar_9; Si es distinto de 0x09 sigue contando.           
         cpi r18, 0x08;Resta 0x08 para prender z si son iguales.
         breq Asignar_8; Si es distinto de 0x08 sigue contando.           
         cpi r18, 0x07;Resta 0x07 para prender z si son iguales.
         breq Asignar_7; Si es distinto de 0x07 sigue contando.           
         cpi r18, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_6; Si es distinto de 0x06 sigue contando.           
         cpi r18, 0x05;Resta 0x05 para prender z si son iguales.
         breq Asignar_5; Si es distinto de 0x05 sigue contando.           
         cpi r18, 0x04;Resta 0x04 para prender z si son iguales.
         breq Asignar_4; Si es distinto de 0x04 sigue contando.           
         cpi r18, 0x03;Resta 0x03 para prender z si son iguales.
         breq Asignar_3; Si es distinto de 0x03 sigue contando.
		 cpi r18, 0x02;Resta 0x02 para prender z si son iguales.
         breq Asignar_2; Si es distinto de 0x02 sigue contando.           
         cpi r18, 0x01;Resta 0x01 para prender z si son iguales.
         breq Asignar_1; Si es distinto de 0x01 sigue contando.           
         jmp Asignar_0;Va a la etiqueta 0.

Asignar_9: ldi r18, ~Car_9;            
           ret;
Asignar_8: ldi r18, ~Car_8;            
           ret;
Asignar_7: ldi r18, ~Car_7;            
           ret;
Asignar_6: ldi r18, ~Car_6;            
           ret;
Asignar_5: ldi r18, ~Car_5;            
           ret;
Asignar_4: ldi r18, ~Car_4;            
           ret;
Asignar_3: ldi r18, ~Car_3;            
           ret;
Asignar_2: ldi r18, ~Car_2;            
           ret;
Asignar_1: ldi r18, ~Car_1;            
           ret;
Asignar_0: ldi r18, ~Car_0;            
           ret;
config:
      ldi r16,$00;Carga 0x00 a r16;
	  out ddrb,r16;Configura puerto b como entradas.
	  out ddrf,r16;Configura puerto f como entradas.
	  sts ddrk,r16;Configura puerto k como entradas.
	  ser r16;Carga 0xFF a r16;
	  out portb,r16;Configura puerto b con pullup.
	  ;Configurar INT0 e INT1.
	   ldi r16,(0<<ISC30)|(0<<ISC20)|(2<<ISC10)|(3<<ISC00);
	   sts eicra,r16;Configura int0 en flanco de subida e int1 en falnco de bajada.
	   ldi r16,(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(1<<INT1)|(1<<INT0);
	   out eimsk,r16;Activa int0 e int1.
	  ;Configurar TIM0_OVF
      ldi r16,(0<<COM0A0)|(0<<COM0B0)|(0<<WGM00);OC0A y OC0B desconectadas. 
	  out tccr0a,r16;TCCR0A
      ldi r16,(0<<FOC0A)|(0<<FOC0B)|(0<<WGM02)|(5<<CS00);WGM02:0 Operacion Normal sin forzar OC0A y OC0B.
	  out tccr0b,r16;TCCR0B CS02:0 clkI/O/1024
	  ldi r16,(0<<OCIE0B)|(0<<OCIE0A)|(1<<TOIE0);
	  sts timsk0,r16;TIMSK0 Habilitar interrupcion por overflow
	  ;out tifr0,r16;TIFR0
	  ldi r16,$00; Poner en 0 los comparadores.
	  out ocr0a,r16;OCR0A
	  out ocr0b,r16;OCR0B
	  ldi r16,TCNT0_Inicial; Cargar la carga inicial del timer para overflow..
	  out tcnt0,r16;TCNT0 256-156
	  clr r16;
	  sts dado1,r16;
	  sts dado2,r16;
	  sei;
inicio:
       
	   jmp inicio;
	  