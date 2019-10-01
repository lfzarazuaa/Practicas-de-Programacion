;
; Practica_1a_Mega.asm
;
; Created: 11/02/2019 08:52:08 p. m.
; Author : Zarazua
;


; Replace with your application code
.include "m2560def.inc";Archivo de definicion de etiquetas.
 .equ opciones=$200;
 .equ tiempo=$201;
 .equ comb_ant=$202;
 config:
   clr R16; Limpia el registro 16.
   sts DDRK, R16; Configura el puerto K como entrada.
   out DDRA, R16; Configura el puerto A como entrada.
   ser R16;Pone en alto todo el registro.
   out DDRF, R16; Configura el puerto F como salida.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la dirección correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la dirección correcta.
   lds r16,pink;
   andi r16,$0F;//Lee la primera combinación.
   sts comb_ant,r16;
inicio:
    ;RK7 RK6 RK5 RK4 RK3 RK2 RK1 RK0;
    ;--  --  --  --   Comb   Vel On/Off.    
	  lds r16,pink;
	  andi r16,$0F;
      sts opciones,r16;
OnOff:      
      sbrs r16,0;
	  jmp Apagar;
	  jmp Velocidades;
Apagar:
      clr r16;
      out portb,r16;
	  jmp inicio;
Velocidades:
      lds r16,opciones;
	  sbrc r16,1;
	  jmp Vel_1;	      
Vel_0:
      ldi r16,1;
	  sts tiempo,r16;
	  jmp Comb;
Vel_1:
      ldi r16,4;
	  sts tiempo,r16;
Comb:
       lds r16,opciones;
	   andi r16,(3<<2);Enmascaramiento con 0xC0 para elegir la combinación.
       ;lds r17,opciones;
	   ;cp r17,r16;
	   ;breq final;
	   cpi r16,0;Resta 0x00 para prender z si son iguales.
       breq Comb_0; Si la combinación es igual a 0 nos manda a Comb_0.
       cpi r16,(1<<2);Resta (1<<2) para prender z si son iguales.
       breq Comb_1; Si la combinación es igual a 0 nos manda a Comb_1.
       cpi r16,(2<<2);Resta (2<<2) para prender z si son iguales.
       breq Comb_2; Si la combinación es igual a 0 nos manda a Comb_2.
       jmp Comb_3; Si la combinacion es igual a 0 nos manda a Comb_3.
Comb_0:
       call SecuenciaA;
	   jmp inicio;
Comb_1:
       call SecuenciaB;
	   jmp inicio;
Comb_2:
       call SecuenciaC;
	   jmp inicio;
Comb_3:
       call SecuenciaD;
	   jmp inicio;
SecuenciaA:
           ldi r16,0b01010101;
	       call Mostrar;
	       ldi r16,0b10101010;
	       call Mostrar;
           ret;
SecuenciaB:
           ldi r16,0b11001100;
	       call Mostrar;
	       ldi r16,0b01100110;
		   call Mostrar;
		   ldi r16,0b00110011;
	       call Mostrar;
	       ldi r16,0b10011001;
		   call Mostrar;
           ret;
SecuenciaC:
           ldi r16,0b10000000;
	       call Mostrar;
	       ldi r16,0b01000000;
		   call Mostrar;
		   ldi r16,0b00100000;
	       call Mostrar;
	       ldi r16,0b00010000;
	       call Mostrar;
		   ldi r16,0b00001000;
	       call Mostrar;
		   ldi r16,0b00000100;
	       call Mostrar;
		   ldi r16,0b00000010;
	       call Mostrar;
		   ldi r16,0b00000001;
	       call Mostrar;
           ret;
SecuenciaD:
           ldi r16,0b10000001;
	       call Mostrar;
	       ldi r16,0b01000010;
		   call Mostrar;
		   ldi r16,0b00100100;
	       call Mostrar;
	       ldi r16,0b00011000;
	       call Mostrar;
		   ldi r16,0b00100100;
	       call Mostrar;
		   ldi r16,0b01000010;
	       call Mostrar;
           ret;
Mostrar:
           out portf,r16;
	       call Retardo;
		   ;lds r16,pink;
		   ;cp r17,r16;
		   ret;
Retardo:
           lds r23,tiempo;
Retardo_100:
; ----------------------------- 
; delaying 1599996 cycles:
          ldi  R20, $97
WGLOOP0:  ldi  R21, $21
WGLOOP1:  ldi  R22, $6A
WGLOOP2:  dec  R22
          brne WGLOOP2
          dec  R21
          brne WGLOOP1
          dec  R20
          brne WGLOOP0
		  dec  R23
		  brne Retardo_100;
; ----------------------------- 
; delaying 3 cycles:
          nop;
		  nop;
          ret;
; =============================