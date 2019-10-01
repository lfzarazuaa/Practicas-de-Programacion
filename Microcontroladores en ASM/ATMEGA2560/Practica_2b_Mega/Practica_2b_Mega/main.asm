;
; Practica_2b_Mega.asm
;
; Created: 06/03/2019 06:20:55 p.m.
; Author : Sanorte
;

.include "m2560def.inc";Archivo de definicion de etiquetas.; Replace with your application code
; Replace with your application code
 .equ contador1b=$201;
 .equ contador1a=$202;
 .org $0000 jmp config;
 .org $0002 jmp INT_0 ; INT0.
 .org $0004 jmp INT_1 ; INT1.
 INT_0:
        ;Contador de pulsos.
		lds r24,contador1a;
		lds r25,contador1b;
        adiw r24,1;
		sts contador1b,r25;
		sts contador1a,r24;
		call mostrar;
		reti;
 INT_1:
        ;Resetear contadores.
	    clr r16;
		sts contador1b,r16;
		sts contador1a,r16;
		call mostrar;
	    reti;
mostrar:
        lds r16,contador1b;
		sts portk,r16;
		lds r16,contador1a;
		out portf,r16;
		ret;
config:
      ldi r16,$ff;Carga 0x00 a r16;
	  sts ddrk,r16;Configura puerto k como entradas.
	  out ddrf,r16;Configura puerto f como entradas.
	  ldi r16,$00;Carga 0x00 a r16;
	  out ddrb,r16;Configura puerto b como entradas.
	  ser r16;Carga 0xFF a r16;
	  out portb,r16;Configura puerto b con pullup.
	  ;Configurar INT0 e INT1.
	   ldi r16,(0<<ISC30)|(0<<ISC20)|(3<<ISC10)|(1<<ISC00);
	   sts eicra,r16;Configura int0 en flanco de subida e int1 en falnco de bajada.
	   ldi r16,(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(1<<INT1)|(1<<INT0);
	   out eimsk,r16;Activa int0 e int1.
	  sei;
inicio:
       
	   jmp inicio;
	 
