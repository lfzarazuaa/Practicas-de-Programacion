;
; Practica_1b_Mega.asm
;
; Created: 05/03/2019 08:41:55 a.m.
; Author : Sanorte
;


; Replace with your application code
.include "m2560def.inc";Archivo de definicion de etiquetas.

.equ       Car_0=$C0; Define el valor de la constante para generar un "0" en un display de 7 segmentos.
.equ       Car_1=$F9; Define el valor de la constante para generar un "1" en un display de 7 segmentos.
.equ       Car_2=$A4; Define el valor de la constante para generar un "2" en un display de 7 segmentos.
.equ       Car_3=$B0; Define el valor de la constante para generar un "3" en un display de 7 segmentos.
.equ       Car_4=$99; Define el valor de la constante para generar un "4" en un display de 7 segmentos.
.equ       Car_5=$92; Define el valor de la constante para generar un "5" en un display de 7 segmentos.
.equ       Car_6=$82; Define el valor de la constante para generar un "6" en un display de 7 segmentos.
.equ       Car_7=$F8; Define el valor de la constante para generar un "7" en un display de 7 segmentos.
.equ       Car_8=$80; Define el valor de la constante para generar un "8" en un display de 7 segmentos.
.equ       Car_9=$90; Define el valor de la constante para generar un "9" en un display de 7 segmentos.
.equ       Car_A=$88; Define el valor de la constante para generar la letra "A" en un display de 7 segmentos.
.equ       Car_B=$83; Define el valor de la constante para generar la letra "B" en un display de 7 segmentos.
.equ       Car_C=$C6; Define el valor de la constante para generar la letra "C" en un display de 7 segmentos.
.equ       Car_D=$A1; Define el valor de la constante para generar la letra "D" en un display de 7 segmentos.
.equ       Car_E=$86; Define el valor de la constante para generar la letra "E" en un display de 7 segmentos.
.equ       Car_F=$8E; Define el valor de la constante para generar la letra "F" en un display de 7 segmentos.

 .equ lim_unidades=10;
 .equ lim_decenas=6;

 .equ opciones=$200;
 .equ unidades=$201;
 .equ decenas=$202;

 config:
   clr r16; Limpia el registro 16.
   out DDRA, r16; Configura el puerto A como entrada.
   ser r16;Pone en alto todo el registro.
   sts DDRK, r16; Configura el puerto K como entrada.
   out DDRF, r16; Configura el puerto F como salida.
   out porta, r16; Configura el puerto A como entrada.
   ldi r16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,r16;Carga el Stack pointer low con la dirección correcta.
   ldi r16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,r16;Carga el Stack pointer high con la dirección correcta.
   ldi r16,0;
   sts unidades,r16;
   sts decenas,r16;
inicio:
    ;RA7 RA6 RA5 RA4 RA3 RA2 RA1 RA0;
    ;--  --  --  --  --  -- pausa reset  
	  in r16,pina;
	  andi r16,$03;
      sts opciones,r16;
OnOff:
      sbrs r16,0;
	  jmp reset;
	  jmp verificar;
reset:
      ldi r16,Car_0;
	  out portf,r16;
	  sts portk,r16;
	  sts unidades,r16;
      sts decenas,r16;
	  jmp inicio;
verificar:
      lds r16,opciones;
	  sbrc r16,1;
	  jmp contar;
pausa:
	  jmp inicio;
contar:
	   call mostrar;
	   lds r16,unidades;
	   inc r16;
	   sts unidades,r16;
       cpi r16,lim_unidades;
	   brsh unidadesA0;
	   jmp inicio;
unidadesA0:
       clr r16;
	   sts unidades,r16;
	   lds r16,decenas;
	   inc r16;
	   sts decenas,r16;
       cpi r16,lim_decenas;
	   brsh decenasA0;
	   jmp inicio;
decenasA0:
       clr r16;
	   sts decenas,r16;
	   jmp inicio;
mostrar:
        lds r18,unidades;
	    call Decodificar;
        out portf,r18;
		lds r18,decenas;
	    call Decodificar;
		sts portk,r18;
		call Retardo_100;
        ret;
Decodificar:
         cpi r18, 0x09;Resta 0x09 para prender z si son iguales.
         breq Asignar_9; Si es distinto de 0x09 sigue contando.           
         cpi r18, 0x08;Resta 0x08 para prender z si son iguales.
         breq Asignar_8; Si es distinto de 0x08 sigue contando.           
         cpi r18, 0x07;Resta 0x07 para prender z si son iguales.
         breq Asignar_7; Si es distinto de 0x07 sigue contando.           
         cpi r18, 0x06;Resta 0x06 para prender z si son iguales.
         breq Asignar_6; Si es distinto de 0x06 sigue contando.           
         cpi r18, 0x05;Resta 0x05 para prender z si son iguales.
         breq Asignar_5; Si es distinto de 0x05 sigue contando.           
         cpi r18, 0x04;Resta 0x04 para prender z si son iguales.
         breq Asignar_4; Si es distinto de 0x04 sigue contando.           
         cpi r18, 0x03;Resta 0x03 para prender z si son iguales.
         breq Asignar_3; Si es distinto de 0x03 sigue contando.
		 cpi r18, 0x02;Resta 0x02 para prender z si son iguales.
         breq Asignar_2; Si es distinto de 0x02 sigue contando.           
         cpi r18, 0x01;Resta 0x01 para prender z si son iguales.
         breq Asignar_1; Si es distinto de 0x01 sigue contando.           
         jmp Asignar_0;Va a la etiqueta 0.

Asignar_9: ldi r18, Car_9;            
           ret;
Asignar_8: ldi r18, Car_8;            
           ret;
Asignar_7: ldi r18, Car_7;            
           ret;
Asignar_6: ldi r18, Car_6;            
           ret;
Asignar_5: ldi r18, Car_5;            
           ret;
Asignar_4: ldi r18, Car_4;            
           ret;
Asignar_3: ldi r18, Car_3;            
           ret;
Asignar_2: ldi r18, Car_2;            
           ret;
Asignar_1: ldi r18, Car_1;            
           ret;
Asignar_0: ldi r18, Car_0;            
           ret;
Retardo_100:
; ============================= 
;    delay loop generator 
;     16000000 cycles:
; ----------------------------- 
; delaying 15999993 cycles:
          ldi  R20, $53
WGLOOP0:  ldi  R21, $FB
WGLOOP1:  ldi  R22, $FF
WGLOOP2:  dec  R22
          brne WGLOOP2
          dec  R21
          brne WGLOOP1
          dec  R20
          brne WGLOOP0
; ----------------------------- 
; delaying 6 cycles:
          ldi  R20, $02
WGLOOP3:  dec  R20
          brne WGLOOP3
; ----------------------------- 
; delaying 1 cycle:
          ret;
; =============================  
