/*
 * Practica_7b.asm
 *
 *  Created: 29/05/2016 02:59:34 p. m.
 *   Author: LuisFernando
 */ 
 .org 0x000 jmp config;
 .org 0x0002 jmp INT_0 ; INT0.
 .org 0x0004 jmp INT_1 ; INT1.

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
.equ       ContadorU=0x108;;Define el lugar de la RAM donde se guarda el Contador de Unidades.
.equ       ContadorD=0x109;;Define el lugar de la RAM donde se guarda el Contador de Decenas.
.equ       ContadorC=0x10A;;Define el lugar de la RAM donde se guarda el Contador de Centenas.
.equ       ContadorM=0x10B;;Define el lugar de la RAM donde se guarda el Contador de Millares.
.equ       ContadorUa=0x10C;;Define el lugar de la RAM donde se guarda el Contador de Unidades ASCII.
.equ       ContadorDa=0x10D;;Define el lugar de la RAM donde se guarda el Contador de Decenas ASCII.
.equ       ContadorCa=0x10E;;Define el lugar de la RAM donde se guarda el Contador de Centenas ASCII.
.equ       ContadorMa=0x10F;;Define el lugar de la RAM donde se guarda el Contador de Millares ASCII.
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
		;Inicializar el LCD
		call LCD_Inicio;Llama a la función de Inicialización del LCD.
		;Inicializar EEPROM
		ldi R16,0x00;
		sts EEPROM_Dirh,R16;
	    ldi R16,0x00;
		sts EEPROM_Dirl,R16;
		call LEER_EEPROM;
	    lds R16,EEPROM_Dato;Carga el dato a R16.
		cpi R16,0x01;
		brne Cargar_EE;
		jmp Continuar;
Cargar_EE:		
        call Carga_Inicial;
		;Guarda un nuevo caracter en la CGRAM.
Continuar:
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
	   ori R24,0x08;Pone el alto el bit 3 de R24 para indicar que hubo una int_0.
	   reti;
INT_1:;Botón de Inicio.
       sbrc R24,2;
	   jmp FIN_1;
	   push R16;
	   ori R24,0x04;Pone en alto el bit para acceder solo una vez al juego.
	   ;call Limpiar_LCD;
	   ;call Jugar;
	   ;call Obtener Datos;
	   ;cbr R24,2;Pone en bajo el bit para poder volver a jugar.
       pop R16;
FIN_1:
	   reti;
;
;ldi R16,0x00;
;	   sts EEPROM_Dirh,R16;
;	   inc R17;
;	   sts EEPROM_Dirl,R17;
;	   sts EEPROM_Dato,R17;
;       call ES_EEPROM;
;FIN_0:
;	   pop R16;
;       call LEER_EEPROM;
;	    lds R16,EEPROM_Dato;Carga el dato a R16.
inicio:   ;PONER PRIMER JUGADOR
          call LCD_1;Pone en la línea 1 del LCD.
          ldi R19,0x00;
Linea_1:  sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x10;
		  brne Linea_1;
		  ;
		  call LCD_2;Pone en la línea 2 del LCD.
		  ldi R19,0x10;
Linea_2:  sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x20;
		  brne Linea_2;
		  ;
		  call retardo_1;
		  call Limpiar_LCD;
		  ;PONER SEGUNDO JUGADOR.
		  call LCD_1;Pone en la línea 1 del LCD.
          ldi R19,0x20;
Linea_1b: sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x30;
		  brne Linea_1b;
		  ;
		  call LCD_2;Pone en la línea 2 del LCD.
		  ldi R19,0x30;
Linea_2b: sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x40;
		  brne Linea_2b;
		  ;
		  call retardo_1;
		  call Limpiar_LCD;
		  ;PONER EL TERCER JUGADOR.
		  call LCD_1;Pone en la línea 1 de la LCD.
          ldi R19,0x40;
Linea_1c: sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x50;
		  brne Linea_1c;
		  ;
		  call LCD_2;Pone en la línea 2 de la LCD.
		  ldi R19,0x50;
Linea_2c: sts EEPROM_Dirl,R19;Carga la dirección baja de la EEPROM.
		  call LEER_EEPROM;Lee el dato de la EEPROM.
          lds R16,EEPROM_Dato;Carga el dato a R16.
		  sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		  call LCD_Rapido;
		  inc R19;Incrementa el registro R19.
		  cpi R19,0x60;
		  brne Linea_2c;
		  ;
		  call retardo_1;
		  call Limpiar_LCD;
