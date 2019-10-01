/*
 * Practica_5a.asm
 *
 *  Created: 12/05/2016 09:42:54 p.m.
 *   Author: Luis
 */
 //RECEPCION SERIAL

.org 0x000 jmp config;
.org 0x024 jmp recep;
.equ Reg_1=0x0100;
.equ Reg_2=0x0101;
config: ldi R16, LOW(RAMEND);
        out spl, R16;
        ldi R16, HIGH(RAMEND);
        out sph, R16;
        clr R16;
        out DDRB, R16;Configura el puerto B.
        ldi R16,0xFE;
        out DDRD, R16;Configura el puerto D.
		ldi R16,0x0C;
        out DDRC, R16;Configura el puerto C.
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

inicio: nop;
		sbis pinC,4;
        jmp inicio;Regresa si el Pin2D es 0;
		in R16,pinB;Carga a R16 el dato a enviar.
        call trans;Envia el dato por el puerto serial.
		call Retardo;LLama a un retardo
        jmp inicio;Regresa al inicio.

trans:  lds R17,UCSR0A;
        sbrs R17,UDRE0;Verifica el bit Registro Vacío.
        rjmp trans;
        sts UDR0,R16;Mueve el dato al registro de transmición.
trans1: lds R17,UCSR0A;
        sbrs R17,TxC0;Verifica el bit de transmición.
        rjmp trans1;
        ret;

;     200000 cycles:
; ----------------------------- 
; delaying 199998 cycles:
Retardo:
          push R17;
		  push R18;
		  push R19;
          ldi  R17, $06;
WGLOOP0:  ldi  R18, $37;
WGLOOP1:  ldi  R19, $C9;
WGLOOP2:  dec  R19;
          brne WGLOOP2;
          dec  R18;
          brne WGLOOP1;
          dec  R17;
          brne WGLOOP0;
; ----------------------------- 
; delaying 2 cycles:
          nop;
          nop;
		  pop R19;
		  pop R18;
		  pop R17;
; =============================
          ret;


recep:  ;lds R16,UCSR0A;
        ; sbrs R16,7;
        ;rjmp recep;
		push R17;
		push R16;
        lds R17,UDR0;Guarda el valor obtenido.
		mov R16,R17;Pasa el valor a R16.
		andi R16,0x03;
        sts Reg_1,R16;Guarda los dos bits bajos del dato recibido.
		mov R16,R17;
		andi R16,0xFC;
		sts Reg_2,R16;Guarda los seis bits altos del dato recibido.
Ver_A:	lds R16,Reg_1;
		sbrc R16,0;
		jmp R_1A;
R_0A:   cbi PortC,2;
        jmp Ver_B
R_1A:   sbi PortC,2;
Ver_B:  lds R16,Reg_1;
		sbrc R16,1;
		jmp R_1B;
R_0B:   cbi PortC,3;
        jmp Ver_C;
R_1B:   sbi PortC,3;
Ver_C:  lds R16,Reg_2;
        out PortD,R16;              
		pop R16;
		pop R17;
		reti;