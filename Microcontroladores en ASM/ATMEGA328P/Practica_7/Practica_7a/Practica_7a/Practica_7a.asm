/*
 * Practica_7a.asm
 *
 *  Created: 29/05/2016 01:40:10 p. m.
 *   Author: LuisFernando
 */ 
 .org 0x000 jmp config;
 .org 0x0002 jmp INT_0 ; INT0.
 .org 0x0004 jmp INT_1 ; INT1.
.equ       Car_0='0'; Define el valor de la constante para generar un "0" en un display LCD.
.equ       Car_1='1'; Define el valor de la constante para generar un "1" en un display LCD.
.equ       Car_2='2'; Define el valor de la constante para generar un "2" en un display LCD.
.equ       Car_3='3'; Define el valor de la constante para generar un "3" en un display LCD.
.equ       Car_4='4'; Define el valor de la constante para generar un "4" en un display LCD.
.equ       Car_5='5'; Define el valor de la constante para generar un "5" en un display LCD.
.equ       Car_6='6'; Define el valor de la constante para generar un "6" en un display LCD.
.equ       Car_7='7'; Define el valor de la constante para generar un "7" en un display LCD.
.equ       Car_8='8'; Define el valor de la constante para generar un "8" en un display LCD.
.equ       Car_9='9'; Define el valor de la constante para generar un "9" en un display LCD.
.equ       Car_A='A'; Define el valor de la constante para generar la letra "A" en un display LCD.
.equ       Car_B='B'; Define el valor de la constante para generar la letra "B" en un display LCD.
.equ       Car_C='C'; Define el valor de la constante para generar la letra "C" en un display LCD.
.equ       Car_D='D'; Define el valor de la constante para generar la letra "D" en un display LCD.
.equ       Car_E='E'; Define el valor de la constante para generar la letra "E" en un display LCD.
.equ       Car_F='F'; Define el valor de la constante para generar la letra "F" en un display LCD.

.equ       Enable=0; Define el pin del Puerto donde va el Enable.
.equ       RS=1; Define el pin del Puerto donde va RS.

.equ       Dir_DDRAM=0x100; Define el lugar de la RAM donde se guarda el dato(Dirección DDRAM).
.equ       Cod_ASCCI=0x101; Define el lugar de la RAM donde se guarda el dato(Código ASCCI).
.equ       Dir_CGRAM=0x102; Define el lugar de la RAM donde se guarda el dato(Dirección CGRAM).
.equ       Des_Dis=0x103; Define el lugar de la RAM donde se guarda el dato(Descripción del Display).
.equ       EEPROM_Dirh=0x104;Define el lugar de la RAM donde se guarda la dirección alta de la EEPROM.
.equ       EEPROM_Dirl=0x105;Define el lugar de la RAM donde se guarda la dirección baja de la EEPROM.
.equ       EEPROM_Dato=0x106;Define el lugar de la RAM donde se guarda el dato de la EEPROM.
.equ       Bandera_Juego=0x107;;Define el lugar de la RAM donde se guarda la bandera.
config: ldi R16, LOW(RAMEND);
        out spl, R16;
        ldi R16, HIGH(RAMEND);
        out sph, R16;
        ser R16;
		out DDRB, R16;Configura el puerto B.
        ldi R16,0x02;
        out DDRD, R16;Configura el puerto D.
		ldi R16,0x03;
        out DDRC, R16; Configura el puerto C.
		;INTERRUPCIÓN EXTERNA
		ldi R16,0x0F; Carga 0x0F a R16.
        sts EICRA,R16; Configura las interrupciones de INT0 e INT1 en flanco de Subida.
        ldi R16,0x03; Carga 0x01 a R16.
        out EIMSK,R16; Habilita la interrupción de INT0 e INT1.
        ;USART
		call LCD_Inicio;Llama a la función de Inicialización del LCD.
		;Guarda un nuevo caracter en la CGRAM.
		clr R16;
		sts Dir_CGRAM,R16;Carga la dirección 0 al registro asociado con la CGRAM;
		ldi R16,0b00000;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGRAM;Llama a la subrutina para guardar el dato con una dirección inicial.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b00000;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b10001;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b11111;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01110; 
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
		;Termina el guardado del nuevo caracter.
		;Guarda un nuevo caracter en la CGRAM.
		ldi R16,8;
		sts Dir_CGRAM,R16;Carga la dirección 0 al registro asociado con la CGRAM;
		ldi R16,0b10101;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGRAM;Llama a la subrutina para guardar el dato con una dirección inicial.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b10101;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b10101;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01010;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b10101;
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
	    ldi R16, 0b01010; 
		sts Des_Dis,R16;Carga el dato al registro asociado con Descripción del Display;
		call LCD_CGR;Llama a la subrutina para guardar el dato en la dirección siguiente.
		sei;
		jmp inicio;
INT_0:;Botón de pulso.
       push R16;
	   ldi R16,0x00;
	   sts EEPROM_Dirh,R16;
	   inc R17;
	   sts EEPROM_Dirl,R17;
	   sts EEPROM_Dato,R17;
       call ES_EEPROM;
FIN_0:
	   pop R16;
	   reti;
INT_1:;Botón de Inicio.
       call LEER_EEPROM;
	   lds R16,EEPROM_Dato;Carga el dato a R16.
	   reti;
inicio: 
          
FINAL:
          jmp Final;Regresa al inicio.