FINAL:
          jmp inicio;Regresa al inicio.
retardo_1:
          ; ============================= 
          ;    delay loop generator 
          ;     2000000 cycles:
          ; ----------------------------- 
          ; delaying 1999998 cycles:
          ldi  R20, $12
WGLOOP0C: ldi  R21, $BC
WGLOOP1C: ldi  R22, $C4
WGLOOP2C: sbrc R24,2;
          call Mostar_Juego; 
          dec  R22
          brne WGLOOP2C
          dec  R21
          brne WGLOOP1C
          dec  R20
          brne WGLOOP0C
          ; ----------------------------- 
          ; delaying 2 cycles:
          nop
          ret;
          ; =============================
 Mostar_Juego:
            push R20;
			push R21;
			push R22;
            call Limpiar_LCD;
            call Jugar;
			call Mostrar_Resultado;
			andi R24,0xFB;Pone en bajo el bit 2 para limpiarlo.
			pop R22;
			pop R21;
			pop R20;
			ret;
Mostrar_Resultado:
            ldi R17,0x30;
            lds R16,ContadorU;
			add R16,R17;
			sts ContadorUa,R16;Decodifica ContadorU a ASCII.
			;Decenas
			lds R16,ContadorD;
			add R16,R17;
			sts ContadorDa,R16;Decodifica ContadorD a ASCII.
			;Centenas
			lds R16,ContadorC;
			add R16,R17;
			sts ContadorCa,R16;Decodifica ContadorC a ASCII.
			;Millares
			lds R16,ContadorM;
			add R16,R17;
			sts ContadorMa,R16;Decodifica ContadorM a ASCII.
			;Mostar en el LCD el resultado.
			ldi R16,0x86;
		    sts Dir_DDRAM,R16;
		    call LCD_Comando;Pone en la dirección 80 de la LCD.
			lds R16,ContadorMa;
			sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		    call LCD_Rapido;
			lds R16,ContadorCa;
			sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		    call LCD_Rapido;
			lds R16,ContadorDa;
			sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		    call LCD_Rapido;
			lds R16,ContadorUa;
			sts Cod_ASCCI,R16;Poner el dato en el registro del LCD.
		    call LCD_Rapido;
			call retardo_2;
			;Comparar datos con el primer jugador.
			;---------------------------------------------------------------------
			;Millares
	        ldi R17,0x07;Obtener Dato de Millares.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorMa;
			sub R17,R16;
			brlo Guardar1;Guarda si R17 es menor que R16.
			;Centenas
			ldi R17,0x08;Obtener Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorCa;
			sub R17,R16;
			brlo Guardar1;Guarda si R17 es menor que R16.
			;Decenas
			ldi R17,0x09;Obtener Dato de Decenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorDa;
			sub R17,R16;
			brlo Guardar1;Guarda si R17 es menor que R16.
			;Unidades
			ldi R17,0x0A;Obtener Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorUa;
			sub R17,R16;
			brlo Guardar1;Guarda si R17 es menor que R16.
			jmp Comparar_2;
Guardar1:
            ;Guardar Tercer Lugar
			ldi R17,0x27;
Copiar_3a:  sts EEPROM_Dirl,R17;
			call LEER_EEPROM;Leer Dato de la EEPROM.
			lds R16,EEPROM_Dato;Carga el dato a R16 de la EEPROM.
			sts EEPROM_Dato,R16;
			ldi R16,0x20;Coloca 0x20 en R16.
			add R16,R17;Suma a R16 la dirección de R17.
			sts EEPROM_Dirl,R16;
            call ES_EEPROM;
			inc R17;
			cpi R17,0x2B;
			brne Copiar_3a;
			;Guardar Segundo Lugar
			ldi R17,0x07;
Copiar_2a:  sts EEPROM_Dirl,R17;
			call LEER_EEPROM;Leer Dato de la EEPROM.
			lds R16,EEPROM_Dato;Carga el dato a R16 de la EEPROM.
			sts EEPROM_Dato,R16;
			ldi R16,0x20;Coloca 0x20 en R16.
			add R16,R17;Suma a R16 la dirección de R17.
			sts EEPROM_Dirl,R16;
            call ES_EEPROM;
			inc R17;
			cpi R17,0x0B;
			brne Copiar_2a;
            ;Guardar Primer lugar
			;Dato 7
	        ldi R16,0x07;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorMa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 8
	        ldi R16,0x08;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorCa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 9
	        ldi R16,0x09;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorDa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 10
	        ldi R16,0x0A;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorUa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
            jmp Fin_Comp;
			;Comparar datos con el segundo jugador.
			;---------------------------------------------------------------------
			;Millares
