/*
 * MAX_DISPLAY.asm
 *
 *  Created: 30/12/2016 06:27:28 p. m.
 *   Author: LuisFernando
 */ 
 .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio
 .equ Byte_Alto=0x100; Define el lugar de la RAM donde se guarda el dato del Byte Alto.
 .equ Byte_Bajo=0x101; Define el lugar de la RAM donde se guarda el dato del Byte Bajo.
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

Inicializar_Max:
   ;------Operación Normal----------
   ldi R16,0x0C;
   sts Byte_Alto,R16;
   ldi R16,0x01;
   sts Byte_Bajo,R16;Operación Normal 0x0C01.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Todos los dígitos Activados----------
   ldi R16,0x0B;
   sts Byte_Alto,R16;
   ldi R16,0x07;
   sts Byte_Bajo,R16;Todos los digitos Activados 0x0B07.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Intensidad Moderada----------
   ldi R16,0x0A;
   sts Byte_Alto,R16;
   ldi R16,0x08;
   sts Byte_Bajo,R16;Intensidad Moderada 0x0A08.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Decodificar todos----------
   ldi R16,0x09;
   sts Byte_Alto,R16;
   ldi R16,0xFF;
   sts Byte_Bajo,R16;Decodificar todos 0x09FF.
   call Actualizar_Max;%Carga un Word al registro SPI.
Inicio:
   ;------Colocar un 0 en Display 1----------
   ldi R16,0x01;Display 1.
   sts Byte_Alto,R16;
   ldi R16,0x00;Carácter 0.
   sts Byte_Bajo,R16;Colocar un 0 en Display 1.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Colocar un 1 en Display 2----------
   ldi R16,0x02;
   sts Byte_Alto,R16;
   ldi R16,0x01;
   sts Byte_Bajo,R16;Colocar un 1 en Display 1.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Colocar un 2 en Display 3----------
   ldi R16,0x03;
   sts Byte_Alto,R16;
   ldi R16,0x02;
   sts Byte_Bajo,R16;Colocar un 2 en Display 1.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Colocar un 3 en Display 4----------
   ldi R16,0x04;
   sts Byte_Alto,R16;
   ldi R16,0x03;
   sts Byte_Bajo,R16;Colocar un 3 en Display 4.
   call Actualizar_Max;%Carga un Word al registro SPI.
   ;------Colocar un 3 en Display 4----------
   ldi R16,0x05;
   sts Byte_Alto,R16;
   ldi R16,0x04;
   sts Byte_Bajo,R16;Colocar un 3 en Display 5.
   call Actualizar_Max;%Carga un Word al registro SPI.
Repetir:   
   jmp Repetir;
Actualizar_Max:
   push R17;
   lds R17,Byte_Alto;
   call Transmitir_SPI;Byte Alto
   lds R17,Byte_Bajo;
   call Transmitir_SPI;Byte Bajo
   sbi PortB,DD_SS;
   nop;
   cbi PortB,DD_SS;
   ;in R17,PortB;
   ;sbr R17,DD_SS;
   ;out PortB,R17;
   ;cbr R17,DD_SS;
   ;out PortB,R17;
   pop R17;
   ret;
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

