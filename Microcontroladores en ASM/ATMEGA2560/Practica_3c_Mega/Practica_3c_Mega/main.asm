;
; Practica_3c_Mega.asm
;
; Created: 07/03/2019 09:59:14 p.m.
; Author : Sanorte
;


.include "m2560def.inc";Archivo de definicion de etiquetas.
; Replace with your application code
 .equ TCNT1_IN=0;
 .equ TCNT3_IN=34286;0.5 s a 16M/256
 .equ tecla=$200;
 .equ combinacion=$202;
 .equ valorest=$250;
 .equ Nota=$280;
.equ       Car0='0'; 
.equ       Car1='1'; 
.equ       Car2='2'; 
.equ       Car3='3'; 
.equ       Car4='4'; 
.equ       Car5='5'; 
.equ       Car6='6'; 
.equ       Car7='7'; 
.equ       Car8='8'; 
.equ       Car9='9'; 
.equ       CarA=58; 
.equ       CarB=59; 
.equ       CarC=60; 
.equ       CarD=61; 
.equ       CarAs=62; 
.equ       CarNum=63;
.equ       CarN='n';
.equ       pull=$F0;
.equ       Nota0=$FFF0;
.equ       Nota1=30577;
.equ       Nota2=28861;
.equ       Nota3=27241;
.equ       Nota4=24269;
.equ       Nota5=22907;
.equ       Nota6=21621;
.equ       Nota7=19262;
.equ       Nota8=18180;
.equ       Nota9=17160;
.equ       Nota10=25712;
.equ       Nota11=20407;
.equ       Nota12=16197;
.equ       Nota13=$FFFD;
.equ       Nota14=$FFFE;
.equ       Nota15=$FFFF;
.equ       Nota16=$FFE0;
.org $0000 jmp config;
.org $0016 jmp PC_INT2; PCINT2
.org $0046 jmp TIMER3_OVF ; Timer3 Overflow.
TIMER3_OVF:
           ldi r16,(0<<ICIE3)|(0<<OCIE3C)|(0<<OCIE3B)|(0<<OCIE3A)|(0<<TOIE3);Desactivar timer 3 ovf.
           sts timsk3,r16;TIMSK3
		   ldi r16,(0<<COM1A0)|(0<<COM1B0)|(0<<COM1C0)|(0<<WGM10);Desactivar CTC.
	       sts tccr1a,r16; TCCR1A
		   reti;
 PC_INT2:
        lds r16,pink;
		cpi r16,$F0;
		breq Parar;
		jmp Contar;
Parar:
        jmp Regreso;
Contar:; 
;Fila1
        ldi r16,pull|(0b1110);
		sts portk,r16;
		lds r16,pink;
		andi r16,pull;
		swap r16;
		call decfila;
		cpi r16,CarN;
		brne Tecla_Obtenida;
;Fila2
		ldi r16,pull|(0b1101);
		sts portk,r16;
		lds r16,pink;
		andi r16,pull;
		swap r16;
		ldi r17,$10;
		add r16,r17;
		call decfila;
		cpi r16,CarN;
		brne Tecla_Obtenida;
;Fila3
		ldi r16,pull|(0b1011);
		sts portk,r16;
		lds r16,pink;
		andi r16,pull;
		swap r16;
		ldi r17,$20;
		add r16,r17;
		call decfila;
		cpi r16,CarN;
		brne Tecla_Obtenida;
;Fila4
		ldi r16,pull|(0b0111);
		sts portk,r16;
		lds r16,pink;
		andi r16,pull;
		swap r16;
		ldi r17,$30;
		add r16,r17;
		call decfila;
		cpi r16,CarN;
		breq Regreso;
Tecla_Obtenida:
        sts tecla,r16;
		ldi r17,$30;
		sub r16,r17;
		call decnota;
		sts nota,r16;
		sts nota+1,r17;
		sts ocr1ah,r17;
	    sts ocr1al,r16;
	    sts ocr1bh,r17;
	    sts ocr1bl,r16;
	    sts ocr1ch,r17;
	    sts ocr1cl,r16;
		ldi r16,(1<<COM1A0)|(1<<COM1B0)|(1<<COM1C0)|(0<<WGM10);Activar CTC.
	    sts tccr1a,r16; TCCR1A
		ldi r16,high(TCNT3_IN);Carga inicial del timer.
	    sts tcnt3h,r16;TCNT1H	
	    ldi r16,low(TCNT3_IN);
	    sts tcnt3l,r16;TCNT1L
		ldi r16,(0<<ICIE3)|(0<<OCIE3C)|(0<<OCIE3B)|(0<<OCIE3A)|(1<<TOIE3);Activar timer 3 ovf.
        sts timsk3,r16;TIMSK3
		ldi r16,0b11110000;
	    sts portk,r16;Pullups en nibble alto y nivel bajo en nibble bajo.
Regreso:
		reti;