Comparar_2: ldi R17,0x27;Obtner Dato de Millares.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorMa;
			sub R17,R16;
			brlo Guardar2;Guarda si R17 es menor que R16.
			;Centenas
			ldi R17,0x28;Obtner Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorCa;
			sub R17,R16;
			brlo Guardar2;Guarda si R17 es menor que R16.
			;Decenas
			ldi R17,0x29;Obtner Dato de Decenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorDa;
			sub R17,R16;
			brlo Guardar2;Guarda si R17 es menor que R16.
			;Unidades
			ldi R17,0x2A;Obtner Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorUa;
			sub R17,R16;
			brlo Guardar2;Guarda si R17 es menor que R16.
			jmp Comparar_3;
Guardar2:
            ;Primer Lugar
			ldi R17,0x27;
Copiar_3b:  sts EEPROM_Dirl,R17;
			call LEER_EEPROM;Leer Dato de la EEPROM.
			lds R16,EEPROM_Dato;Carga el dato a R16 de la EEPROM.
			sts EEPROM_Dato,R16;
			ldi R16,0x20;Coloca 0x20 en R16.
			add R16,R17;Suma a R16 la dirección de R17.
			sts EEPROM_Dirl,R16;
            call ES_EEPROM;
			inc R17;
			cpi R17,0x2B;
			brne Copiar_3b;
			;Segundo Lugar
			;Dato 7
	        ldi R16,0x27;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorMa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 8
	        ldi R16,0x28;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorCa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 9
	        ldi R16,0x29;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorDa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 10
	        ldi R16,0x2A;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorUa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
            jmp Fin_Comp;
			;Comparar datos con el tercer jugador.
			;---------------------------------------------------------------------
			;Millares
Comparar_3: ldi R17,0x47;Obtener Dato de Millares.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorMa;
			sub R17,R16;
			brlo Guardar3;Guarda si R17 es menor que R16.
			;Centenas
			ldi R17,0x48;Obtener Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorCa;
			sub R17,R16;
			brlo Guardar3;Guarda si R17 es menor que R16.
			;Decenas
			ldi R17,0x49;Obtener Dato de Decenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorDa;
			sub R17,R16;
			brlo Guardar3;Guarda si R17 es menor que R16.
			;Unidades
			ldi R17,0x4A;Obtener Dato de Centenas.
		    sts EEPROM_Dirl,R17;
		    call LEER_EEPROM;
	        lds R17,EEPROM_Dato;Carga el dato a R17.
			lds R16,ContadorUa;
			sub R17,R16;
			brlo Guardar3;Guarda si R17 es menor que R16.
		    jmp Fin_Comp;
Guardar3:
            ;Dato 7
	        ldi R16,0x47;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorMa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 8
	        ldi R16,0x48;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorCa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 9
	        ldi R16,0x49;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorDa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
		    ;Dato 10
	        ldi R16,0x4A;
		    sts EEPROM_Dirl,R16;
		    lds R16,ContadorUa;
		    sts EEPROM_Dato,R16;
            call ES_EEPROM;
Fin_Comp:   ret;
Jugar:    
           ldi R16,0x00;
		   sts ContadorU,R16;
		   sts ContadorD,R16;
		   sts ContadorC,R16;
		   sts ContadorM,R16;
; delaying 1499928 cycles:
           ldi  R20, $08
WGLOOP0D:  ldi  R21, $F8
WGLOOP1D:  ldi  R22, $FB
WGLOOP2D:
	       call Verificar;
; ----------------------------- 
           dec  R22
           brne WGLOOP2D
           dec  R21
           brne WGLOOP1D
           dec  R20
           brne WGLOOP0D
		   ret;
