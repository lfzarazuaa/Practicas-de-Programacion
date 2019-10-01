;
; Practica_3b_Mega.asm
;
; Created: 07/03/2019 04:46:53 p.m.
; Author : Sanorte
;
.include "m2560def.inc";Archivo de definicion de etiquetas.
 .equ incremento=5;
 .org $0000 jmp config;
 .org $0002 jmp INT_0 ; INT0.
 .org $0004 jmp INT_1 ; INT1.
 .org $002A reti
 .org $002C reti
INT_0:
       in r16,ocr0a;
	   subi r16,incremento;
	   brmi minimo;
	   out ocr0a,r16;
	   out ocr0b,r16;
minimo:
	   reti;
INT_1:
       in r16,ocr0a;
	   ldi r17,incremento;
	   add r16,r17;
	   cpi r16,204;
	   brsh maximo;
       out ocr0a,r16;
	   out ocr0b,r16;
maximo:
	   reti;
config:
      ldi r16,(1<<PG5);Carga 0b00010000 a r16;
	  out ddrg,r16;Configura puerto g.
	  ldi r16,(1<<PB7);Carga 0b10000000 a r16;
	  out ddrb,r16;Configura puerto g.
	  clr r16;
	  out portd,r16;Configura puerto d.
	  ldi r16,$03;
	  out portd,r16;Configura puerto d con pullups.
	  ;Configurar INT0 e INT1.
	   ldi r16,(0<<ISC30)|(0<<ISC20)|(2<<ISC10)|(2<<ISC00);
	   sts eicra,r16;Configura int0 en flanco de subida e int1 en flanco de bajada.
	   ldi r16,(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(1<<INT1)|(1<<INT0);
	   out eimsk,r16;Activa int0 e int1.
	  ;Configurar TIM0_OVF
      ldi r16,(2<<COM0A0)|(3<<COM0B0)|(3<<WGM00);OC0A y OC0B activos. 
	  out tccr0a,r16;TCCR0A
      ldi r16,(0<<FOC0A)|(0<<FOC0B)|(0<<WGM02)|(5<<CS00);WGM02:0 Operacion Fast PWM.
	  out tccr0b,r16;TCCR0B CS02:0 clkI/O/64
	  ldi r16,(0<<OCIE0B)|(0<<OCIE0A)|(0<<TOIE0);
	  sts timsk0,r16;TIMSK0 Sin Interrupciones.
	  ;out tifr0,r16;TIFR0
	  ldi r16,$00; Poner en 0 los comparadores.
	  out ocr0a,r16;OCR0A
	  out ocr0b,r16;OCR0B
	  out tcnt0,r16;
	  sei;
start:
    
      rjmp start