ES_EEPROM:
          sbic EECR,EEPE;
		  rjmp ES_EEPROM;Espera a que se termine de guardar el dato pasado.
		  ;
		  lds R18,EEPROM_Dirh;Carga la dirección alta a R18.
		  lds R17,EEPROM_Dirl;Carga la dirección baja a R17.
		  lds R16,EEPROM_Dato;Carga el dato a R16.
		  out EEARH,R18;Carga la dirección alta.
		  out EEARL,R17;Carga la dirección baja.
		  out EEDR,R16;Carga la información al registro.
		  sbi EECR,EEMPE;
		  sbi EECR,EEPE;Comienza a escribir el dato poniendo en alto EEPE.
          ret;
LEER_EEPROM:
            sbic EECR,EEPE;
		    rjmp LEER_EEPROM;Espera a que se termine de guardar el dato pasado.
		    ;
		    lds R18,EEPROM_Dirh;Carga la dirección alta a R18.
		    lds R17,EEPROM_Dirl;Carga la dirección baja a R17.
			;
		    out EEARH,R18;Carga la dirección alta.
		    out EEARL,R17;Carga la dirección baja.
			;
		    sbi EECR,EERE;Pone la EEPROM en lectura.
   		    in R16,EEDR;Lee el dato del registro.
			sts EEPROM_Dato,R16;Guarda el dato en EEPROM_Dato.
			ret;
LCD_Inicio: ;Ini. el LCD.
            cbi PortC,RS;Pone en modo Comando al LCD.
		    ldi R16,0x38;
			out PortB,R16;Pone el dato en el Puerto B.
		    call Pulso_E;Ejecuta comando para
		    ldi R16,0x06;
			out PortB,R16;Pone el dato en el Puerto B.
		    call Pulso_E;Ejecuta comando para
		    ldi R16,0x01;
			out PortB,R16;Pone el dato en el Puerto B.
		    call Pulso_E;Ejecuta comando para
		    ldi R16,0x0C;
			out PortB,R16;Pone el dato en el Puerto B.
		    call Pulso_E;Ejecuta comando para
		    ret;
LCD_Cargar: ;Pone la Dirección de la DDRAM y coloca un caracter ASCCI en el LCD.
            cbi PortC,RS;Pone en modo Comando al LCD.
			lds R16,Dir_DDRAM;Carga el dato almacenado para mandarlo a la DDRAM.
			ori R16,0x80;
			out PortB,R16;Pone el dato en el Puerto B.
			call Pulso_E;Realiza la actualización del Dato en el LCD.
			call LCD_Rapido;
		    ret;
LCD_Rapido: ;Pone un caracter ASCII en la dirección que se quedo.
            sbi PortC,RS;Pone en modo Datos al LCD.
			lds R16,Cod_ASCCI;Carga el dato almacenado para mostrarlo en el LCD.
			out PortB,R16;Pone el dato en el Puerto B.
			call Pulso_E;Realiza la actualización del Dato en el LCD.
		    ret;
LCD_CGRAM:; Pone la Dirección de la CGRAM y actualiza un Dato de la CGRAM (0100,0000-0111,1111).
            cbi PortC,RS;Pone en modo Comando al LCD.
			lds R16,Dir_CGRAM;Carga el dato almacenado para mandarlo a la CGRAM.
			ori R16,0x40;
			andi R16,0x7F;
			out PortB,R16;Pone el dato en el Puerto B.
			call Pulso_E;Realiza el comando en el LCD.
			call LCD_CGR;
		    ret;
LCD_CGR:    ;Almacena un Dato en la CGRAM.
            sbi PortC,RS;Pone en modo Datos al LCD.
			lds R16,Des_Dis;Carga el dato almacenado para guardarlo en la LCD.
			out PortB,R16;Pone el dato en el Puerto B.
			call Pulso_E;Realiza la actualización del Dato en el LCD.
		    ret;
LCD_Comando:
            cbi PortC,RS;Pone en modo Comando al LCD.
			lds R16,Dir_DDRAM;Carga el dato almacenado para mandarlo a la DDRAM.
			out PortB,R16;Pone el dato en el Puerto B.
			call Pulso_E;Realiza el comando en el LCD.
			ret;
Pulso_E:;Hace un pulso de reloj para actualizar la información en el LCD.
          sbi PortC,Enable;
		  call Retardo1;
		  cbi PortC,Enable;
		  call Retardo15;
		  ret;
Retardo1:; 1000 Ciclos para 1ms.
		  push R18;
		  push R19;
; ============================= 
;    delay loop generator 
;     995 cycles:
; ----------------------------- 
; delaying 990 cycles:
          ldi  R18, $02;
WGLOOP0A: ldi  R19, $A4;
WGLOOP1A: dec  R19;
          brne WGLOOP1A;
          dec  R18;
          brne WGLOOP0A;
; ----------------------------- 
; delaying 3 cycles:
          ldi  R18, $01;
WGLOOP2A: dec  R18;
          brne WGLOOP2A;
; ----------------------------- 
; delaying 2 cycles:
          nop;
          nop;
; =============================
		  pop R19;
		  pop R18;
          ret;
Retardo15:; 15000 Ciclos para 15ms.
		  push R18;
		  push R19;
; ============================= 
;    delay loop generator 
;     14995 cycles:
; ----------------------------- 
; delaying 14994 cycles:
          ldi  R18, $15;
WGLOOP0B: ldi  R19, $ED;
WGLOOP1B: dec  R19;
          brne WGLOOP1B;
          dec  R18;
          brne WGLOOP0B;
; ----------------------------- 
; delaying 1 cycle:
          nop;
; ============================= 
		  pop R19;
		  pop R18;
          ret;
