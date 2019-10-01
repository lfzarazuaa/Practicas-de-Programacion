/*
 * Practica_74595.asm
 *
 *  Created: 27/12/2016 10:18:07 p. m.
 *   Author: LuisFernando
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio
 .equ DD_SS=2;
 .equ DD_MOSI=3;
 .equ DD_SCK=5;
 config: 
   clr R16; Limpia el registro 16.
   ;out DDRB, R16; Configura el puerto B como entrada.
   out DDRC, R16; Configura el puerto C como entrada.
   ser R16;Pone en alto todo el registro.
   out DDRD, R16; Configura el puerto D como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
SPI_MasterInit:;Incicialización de SPI.
; Pone MOSI y SCK como salidas,las demas como entradas
   ldi R16,(1<<DD_MOSI)|(1<<DD_SCK)|(1<<DD_SS);
   out DDRB,R16;
; Habilitar SPI, Maestro, con clk de fck/16,MSB primero
   ldi R16,(1<<SPE)|(1<<MSTR)|(0<<DORD)|(1<<SPR0);
   out SPCR,R16;Cargar el dato al Registro SPI de Control.
   ;ret

inicio:
   ldi R16,0x31;
Incrementar:
   mov R17,R16;
   call Transmitir_SPI;Byte Alto
   inc R16;
   mov R17,R16;
   call Transmitir_SPI;
   call Actualizar_Registro;Byte Bajo
   inc R16;
   call Retardo;
   jmp Incrementar;

;SPI_MasterTransmit
Transmitir_SPI:
   push R16;
; Comienza la transmición de datos (R17)
   out SPDR,R17;Coloca el dato de R17 en SPDR(Registro SPI).
Espera_SPI:
; Espera a una transmisición completa.
   in R16, SPSR;
   sbrs R16, SPIF;
   rjmp Espera_SPI;
   nop;
   pop R16;
   ret;
Actualizar_Registro:
   in R17,PORTB;
   ori R17,0x04;
   out PORTB,R17;
   nop;
   in R17,PORTB;
   andi R17,0xFB;
   out PORTB,R17;
   ret;
Retardo:
; delaying 99990 cycles:
          push R19;
		  push R17;
		  push R16;
WGLOOP3:
          ldi  R16, 0x15
WGLOOP0:  ldi  R17, 0x59
WGLOOP1:  dec  R17
          brne WGLOOP1
          dec  R16
          brne WGLOOP0
; ----------------------------- 
; delaying 9 cycles:
          ldi  R16, 0x03
WGLOOP2:  dec  R16
          brne WGLOOP2
; ----------------------------- 
; delaying 1 cycle:
          nop;
		  dec  R19;
		  brne WGLOOP3;
		  pop R16;
		  pop R17;
		  pop R19;
; =============================
          ret;
