;
; Practica_3a_Mega.asm
;
; Created: 07/03/2019 08:58:38 a.m.
; Author : Sanorte
;

.include "m2560def.inc";Archivo de definicion de etiquetas.
; Replace with your application code
 .equ TCNT1_IN=57203;57203;65536-8333.
 .equ contador=$200;
 .equ combinacion=$201;
 .equ opciones=$208;
 
 .equ apagado=0;
 .equ giro=1;
 .equ Comb0=0b00001000;
 .equ Comb1=0b00001100;
 .equ Comb2=0b00000100;
 .equ Comb3=0b00000110;
 .equ Comb4=0b00000010;
 .equ Comb5=0b00000011;
 .equ Comb6=0b00000001;
 .equ Comb7=0b00001001;

 .org $0000 jmp config;
 .org $0028 jmp TIM1_OVF ; Timer1 Overflow.
 TIM1_OVF:
        ;Resetear contadores.
		ldi r16,low(TCNT1_IN);
   	    sts tcnt1l,r16;TCNT1L
	    ldi r16,high(TCNT1_IN);Carga inicial del timer.
	    sts tcnt1h,r16;TCNT1H
		lds r16,pink;Lee el puerto k
		sbrs r16,apagado;
		reti;
		sbrs r16,giro;
		jmp Incrementar;
		jmp Decrementar;
Incrementar:
        call Decodificar;
	    lds r16,contador;
	    inc r16;
	    cpi r16,$08;
	    breq IContador;
Incr:	sts contador,r16;
        reti;
IContador:
         clr r16;
         jmp Incr;
Decrementar:
         call Decodificar;
		 lds r16,contador;
	     dec r16;
	     cpi r16,$FF;
	     breq DContador;
Decr:	 sts contador,r16;
         reti;
DContador:
         ldi r16,$07;
         jmp Decr;
Decodificar:
            lds r16,contador;
			ldi r27,high(combinacion);Carga el nivel alto del contador a X. 
	        ldi r26,low(combinacion);Carga el nivel bajo del contador a X.
			add r26,r16;Suma para obtener la direccion correcta.
			ld  r16,X; Carga a r16 lo que hay en la direccion de contador.
			out portf,r16;Coloca el resultado en el puerto f.
            ret;
 config:
      ldi r16,$ff;Carga 0x00 a r16;
	  out ddrf,r16;Configura puerto f como salidas.
	  ldi r16,$00;Carga 0x00 a r16;
	  sts ddrk,r16;Configura puerto k como salidas.
	  out ddrb,r16;Configura puerto b como entradas.
	  ser r16;Carga 0xFF a r16;
	  out portb,r16;Configura puerto b con pullup.
	  sts portk,r16;Configura puerto k con pullup.
	  ;Configura la pila de datos.
	  ldi r16,high(RAMEND);Carga el nivel alto de la pila.
      out SPH,r16;Carga el Stack pointer high con la dirección correcta.
	  ldi r16,low(RAMEND);Carga el nivel bajo de la pila.
      out SPL,r16;Carga el Stack pointer low con la dirección correcta.
	  ;Configurar TIM1_OVF
	  ldi r16,(0<<COM1A0)|(0<<COM1B0)|(0<<COM1C0)|(0<<WGM10);Operacion normal COM1n1:0=0
	  sts tccr1a,r16; TCCR1A
	  ldi r16,(0<<ICNC1)|(0<<ICES1)|(0<<WGM12)|(2<<CS10);WGM13:0 = 0 Modo normal 
	  sts tccr1b,r16; TCCR1B CS12:0=2 clkI/O/8
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
	  ;Combinaciones.
	  ldi r16,Comb0;Guarda la combinacion 0 en r16.
	  sts combinacion,r16;Guarda la combinacion 0 en el registro.
	  ldi r16,Comb1;Guarda la combinacion 1 en r16.
	  sts combinacion+1,r16;Guarda la combinacion 1 en el registro.
	  ldi r16,Comb2;Guarda la combinacion 2 en r16.
	  sts combinacion+2,r16;Guarda la combinacion 2 en el registro.
	  ldi r16,Comb3;Guarda la combinacion 3 en r16.
	  sts combinacion+3,r16;Guarda la combinacion 3 en el registro.
	  ldi r16,Comb4;Guarda la combinacion 4 en r16.
	  sts combinacion+4,r16;Guarda la combinacion 4 en el registro.
	  ldi r16,Comb5;Guarda la combinacion 5 en r16.
	  sts combinacion+5,r16;Guarda la combinacion 5 en el registro.
	  ldi r16,Comb6;Guarda la combinacion 6 en r16.
	  sts combinacion+6,r16;Guarda la combinacion 6 en el registro.
	  ldi r16,Comb7;Guarda la combinacion 7 en r16.
	  sts combinacion+7,r16;Guarda la combinacion 7 en el registro.
	  ldi r16,$00;
	  sts contador,r16;
inicio:
	   
	   jmp inicio;