decfila:
      ldi r27,high(combinacion);
	  ldi r26,low(combinacion);
	  add r26,r16;
	  ld  r16,X;
	  ret;
decnota:
      ldi r27,high(valorest);
	  ldi r26,low(valorest);
	  add r16,r16;
	  add r26,r16;
	  ld  r16,X+;
	  ld  r17,X;
	  ret;

 config:
	  ;Entradas y salidas
	  ldi r16,0b11100000;
	  out ddrb,r16;Salidas de CTC.
	  ldi r16,0b00001111;Nibble alto Entrada,nibble bajo salidas.
	  sts ddrk,r16;
	  ldi r16,0b11110000;
	  sts portk,r16;Pullups en nibble alto y nivel bajo en nibble bajo.
	  ;Configuracion de la pila
	  ldi r16,low(RAMEND);Carga el nivel bajo de la pila.
      out SPL,r16;Carga el Stack pointer low con la dirección correcta.
      ldi r16,high(RAMEND);Carga el nivel alto de la pila.
      out SPH,r16;Carga el Stack pointer high con la dirección correcta.
	  ;Activar interrupciones del puerto K
	  ldi r16,(1<<PCIE2)|(0<<PCIE1)|(0<<PCIE0);
	  sts pcicr,r16;PCICR Activa las interrupciones de la mascara 2.
	  ldi r16,(1<<PCINT23)|(1<<PCINT22)|(1<<PCINT21)|(1<<PCINT20);
	  sts pcmsk2,r16;PCMSK2 Activa las interrupciones del nibble alto.
	  ;Timer1 CTC para Notas
	  ldi r16,(0<<COM1A0)|(0<<COM1B0)|(0<<COM1C0)|(0<<WGM10);Operacion CTC COM1n1:0=0
	  sts tccr1a,r16; TCCR1A
	  ldi r16,(0<<ICNC1)|(0<<ICES1)|(1<<WGM12)|(1<<CS10);WGM13:0 = 0 Modo CTC 
	  sts tccr1b,r16; TCCR1B CS12:0=2 clkI/O/1
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
      ldi r16,(0<<ICIE1)|(0<<OCIE1C)|(0<<OCIE1B)|(0<<OCIE1A)|(0<<TOIE1);
      sts timsk1,r16;TIMSK1 Sin Interupciones en Timer1.
      ;Configurar TIM3_OVF
	  ldi r16,(0<<COM3A0)|(0<<COM3B0)|(0<<COM3C0)|(0<<WGM30);Operacion normal COM3n1:0=0
	  sts tccr3a,r16; TCCR3A
	  ldi r16,(0<<ICNC3)|(0<<ICES3)|(0<<WGM32)|(4<<CS30);WGM13:0 = 0 Modo normal 
	  sts tccr3b,r16; TCCR3B CS32:0=2 clkI/O/256
	  ldi r16,(0<<FOC3A)|(0<<FOC3B)|(0<<FOC3C);Sin forzar comparaciones.
	  sts tccr3c,r16;TCCR1C
	  ldi r16,high(TCNT3_IN);Carga inicial del timer.
	  sts tcnt3h,r16;TCNT1H	
	  ldi r16,low(TCNT3_IN);
	  sts tcnt3l,r16;TCNT1L
	  clr r16;
	  sts ocr3ah,r16;
	  sts ocr3al,r16;
	  sts ocr3bh,r16;
	  sts ocr3bl,r16;
	  sts ocr3ch,r16;
	  sts ocr3cl,r16;
      ldi r16,(0<<ICIE3)|(0<<OCIE3C)|(0<<OCIE3B)|(0<<OCIE3A)|(0<<TOIE3);
      sts timsk3,r16;TIMSK1
	  ;Guardar en RAM
		ldi r16,Car1 sts combinacion,r16;
		ldi r16,Car2 sts combinacion+1,r16;
		ldi r16,Car1 sts combinacion+2,r16;
		ldi r16,Car3 sts combinacion+3,r16;
		ldi r16,Car1 sts combinacion+4,r16;
		ldi r16,Car2 sts combinacion+5,r16;
		ldi r16,Car1 sts combinacion+6,r16;
		ldi r16,CarA sts combinacion+7,r16;
		ldi r16,Car1 sts combinacion+8,r16;
		ldi r16,Car2 sts combinacion+9,r16;
		ldi r16,Car1 sts combinacion+10,r16;
		ldi r16,Car3 sts combinacion+11,r16;
		ldi r16,Car1 sts combinacion+12,r16;
		ldi r16,Car2 sts combinacion+13,r16;
		ldi r16,Car1 sts combinacion+14,r16;
		ldi r16,CarN sts combinacion+15,r16;
		ldi r16,Car4 sts combinacion+16,r16;
		ldi r16,Car5 sts combinacion+17,r16;
		ldi r16,Car4 sts combinacion+18,r16;
		ldi r16,Car6 sts combinacion+19,r16;
		ldi r16,Car4 sts combinacion+20,r16;
		ldi r16,Car5 sts combinacion+21,r16;
		ldi r16,Car4 sts combinacion+22,r16;
		ldi r16,CarB sts combinacion+23,r16;
		ldi r16,Car4 sts combinacion+24,r16;
		ldi r16,Car5 sts combinacion+25,r16;
		ldi r16,Car4 sts combinacion+26,r16;
		ldi r16,Car6 sts combinacion+27,r16;
		ldi r16,Car4 sts combinacion+28,r16;
		ldi r16,Car5 sts combinacion+29,r16;
		ldi r16,Car4 sts combinacion+30,r16;
		ldi r16,CarN sts combinacion+31,r16;
		ldi r16,Car7 sts combinacion+32,r16;
		ldi r16,Car8 sts combinacion+33,r16;
		ldi r16,Car7 sts combinacion+34,r16;
		ldi r16,Car9 sts combinacion+35,r16;
		ldi r16,Car7 sts combinacion+36,r16;
		ldi r16,Car8 sts combinacion+37,r16;
		ldi r16,Car7 sts combinacion+38,r16;
		ldi r16,CarC sts combinacion+39,r16;
		ldi r16,Car7 sts combinacion+40,r16;
		ldi r16,Car8 sts combinacion+41,r16;
		ldi r16,Car7 sts combinacion+42,r16;
		ldi r16,Car9 sts combinacion+43,r16;
		ldi r16,Car7 sts combinacion+44,r16;
		ldi r16,Car8 sts combinacion+45,r16;
		ldi r16,Car7 sts combinacion+46,r16;
		ldi r16,CarN sts combinacion+47,r16;
		ldi r16,CarAs sts combinacion+48,r16;
		ldi r16,Car0 sts combinacion+49,r16;
		ldi r16,CarAs sts combinacion+50,r16;
		ldi r16,CarNum sts combinacion+51,r16;
		ldi r16,CarAs sts combinacion+52,r16;
		ldi r16,Car0 sts combinacion+53,r16;
		ldi r16,CarAs sts combinacion+54,r16;
		ldi r16,CarD sts combinacion+55,r16;
		ldi r16,CarAs sts combinacion+56,r16;
		ldi r16,Car0 sts combinacion+57,r16;
		ldi r16,CarAs sts combinacion+58,r16;
		ldi r16,CarNum sts combinacion+59,r16;
		ldi r16,CarAs sts combinacion+60,r16;
		ldi r16,Car0 sts combinacion+61,r16;
		ldi r16,CarAs sts combinacion+62,r16;
		ldi r16,CarN sts combinacion+63,r16;
		;Cargas Notas
		ldi r16, low(Nota0) sts valorest+0,r16 ldi r16, high(Nota0) sts valorest+1,r16;
		ldi r16, low(Nota1) sts valorest+2,r16 ldi r16, high(Nota1) sts valorest+3,r16;
		ldi r16, low(Nota2) sts valorest+4,r16 ldi r16, high(Nota2) sts valorest+5,r16;
		ldi r16, low(Nota3) sts valorest+6,r16 ldi r16, high(Nota3) sts valorest+7,r16;
		ldi r16, low(Nota4) sts valorest+8,r16 ldi r16, high(Nota4) sts valorest+9,r16;
		ldi r16, low(Nota5) sts valorest+10,r16 ldi r16, high(Nota5) sts valorest+11,r16;
		ldi r16, low(Nota6) sts valorest+12,r16 ldi r16, high(Nota6) sts valorest+13,r16;
		ldi r16, low(Nota7) sts valorest+14,r16 ldi r16, high(Nota7) sts valorest+15,r16;
		ldi r16, low(Nota8) sts valorest+16,r16 ldi r16, high(Nota8) sts valorest+17,r16;
		ldi r16, low(Nota9) sts valorest+18,r16 ldi r16, high(Nota9) sts valorest+19,r16;
		ldi r16, low(Nota10) sts valorest+20,r16 ldi r16, high(Nota10) sts valorest+21,r16;
		ldi r16, low(Nota11) sts valorest+22,r16 ldi r16, high(Nota11) sts valorest+23,r16;
		ldi r16, low(Nota12) sts valorest+24,r16 ldi r16, high(Nota12) sts valorest+25,r16;
		ldi r16, low(Nota13) sts valorest+26,r16 ldi r16, high(Nota13) sts valorest+27,r16;
		ldi r16, low(Nota14) sts valorest+28,r16 ldi r16, high(Nota14) sts valorest+29,r16;
		ldi r16, low(Nota15) sts valorest+30,r16 ldi r16, high(Nota15) sts valorest+31,r16;
		ldi r16, low(Nota16) sts valorest+32,r16 ldi r16, high(Nota16) sts valorest+33,r16;
		sei;	
inicio:
	   nop;
	   jmp inicio;