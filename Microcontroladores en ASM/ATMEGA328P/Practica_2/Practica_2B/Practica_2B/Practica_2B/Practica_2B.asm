/*
 * Practica_2B.asm
 *
 *  Created: 31/03/2016 09:07:44 a.m.
 *   Author: Luis
 */ 
  .include "m328pdef.inc";Archivo de definicion de etiquetas.
 .org 0x3C00 jmp config;Manda al inicio si esta configurado como bootloader.
 .org 0x0000 jmp config;Manda al inicio.
 .org 0x000E jmp CompA_2;Ejecuta interrupción por PWM Timer2.
 .org 0x0010 jmp CompB_2;Ejecuta interrupción por PWM Timer2.
 .org 0x001C jmp CompA_0;Ejecuta interrupción por PWM Timer0.
 .org 0x001E jmp CompB_0;Ejecuta interrupción por PWM Timer0.

 config: 
   ldi R16,0x08;
   out DDRB, R16; Configura el puerto B en el pin 3 como salida y los demas como entrada.
   out PORTB, R16;Pone en uno los pines de salida del puerto B. 
   ldi R16,0x68; Carga 0x68 a R16.
   out DDRD, R16; Configura el puerto D en los pines 3,5,6 como salida y los demas como entrada.
   out PORTD, R16;Pone en uno los pines de salida del puerto D.
   clr R16;
   out DDRC, R16; Configura el puerto D como entrada.
   ldi R16,low(RAMEND);Carga el nivel bajo de la pila.
   out SPL,R16;Carga el Stack pointer low con la direccion correcta.
   ldi R16,high(RAMEND);Carga el nivel alto de la pila.
   out SPH,R16;Carga el Stack pointer high con la direccion correcta.
   ldi R16,0x03;Carga 0xF3.
   out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A y B desconectados.
   sts TCCR2A,R16;Pone el Registro TCCR2A en fast PWM con Comp A y B desconectados.
   ldi R16,0x02; Carga 0x03 a R16.
   out TCCR0B,R16; Usar el prescalador a un factor de 8.
   sts TCCR2B,R16; Usar el prescalador a un factor de 8.
   ldi R16,0x00;Deshabilita TOV0.
   out TIFR0,R16 ; Limpia las interrupciones pendientes TOV0 y COMP(A,B).
   sts TIFR2,R16 ; Limpia las interrupciones pendientes TOV2 y COMP(A,B).
   ldi R16,0x00; Carga 0x06 a R16.
   sts TIMSK0,R16; Deshabilita la interrupción de TIMER0 por COMPA y COMPB.
   sts TIMSK2,R16; Deshabilita la interrupción de TIMER2 por COMPA y COMPB.
     sei;Habilita interrupciones globales.
   clr R17;
   ldi R16,0x00;Limpia R16.
   out TCNT0,R16;Carga inicial del Timer0.
   ldi R16,0x00;Limpia R16.
   sts TCNT2,R16;Carga inicial del Timer2.
   clr R20;Limpia R20.
   clr R21;Limpia R21.
   clr R22;Limpia R22.
   out OCR0A,R20;Carga del PWM.
   out OCR0B,R21;Carga del PWM.
   sts OCR2A,R22;Carga del PWM.
   sts OCR2B,R22;Carga del PWM.
   
   jmp inicio;

CompA_0:
        nop;
		reti;
CompB_0:
        nop;
		reti;
CompA_2:
        nop;
		reti;
CompB_2:
        nop;
		reti;

inicio:
   ;RB7 RB6 RB5 RB4 RB3 RB2 RB1 RB0;
   ; --  R-  R+  G-  --  G+  B-  B+
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,6;Verifica que no este presionado R-.
	   jmp Dec_R;Si está presionado salta a identificar si se dejo de pulsar.
       sbrc R16,5;Verifica que no este presionado R+.
	   jmp Inc_R;Si está presionado salta a identificar si se dejo de pulsar.
	   sbrc R16,4;Verifica que no este presionado G-.
	   jmp Dec_G;Si está presionado salta a identificar si se dejo de pulsar.
	   sbrc R16,2;Verifica que no este presionado G+.
	   jmp Inc_G;Si está presionado salta a identificar si se dejo de pulsar.
	   sbrc R16,1;Verifica que no este presionado B-.
	   jmp Dec_B;Si está presionado salta a identificar si se dejo de pulsar.
	   sbrc R16,0;Verifica que no este presionado B+.
	   jmp Inc_B;Si está presionado salta a identificar si se dejo de pulsar.
       jmp inicio;Reinicia el Programa.

