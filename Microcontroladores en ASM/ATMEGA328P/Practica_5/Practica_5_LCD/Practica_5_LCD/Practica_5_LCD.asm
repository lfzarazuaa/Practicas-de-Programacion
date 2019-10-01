/*
 * Practica_5_LCD.asm
 *
 *  Created: 13/05/2016 01:33:28 p. m.
 *   Author: LuisFernando
 */ 
 //PRUEBA LCD
.org 0x000 jmp config;
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
		jmp inicio;

inicio: 
          ldi R16,0x80;
		  sts Dir_DDRAM,R16;Carga la dirección 0 al registro asociado con la DDRAM;
		  ldi R20,0x30;
		  sts Cod_ASCCI,R20;Carga el dato al registro asociado con el caracter ASCCI del LCD;
		  call LCD_Cargar;Llama a la subrutina elegir el ASCCI con una dirección inicial.
		  ;
Regreso:  
          inc R20;Incrementa R20.
          sts Cod_ASCCI,R20;Carga el dato al registro asociado con el caracter ASCCI del LCD;
		  call LCD_Rapido;Llama a la subrutina elegir el ASCCI la dirección siguiente.
          cpi R20,0x3F;
		  brne Regreso;Regresa si distinto de 0x3F.
		  ;
		  ldi R16,0xC0;
		  sts Dir_DDRAM,R16;Carga la dirección 0 al registro asociado con la DDRAM;
		  ldi R20,0x00;
		  sts Cod_ASCCI,R20;Carga el dato al registro asociado con el caracter ASCCI del LCD.
		  call LCD_Cargar;Llama a la subrutina elegir el ASCCI con una dirección inicial.
		  ldi R20,0x01;
		  sts Cod_ASCCI,R20;Carga el dato al registro asociado con el caracter ASCCI del LCD;
		  call LCD_Rapido;Llama a la subrutina elegir el ASCCI la dirección siguiente.
          cpi R20,0x3F;
FINAL:
          jmp Final;Regresa al inicio.
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
Decodificar:
         cpi R16, 0x0F;Resta 0x0F para prender z si son iguales.
         breq Asignar_F; Si es distinto de 0x0F sigue contando.           
         cpi R16, 0x0E;Resta 0x0E para prender z si son iguales.
         breq Asignar_E; Si es distinto de 0x0E sigue contando.           
         cpi R16, 0x0D;Resta 0x0D para prender z si son iguales.
         breq Asignar_D; Si es distinto de 0x0D sigue contando.           
         cpi R16, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_C; Si es distinto de 0x0C sigue contando.           
         cpi R16, 0x0C;Resta 0x0C para prender z si son iguales.
         breq Asignar_B; Si es distinto de 0x0B sigue contando.           
         cpi R16, 0x0B;Resta 0x0B para prender z si son iguales.
         breq Asignar_A; Si es distinto de 0x0A sigue contando.
         cpi R16, 0x0A;Resta 0x0A para prender z si son iguales.
         breq Asignar_9; Si es distinto de 0x09 sigue contando.           
         cpi R16, 0x08;Resta 0x08 para prender z si son iguales.
         breq Asignar_8; Si es distinto de 0x08 sigue contando.           
         cpi R16, 0x07;Resta 0x07 para prender z si son iguales.
         breq Asignar_7; Si es distinto de 0x07 sigue contando.           
         cpi R16, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_6; Si es distinto de 0x06 sigue contando.           
         cpi R16, 0x05;Resta 0x05 para prender z si son iguales.
         breq Asignar_5; Si es distinto de 0x05 sigue contando.           
         cpi R16, 0x04;Resta 0x04 para prender z si son iguales.
         breq Asignar_4; Si es distinto de 0x04 sigue contando.           
         cpi R16, 0x03;Resta 0x03 para prender z si son iguales.
         breq Asignar_3; Si es distinto de 0x03 sigue contando.
		 cpi R16, 0x02;Resta 0x02 para prender z si son iguales.
         breq Asignar_2; Si es distinto de 0x02 sigue contando.           
         cpi R16, 0x01;Resta 0x01 para prender z si son iguales.
         breq Asignar_1; Si es distinto de 0x01 sigue contando.           
         jmp Asignar_0;Va a la etiqueta 0.
Asignar_F: ldi R16, Car_F;            
           ret;
Asignar_E: ldi R16, Car_E;            
           ret;
Asignar_D: ldi R16, Car_D;            
           ret;
Asignar_C: ldi R16, Car_C;            
           ret;
Asignar_B: ldi R16, Car_B;            
           ret;
Asignar_A: ldi R16, Car_A;            
           ret;
Asignar_9: ldi R16, Car_9;            
           ret;
Asignar_8: ldi R16, Car_8;            
           ret;
Asignar_7: ldi R16, Car_7;            
           ret;
Asignar_6: ldi R16, Car_6;            
           ret;
Asignar_5: ldi R16, Car_5;            
           ret;
Asignar_4: ldi R16, Car_4;            
           ret;
Asignar_3: ldi R16, Car_3;            
           ret;
Asignar_2: ldi R16, Car_2;            
           ret;
Asignar_1: ldi R16, Car_1;            
           ret;
Asignar_0: ldi R16, Car_0; 
		   ret;