; -----------------------------
Verificar: 
           sbrs R24,3;Verifica que se haya oprimido el botón.
		   jmp Terminar;
		   andi R24,0xF7;Pone en bajo el bit de int.
		   lds R16,ContadorU;Carga el ContadorU a R16.
		   inc R16;incrementa R16.
		   sts ContadorU,R16;Carga el valor al Contador.
		   cpi R16,0xA;Compara si es A.
		   brne Terminar;
		   ;Decenas
		   ldi R16,0x00;
		   sts ContadorU,R16;
		   lds R16,ContadorD;
		   inc R16;Incrementa R16.
		   sts ContadorD,R16;Carga el valor al Contador.
		   cpi R16,0xA;Compara si es A.
		   brne Terminar;
		   ;Centenas
		   ldi R16,0x00;
		   sts ContadorD,R16;
		   lds R16,ContadorC;
		   inc R16;Incrementa R16.
		   sts ContadorC,R16;Carga el valor al Contador.
		   cpi R16,0xA;Compara si es A.
		   brne Terminar;
		   ;Millares
		   ldi R16,0x00;
		   sts ContadorC,R16;
		   lds R16,ContadorM;
		   inc R16;Incrementa R16.
		   sts ContadorM,R16;Carga el valor al Contador.
		   jmp Terminar;
Terminar:
           ret;
retardo_2:   
            ; ----------------------------- 
; delaying 2999856 cycles:
          ldi  R20, $10
WGLOOP0E:  ldi  R21, $F8
WGLOOP1E:  ldi  R22, $FB
WGLOOP2E:  dec  R22
          brne WGLOOP2E
          dec  R21
          brne WGLOOP1E
          dec  R20
          brne WGLOOP0E
; ----------------------------- 
; delaying 144 cycles:
          ldi  R20, $30
WGLOOP3E:  dec  R20
          brne WGLOOP3E
; ============================= 
            ret;
LCD_1:
          ldi R16,0x80;
		  sts Dir_DDRAM,R16;
		  call LCD_Comando;Pone en la dirección 80 de la LCD.
		  ret;
LCD_2:    
          ldi R16,0xC0;
		  sts Dir_DDRAM,R16;
		  call LCD_Comando;Pone en la dirección C0 de la LCD.
		  ret;
Limpiar_LCD:
          ldi R16,0x01;
		  sts Dir_DDRAM,R16;
		  call LCD_Comando;Pone en la dirección 01 de la LCD.
		  ret;
ES_EEPROM:
          
		  sbic EECR,EEPE;
		  rjmp ES_EEPROM;Espera a que se termine de guardar el dato pasado.
		  ;
		  push R17;
		  push R18;
		  lds R18,EEPROM_Dirh;Carga la dirección alta a R18.
		  lds R17,EEPROM_Dirl;Carga la dirección baja a R17.
		  lds R16,EEPROM_Dato;Carga el dato a R16.
		  out EEARH,R18;Carga la dirección alta.
		  out EEARL,R17;Carga la dirección baja.
		  out EEDR,R16;Carga la información al registro.
		  sbi EECR,EEMPE;
		  sbi EECR,EEPE;Comienza a escribir el dato poniendo en alto EEPE.
		  pop R18;
		  pop R17;
          ret;
LEER_EEPROM:
            sbic EECR,EEPE;
		    rjmp LEER_EEPROM;Espera a que se termine de guardar el dato pasado.
		    ;
			push R17;
		    push R18;
		    lds R18,EEPROM_Dirh;Carga la dirección alta a R18.
		    lds R17,EEPROM_Dirl;Carga la dirección baja a R17.
			;
		    out EEARH,R18;Carga la dirección alta.
		    out EEARL,R17;Carga la dirección baja.
			;
		    sbi EECR,EERE;Pone la EEPROM en lectura.
   		    in R16,EEDR;Lee el dato del registro.
			sts EEPROM_Dato,R16;Guarda el dato en EEPROM_Dato.
			pop R18;
		    pop R17;
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

