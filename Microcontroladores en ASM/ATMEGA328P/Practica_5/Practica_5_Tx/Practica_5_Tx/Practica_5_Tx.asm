/*
 * Practica_5_Tx.asm
 *
 *  Created: 12/05/2016 09:55:57 p.m.
 *   Author: Luis
 */ 
 //TRANSMISION SERIAL
.org 0x000 jmp config;
config: ldi R16, LOW(RAMEND);
        out spl, R16;
        ldi R16, HIGH(RAMEND);
        out sph, R16;
        ser R16;
        out DDRB, R16;Configura B como salida.
        ldi R16,0xFA;
        out DDRD, R16;Configura el puerto D.
		ldi R16,0x00;
        sts UCSR0B, R16;Configura la transmisición a velocidad doble.
        ldi R16,0x08;
        sts UCSR0B, R16;Configura la transmisición sin Interrupciones, sin noveno bit y con Tx activado.
        ldi R16,0x06;
        sts UCSR0C, R16;Configura la transmisición Asincrona, sin paridad, con 1 bit de parada y 8 bits.
        clr R16;
        sts UBRR0H, R16;
        ldi R16,25;
        sts UBRR0L, R16;Configura los BAUDS a 2400 con un reloj de 1 MHz.          
		jmp inicio;

inicio: sbis pinD,2;
        jmp inicio;Regresa si el Pin2D es 0;
		in R16,pinB;Carga a R16 el dato a enviar.
        call trans;Envia el dato por el puerto serial.
		call Retardo;LLama a un retardo
        jmp inicio;Regresa al inicio.

trans:  sts UDR0,R16;Mueve el dato al registro de transmición.
trans1: lds R17,UCSR0A;
        sbrs R17,5;Verifica el bit de transmición.
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