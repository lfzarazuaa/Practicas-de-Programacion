;
; Practica_2c_Mega.asm
;
; Created: 06/03/2019 09:18:23 p.m.
; Author : Sanorte
;
.include "m2560def.inc";Archivo de definicion de etiquetas.
; Replace with your application code
 .equ TCNT1_IN=3036;65536-62500.
 .equ contador1b=$201;
 .equ contador1a=$202;
 .org $0000 jmp config;
 .org $0002 jmp INT_0 ; INT0.
 .org $0028 jmp TIM1_OVF ; Timer1 Overflow.
 INT_0:
        ;Contador de pulsos.
		lds r24,contador1a;
		lds r25,contador1b;
        adiw r24,1;
		sts contador1b,r25;
		sts contador1a,r24;
		reti;
TIM1_OVF:
        ;Resetear contadores.
		ldi r16,low(TCNT1_IN);
   	    sts tcnt1l,r16;TCNT1L
	    ldi r16,high(TCNT1_IN);Carga inicial del timer.
	    sts tcnt1h,r16;TCNT1H
		call mostrar;	
	    clr r16;
		sts contador1b,r16;
		sts contador1a,r16;
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
	  ;Configura la pila de datos.
	  ldi r16,high(RAMEND);Carga el nivel alto de la pila.
      out SPH,r16;Carga el Stack pointer high con la dirección correcta.
	  ldi r16,low(RAMEND);Carga el nivel bajo de la pila.
      out SPL,r16;Carga el Stack pointer low con la dirección correcta.
	  ;Configurar INT0.
	   ldi r16,(0<<ISC30)|(0<<ISC20)|(0<<ISC10)|(1<<ISC00);
	   sts eicra,r16;Configura int0 en flanco de subida e int1 en falnco de bajada.
	   ldi r16,(0<<INT7)|(0<<INT6)|(0<<INT5)|(0<<INT4)|(0<<INT3)|(0<<INT2)|(0<<INT1)|(1<<INT0);
	   out eimsk,r16;Activa int0 e int1.
	  ;Configurar TIM1_OVF
	  ldi r16,(0<<COM1A0)|(0<<COM1B0)|(0<<COM1C0)|(0<<WGM10);Operacion normal COM1n1:0=0
	  sts tccr1a,r16; TCCR1A
	  ldi r16,(0<<ICNC1)|(0<<ICES1)|(0<<WGM12)|(4<<CS10);WGM13:0 = 0 Modo normal 
	  sts tccr1b,r16; TCCR1B CS12:0=4 clkI/O/256
	  ldi r16,(0<<FOC1A)|(0<<FOC1B)|(0<<FOC1C);Sin forzar comparaciones.
	  sts tccr1c,r16;TCCR1C
	  ldi r16,high(TCNT1_IN);Carga inicial del timer.
	  sts tcnt1h,r16;TCNT1H	
	  ldi r16,low(TCNT1_IN);
	  sts tcnt1l,r16;TCNT1L
	   
	  clr r16;
	  sts ocr1ah,r16;
	  sts ocr1al,r16;
	  sts ocr1bh,r16;
	  sts ocr1bl,r16;
	  sts ocr1ch,r16;
	  sts ocr1cl,r16;
      ldi r16,(0<<ICIE1)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(1<<TOIE1);
      sts timsk1,r16;TIMSK1
	  sei;
inicio:
       
	   jmp inicio;