Carga_Inicial:
           push R17;
		   push R18;
           ldi R16,0x00;
		   sts EEPROM_Dirh,R16;
		   ;Dato 0
	       ldi R16,0x00;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1
	       ldi R16,0x01;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 2
	       ldi R16,0x02;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 3
	       ldi R16,0x03;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 4
	       ldi R16,0x04;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 5
	       ldi R16,0x05;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'1';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 6
	       ldi R16,0x06;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 7
	       ldi R16,0x07;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 8
	       ldi R16,0x08;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 9
	       ldi R16,0x09;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 10
	       ldi R16,0x0A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'2';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato B
	       ldi R16,0x0B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato C
	       ldi R16,0x0C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato D
	       ldi R16,0x0D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato E
	       ldi R16,0x0E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato F
	       ldi R16,0x0F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;2da Linea
		   ;Dato 10
	       ldi R16,0x10;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'L';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 11
	       ldi R16,0x11;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'U';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 12
	       ldi R16,0x12;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'I';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 13
	       ldi R16,0x13;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'S';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 14
	       ldi R16,0x14;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 15
	       ldi R16,0x15;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'F';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 16
	       ldi R16,0x16;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'E';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 17
	       ldi R16,0x17;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'R';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 18
	       ldi R16,0x18;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'N';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 19
	       ldi R16,0x19;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1A
	       ldi R16,0x1A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'N';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1B
	       ldi R16,0x1B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'D';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1C
	       ldi R16,0x1C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'O';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1D
	       ldi R16,0x1D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1E
	       ldi R16,0x1E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1F
	       ldi R16,0x1F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;2 Jugador
		   ;----------------------------
		   ;----------------------------
		   ;Dato 0
	       ldi R16,0x20;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1
	       ldi R16,0x21;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 2
	       ldi R16,0x22;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 3
	       ldi R16,0x23;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 4
	       ldi R16,0x24;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 5
	       ldi R16,0x25;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'2';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 6
	       ldi R16,0x26;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 7
	       ldi R16,0x27;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 8
	       ldi R16,0x28;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 9
	       ldi R16,0x29;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 10
	       ldi R16,0x2A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'1';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato B
	       ldi R16,0x2B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato C
	       ldi R16,0x2C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato D
	       ldi R16,0x2D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato E
	       ldi R16,0x2E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato F
	       ldi R16,0x2F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;2da Linea
		   ;Dato 10
	       ldi R16,0x30;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'F';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 11
	       ldi R16,0x31;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'R';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 12
	       ldi R16,0x32;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 13
	       ldi R16,0x33;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'N';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 14
	       ldi R16,0x34;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'C';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 15
	       ldi R16,0x35;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'I';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 16
	       ldi R16,0x36;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'S';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 17
	       ldi R16,0x37;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'C';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 18
	       ldi R16,0x38;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 19
	       ldi R16,0x39;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1A
	       ldi R16,0x3A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'Z';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1B
	       ldi R16,0x3B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1C
	       ldi R16,0x3C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'R';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1D
	       ldi R16,0x3D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1E
	       ldi R16,0x3E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'Z';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1F
	       ldi R16,0x3F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'U';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;3 Jugador
		   ;----------------------------
		   ;----------------------------
		   ;Dato 0
	       ldi R16,0x40;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1
	       ldi R16,0x41;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 2
	       ldi R16,0x42;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 3
	       ldi R16,0x43;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 4
	       ldi R16,0x44;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 5
	       ldi R16,0x45;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'3';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 6
	       ldi R16,0x46;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 7
	       ldi R16,0x47;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 8
	       ldi R16,0x48;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 9
	       ldi R16,0x49;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 10
	       ldi R16,0x4A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'0';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato B
	       ldi R16,0x4B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato C
	       ldi R16,0x4C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato D
	       ldi R16,0x4D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato E
	       ldi R16,0x4E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato F
	       ldi R16,0x4F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,0x01;
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;2da Linea
		   ;Dato 10
	       ldi R16,0x50;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'D';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 11
	       ldi R16,0x51;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 12
	       ldi R16,0x52;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'N';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 13
	       ldi R16,0x53;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'I';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 14
	       ldi R16,0x54;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'E';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 15
	       ldi R16,0x55;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'L';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 16
	       ldi R16,0x56;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 17
	       ldi R16,0x57;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'Z';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 18
	       ldi R16,0x58;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 19
	       ldi R16,0x59;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'R';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1A
	       ldi R16,0x5A;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1B
	       ldi R16,0x5B;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'Z';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1C
	       ldi R16,0x5C;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'U';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1D
	       ldi R16,0x5D;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'A';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1E
	       ldi R16,0x5E;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;Dato 1F
	       ldi R16,0x5F;
		   sts EEPROM_Dirl,R16;
		   ldi R16,'-';
		   sts EEPROM_Dato,R16;
           call ES_EEPROM;
		   ;FINAL
		   pop R18;
		   pop R17;
		   ret;
;      ldi R16,0x00;
;	   sts EEPROM_Dirh,R16;
;	   inc R17;
;	   sts EEPROM_Dirl,R17;
;	   sts EEPROM_Dato,R17;
;       call ES_EEPROM;
;FIN_0:
;	   pop R16;
;       call LEER_EEPROM;
;	    lds R16,EEPROM_Dato;Carga el dato a R16.
;inicio:   ;PONER PRIMER JUGADOR