Dec_R:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,6;Verifica que no este presionado R-.
	   jmp Dec_R;Verifica si R- se dejo de pulsar.
       cpi R20,0x00;Verica que no sea sea cero.
	   breq Dec_R1;Si es cero deja el valor igual.
	   subi R20,0x0F;Resta 15 al valor del PWM.
	   out OCR0A,R20;Carga al PWM el nuevo valor.
	   ;Decidir si se desconecta OC0A.
	   cpi R20,0x00;Verica que no sea sea cero.
	   brne Dec_R1;Si es cero desconecta OC0A.
	   in R16,TCCR0A;Obtener el valor del registro.
	   andi R16,0x3F;Desconecta CompA del pin OC0A.
       out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A apagado.
Dec_R1:
	   jmp inicio;Vuelve al inicio.

Inc_R:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,5;Verifica que no este presionado R+.
	   jmp Inc_R;Verifica si R+ se dejo de pulsar.
       cpi R20,0xFF;Verica que no sea sea el maximo.
	   breq Inc_R1;Si es el maximo deja el valor igual.
	   ldi R16,0x0F;Carga a R16  el valor a sumar.
	   add R20,R16;Suma 15 al valor del PWM.
	   out OCR0A,R20;Carga al PWM el nuevo valor.
	   in R16,TCCR0A;Obtener el valor del registro.
	   ;Conecta OC0A.
	   in R16,TCCR0A;Obtener el valor del registro.
	   ori R16,0xC0;Conecta CompA al pin OC0A.
       out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A prendido en flanco de descenso.
Inc_R1:
	   jmp inicio;

Dec_G:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,4;Verifica que no este presionado G-.
	   jmp Dec_G;Verifica si G- se dejo de pulsar.
       cpi R21,0x00;Verica que no sea sea cero.
	   breq Dec_G1;Si es cero deja el valor igual.
	   subi R21,0x0F;Resta 15 al valor del PWM.
	   out OCR0B,R21;Carga al PWM el nuevo valor.
	   ;Decidir si se desconecta OC0B.
	   cpi R21,0x00;Verica que no sea sea cero.
	   brne Dec_R1;Si es cero desconecta OC0B.
	   in R16,TCCR0A;Obtener el valor del registro.
	   andi R16,0xCF;Desconecta CompB del pin OC0B.
       out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp A apagado.
Dec_G1:
	   jmp inicio;

Inc_G:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,2;Verifica que no este presionado G+.
	   jmp Inc_G;Verifica si G+ se dejo de pulsar.
       cpi R21,0xFF;Verica que no sea sea el maximo.
	   breq Inc_G1;Si es el maximo deja el valor igual.
	   ldi R16,0x0F;Carga a R16 el valor a sumar.
	   add R21,R16;Suma 15 al valor del PWM.
	   out OCR0B,R21;Carga al PWM el nuevo valor.
	   ;Conecta OC0A.
	   in R16,TCCR0A;Obtener el valor del registro.
	   ori R16,0x30;Conecta CompB al pin OC0B.
       out TCCR0A,R16;Pone el Registro TCCR0A en fast PWM con Comp B prendido en flanco de descenso.
Inc_G1:
	   jmp inicio;

Dec_B:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,1;Verifica que no este presionado B-.
	   jmp Dec_B;Verifica si B- se dejo de pulsar.
       cpi R22,0x00;Verica que no sea sea cero.
	   breq Dec_B1;Si es cero deja el valor igual.
	   subi R22,0x0F;Resta 15 al valor del PWM.
	   sts OCR2A,R22;Carga al PWM el nuevo valor.
	   sts OCR2B,R22;Carga al PWM el nuevo valor.
	   ;Decidir si se desconecta OC2A.
	   cpi R22,0x00;Verica que no sea sea cero.
	   brne Dec_R1;Si es cero desconecta OC2A.
	   lds R16,TCCR2A;Obtener el valor del registro.
	   andi R16,0x0F;Desconecta CompA del pin OC2A y CompB del pin OC2B.
       sts TCCR2A,R16;Pone el Registro TCCR2A en fast PWM con Comp A apagado y Comp B apagado.
Dec_B1:
       jmp inicio;

Inc_B:
       in R16,PINB;Obtiene el valor de las entradas de B.
	   sbrc R16,0;Verifica que no este presionado G+.
	   jmp Inc_B;Verifica si G+ se dejo de pulsar.
       cpi R22,0xFF;Verica que no sea sea el maximo.
	   breq Inc_B1;Si es el maximo deja el valor igual.
	   ldi R16,0x0F;Carga a R16 el valor a sumar.
	   add R22,R16;Suma 15 al valor del PWM.
	   sts OCR2A,R22;Carga al PWM el nuevo valor.
	   sts OCR2B,R22;Carga al PWM el nuevo valor.
	   ;Conecta OC2A y 0C2B.
	   lds R16,TCCR2A;Obtener el valor del registro.
	   ori R16,0xF0;Conecta CompA al pin OC2A y CompB al pin OC2B.
       sts TCCR2A,R16;Pone el Registro TCCR2A en fast PWM con CompA y CompB prendidos en flanco de descenso.
Inc_B1:
	   jmp inicio;

