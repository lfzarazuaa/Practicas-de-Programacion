/*
 * Practica_5_Rx.asm
 *
 *  Created: 13/05/2016 10:09:56 a. m.
 *   Author: LuisFernando
 */ 
 //RECEPCION SERIAL

.org 0x000 jmp config;
.org 0x024 jmp recep;

config: ldi R16, LOW(RAMEND);
        out spl, R16;
        ldi R16, HIGH(RAMEND);
        out sph, R16;
        ser R16;
        out DDRB, R16;
        ldi R16,0xFE;
        out DDRD, R16;
        ldi R16,0x90;
        sts UCSR0B, R16;Configura la transmisición con Interrupción por Rx y con Rx activado.
        ldi R16,0x06;
        sts UCSR0C, R16;Configura la transmisición Asincrona, sin paridad, con 1 bit de parada y 8 bits.
        clr R16;
        sts UBRR0H, R16;
        ldi R16,25;
        sts UBRR0L, R16;Configura los BAUDS a 2400 con un reloj de 1 MHz.          
        sei;
		jmp inicio;

inicio: out portB,R16;     
        nop;
        jmp inicio;

recep:  ;lds R16,UCSR0A;
        ; sbrs R16,7;
        ;rjmp recep;
        lds R16,UDR0;
        reti;
