;INSTITUTO POLITECNICO NACIONAL
;CECyT 9 JUAN DE DIOS BATIZ.
;
;PRACTICA 0'_
;MANEJO DE UN LED OSCILANDO A 1 HZ
;
;EQUIPO: GRUPO 6IM3
;
;ESTE PROGRAMA ...
;
;------------------------------------------------

list p=16f877A;Directiva del pic sin el cual no sabe para que pic ensamblar.
#include "p16f877a.inc";

;Def de variables del programa en RAM
operando1       equ       0x20; Variable util en la subrutina de pérdida de tiempo.
operando2       equ       0x21;
DU              equ       0x22;
Contador1       equ       0x23;
Contador2       equ       0x24;
Contador3       equ       0x25;
;Define registro a usar
Reg_RAM_LCD 	equ		  0x26;
Reg_Caracter	equ		  0x27;
Reg_Tecla    	equ		  0x28;
;
;-------------------------------------------------------------------------------------

;Def de constantes a utilizar.
;Cod. de carácteres alfanuméricos en 7 segmentos
M               equ       .15;
N               equ       .2;
L               equ       .248;

;Cod. de los carácteres de 7 segmentos.
Car_A            equ       b'01110111';
Car_B            equ       0xc7;
;Cod. de las Teclas del Teclado Matricial.
Tecla_N           equ       0x00;Define el valor de la constante para generar un nulo en LCD.
Tecla_0           equ       '0'; Define el valor de la constante para generar un "0" en LCD.
Tecla_1           equ       '1'; Define el valor de la constante para generar un "1" en LCD.
Tecla_2           equ       '2'; Define el valor de la constante para generar un "2" en LCD.
Tecla_3           equ       '3'; Define el valor de la constante para generar un "3" en LCD.
Tecla_4           equ       '4'; Define el valor de la constante para generar un "4" en LCD.
Tecla_5           equ       '5'; Define el valor de la constante para generar un "5" en LCD.
Tecla_6           equ       '6'; Define el valor de la constante para generar un "6" en LCD.
Tecla_7           equ       '7'; Define el valor de la constante para generar un "7" en LCD.
Tecla_8           equ       '8'; Define el valor de la constante para generar un "8" en LCD.
Tecla_9           equ       '9'; Define el valor de la constante para generar un "9" en LCD.
Tecla_A           equ       'A'; Define el valor de la constante para generar la letra "A" en LCD.
Tecla_B           equ       'B'; Define el valor de la constante para generar la letra "B" en LCD.
Tecla_C           equ       'C'; Define el valor de la constante para generar la letra "C" en LCD.
Tecla_D           equ       'D'; Define el valor de la constante para generar la letra "D" en LCD.
Tecla_Ast         equ       '*'; Define el valor de la constante para generar la letra "E" en LCD.
Tecla_Gato        equ       '#'; Define el valor de la constante para generar la letra "F" en LCD.
;------------------------------------------------------------------------------------------

;Def. de Ptos. I/0.
;Puerto A.
Enable          equ       .0;
RS              equ       .1;
Sin_UsoRA2      equ       .2;
Led_Rojo        equ       .3;
Sin_UsoRA4      equ       .4;
Sin_UsoRA5      equ       .5;

progA           equ        B'111100'; Def. la config. de los Bits del puerto A.

;Puerto B.
Sin_UsoRB0      equ       .0;
Sin_UsoRB1      equ       .1;
Sin_UsoRB2      equ       .2;
Sin_UsoRB4      equ       .4;
Sin_UsoRB5      equ       .5;
Sin_UsoRB6      equ       .6;
Sin_UsoRB7      equ       .7;

progB           equ        0xF0; Def. la config. de los Bits del puerto B.

;Puerto C.
Sin_UsoRC0      equ       .0;
Sin_UsoRC1      equ       .1;
Sin_UsoRC2      equ       .3;
Sin_UsoRC4      equ       .4;
Sin_UsoRC5      equ       .5;
Sin_UsoRC6      equ       .6;
Sin_UsoRC7      equ       .7;

progC           equ        0x00; Def. la config. de los Bits del puerto C.

;Puerto D.
Sin_UsoRD0      equ       .0;
Sin_UsoRD1      equ       .1;
Sin_UsoRD2      equ       .3;
Sin_UsoRD4      equ       .4;
Sin_UsoRD5      equ       .5;
Sin_UsoRD6      equ       .6;
Sin_UsoRD7      equ       .7;

progD           equ        0xFF; Def. la config. de los Bits del puerto D.

;Puerto E.
Sin_UsoRE0      equ       .0;
Sin_UsoRE1      equ       .1;
Sin_UsoRE2      equ       .2;


progE           equ        B'1111'; Def. la config. de los Bits del puerto E.


;--------------------------------------------------------------------------------------------------

                ;============================================
                ;====            Vector Reset           =====
                ;============================================
                ;Vector es una dirección.
vec_reset       org 0000h; Dirección en la que se empieza a ejecutar el programa.
                clrf pclath; Este registro tiene 2 bits y asegura la página 0 de memoria de programa.
                goto prog_prin;Ir a la etiqueta prog_prin (igual a jp de z80) para no crear espejos de memoria.

;--------------------------------------------------------------------------------------------------


                ;============================================
                ;==== Subrutina de Interrupciones ===========
                ;============================================

                org 0004h; Inicio de la subrutina de Interrupciones
vec_int         nop;
                goto Interrupcion;
;-------------------------------------------------------------------------------------------------
                ;===================================================
                ;==== Tabla de Decodificación Tecaldo Matricial ====
                ;===================================================
Decodificar_Tecla_A addwf pcl,f;
                    retlw Tecla_N;0
                    retlw Tecla_N;1
                    retlw Tecla_N;2
                    retlw Tecla_N;3
                    retlw Tecla_N;4
                    retlw Tecla_N;5
                    retlw Tecla_N;6
                    retlw Tecla_A;7 0111
                    retlw Tecla_N;8
                    retlw Tecla_N;9
                    retlw Tecla_N;A
                    retlw Tecla_3;B 1011
                    retlw Tecla_N;C
                    retlw Tecla_2;D 1101
                    retlw Tecla_1;E 1110
                    retlw Tecla_N;F 1111
                    return;

Decodificar_Tecla_B addwf pcl,f;
                    retlw Tecla_N;0
                    retlw Tecla_N;1
                    retlw Tecla_N;2
                    retlw Tecla_N;3
                    retlw Tecla_N;4
                    retlw Tecla_N;5
                    retlw Tecla_N;6
                    retlw Tecla_B;7
                    retlw Tecla_N;8
                    retlw Tecla_N;9
                    retlw Tecla_N;A
                    retlw Tecla_6;B
                    retlw Tecla_N;C
                    retlw Tecla_5;D
                    retlw Tecla_4;E
                    retlw Tecla_N;F
                    return;

Decodificar_Tecla_C addwf pcl,f;
                    retlw Tecla_N;0
                    retlw Tecla_N;1
                    retlw Tecla_N;2
                    retlw Tecla_N;3
                    retlw Tecla_N;4
                    retlw Tecla_N;5
                    retlw Tecla_N;6
                    retlw Tecla_C;7
                    retlw Tecla_N;8
                    retlw Tecla_N;9
                    retlw Tecla_N;A
                    retlw Tecla_9;B
                    retlw Tecla_N;C
                    retlw Tecla_8;D
                    retlw Tecla_7;E
                    retlw Tecla_N;F
                    return;

Decodificar_Tecla_D addwf pcl,f;
                    retlw Tecla_N;0
                    retlw Tecla_N;1
                    retlw Tecla_N;2
                    retlw Tecla_N;3
                    retlw Tecla_N;4
                    retlw Tecla_N;5
                    retlw Tecla_N;6
                    retlw Tecla_D;7
                    retlw Tecla_N;8
                    retlw Tecla_N;9
                    retlw Tecla_N;A
                    retlw Tecla_Gato;B
                    retlw Tecla_N;C
                    retlw Tecla_0;D
                    retlw Tecla_Ast;E
                    retlw Tecla_N;F
                    return;
;-------------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------------

                ;============================================
                ;=====   Subrutina de Interrupciones   ======
                ;============================================
Interrupcion    btfsc intcon,intf;Verifica si se origino por RB0.
                goto Int_RB0;
                btfsc intcon,tmr0if;Verifica si se origino por TMR0.
                goto Int_TMR0;
                btfsc intcon,rbif;Verifica si se origino por RB4-7.
                goto Int_RB47;
Int_RB0         
                bcf intcon,intf;Limpia la bandera asociada a RB0.
                goto Final_Int;
Int_TMR0 
                bcf intcon,tmr0if;Limpia la bandera asociada a TMR0.
                goto Final_Int;
Int_RB47
                incf Reg_RAM_LCD,f;Incrementa la dirección del LCD.
                movlw 0x90;Ve una dirección no válida.
                xorwf Reg_RAM_LCD,w;Compara con el acumulador
                btfss status,z;viendo si es igual.
                goto Obtencion_Tecla;No es la ultima dirección.
Reasignar                          
                movlw 0x80;Es una dirección inválida y se corrige.
                movwf Reg_RAM_LCD;Carga la primera direccion.
                call LCD_Init;Limpia el LCD.
Obtencion_Tecla call Obtener_Tecla;
                movlw Tecla_N;Verificar que no sea tecla nula.
                xorwf Reg_Tecla,w;Compara con el acumulador
                btfss status,z;viendo si es igual.
                goto Poner_Tecla;No es la tecla nula.
                goto FIN_INT;Es una tecla nula.
Poner_Tecla     movf Reg_Tecla,w;
                movwf Reg_Caracter;
                call Caracter_LCD;Escribe en el LCD el nuevo caracter.
FIN_INT         bcf intcon,rbif;Limpia la bandera asociada a RB4-7.
                goto Final_Int;

Final_Int       
                retfie; Fin de subrutina y regreso al program principal.
;-------------------------------------------------------------------------------------------------
                ;============================================
                ;====Subrutina de Ini. de Reg. del Pic ======
                ;============================================

prog_ini        bsf status,RP0; Ponte en el banco 1 de Ram
                ;GIE(1) PEIE(0) TMR0IE(0) INTE(0) RBIE(1) TMR0IF(0) INTF(0) RBIF(0)
                movlw 0x88; Activa Interrupciones con  solo RB0 y Banderas desactivadas.
                movwf intcon ^0x80;
                movlw progA;
                movwf trisa ^0x80;Registro que se encarga fisicamente de definir la forma de operación del puerto A.
                bsf adcon0,.6;
                movlw 0x06;
                movwf adcon1;
                movlw progb;
                movwf trisb ^0x80;Directiva que cambia al banco 1
                movlw progc;
                movwf trisc ^0x80;
                movlw progd;
                movwf trisd ^0x80;
                movlw proge;
                movwf trise ^0x80;
                movlw 0x74;Activación de RBPU(7-0) e INTEDG(6-1,flanco de ascenso).
                movwf option_reg ^0x80;
                bcf status, RP0; Ponte en el Banco 0 de la RAM.
                clrf portc;
                goto Inicializar;
;----------------------------------------------------------------------------------------------------------------
                ;============================================
                ;====         Programa Principal        =====
                ;============================================

prog_prin       goto prog_ini;
Inicializar     call LCD_INIT;
                movlw 0x80;
                movwf Reg_RAM_LCD;
                movlw 0x40;
                movwf Reg_Caracter;
                call Caracter_LCD;
Inicio
                movlw 0x00;Pone el puerto en alto para generar la Int.
                movwf portb;Mueve el contenido al puerto B.
                goto Inicio;
;--------------------------------------------------------------------------------------------------
                ;===============================================
                ;===== Subrutina de Obtencion de la Tecla   ====
                ;===============================================
                ;KBD Puerto B;
Obtener_Tecla        clrf portb;
                     movlw 0x0E;
                     movwf portb;
                     nop;
                     movf portb,w;
                     movwf Reg_Tecla;
                     swapf Reg_Tecla,f;
                     movlw 0x0F;
                     andwf Reg_Tecla,w;
                     call Decodificar_Tecla_A;
                     movwf Reg_Tecla;
                     movlw Tecla_N;
                     xorwf Reg_Tecla,w;
                     btfss status,z;
                     goto Continua_1;
                     ;Verificar 2 fila
                     movlw 0x0D;
                     movwf portb;
                     nop;
                     movf portb,w;
                     movwf Reg_Tecla;
                     swapf Reg_Tecla,f;
                     movlw 0x0F;
                     andwf Reg_Tecla,w;
                     call Decodificar_Tecla_B;
                     movwf Reg_Tecla;
                     movlw Tecla_N;
                     xorwf Reg_Tecla,w;
                     btfss status,z;
                     goto Continua_1;
                     ;Verificar 3 fila
                     movlw 0x0B;
                     movwf portb;
                     nop;
                     movf portb,w;
                     movwf Reg_Tecla;
                     swapf Reg_Tecla,f;
                     movlw 0x0F;
                     andwf Reg_Tecla,w;
                     call Decodificar_Tecla_C;
                     movwf Reg_Tecla;
                     movlw Tecla_N;
                     xorwf Reg_Tecla,w;
                     btfss status,z;
                     goto Continua_1;
                     ;Verificar 4 fila
                     movlw 0x07;
                     movwf portb;
                     nop;
                     movf portb,w;
                     movwf Reg_Tecla;
                     swapf Reg_Tecla,f;
                     movlw 0x0F;
                     andwf Reg_Tecla,w;
                     call Decodificar_Tecla_D;
                     movwf Reg_Tecla;
                     movlw Tecla_N;
                     xorwf Reg_Tecla,w;
                     btfss status,z;
                     goto Continua_1;
Asignar_Tecla_N      movlw Tecla_N;
                     movwf Reg_Tecla;
                     return;
Continua_1           movlw 0x00;
                     movwf portb;
Esperar_Tecla        movf portb,w;
                     xorlw 0xF0;
                     btfss status,z;
                     goto Esperar_Tecla;Resultado distinto de 1111.
                     return;Resultado positivo que indica que RB4-RB7=1111.
;--------------------------------------------------------------------------------------------------

                ;===============================================
                ;===== Subrutina de Inicialización del LCD  ====
                ;===============================================
                ;Enable Pin A0
                ;R/S  Pin A1
                ;Datos Puerto C
LCD_Init                clrf portc;
                        clrf porta;
                        movlw 0x38;
                        movwf portc;
                        call Pulso_E;
                        movlw 0x06;
                        movwf portc;
                        call Pulso_E;
                        movlw 0x01;
                        movwf portc;
                        call Pulso_E;
                        movlw 0x0C;
                        movwf portc;
                        call Pulso_E;
                        return;
;--------------------------------------------------------------------------------------------------


                ;==============================================================
                ;=====  Subrutina Cargar Carácter al LCD de Forma rápida ======
                ;==============================================================
                ;Enable Pin A0
                ;R/S  Pin A1
                ;Datos Puerto C
LCD_Rapido              bsf porta,RS;
                        movfw Reg_Caracter;
                        movwf portc;    
                        call Pulso_E;
                        return;
;--------------------------------------------------------------------------------------------------
                ;===============================================
                ;=====  Subrutina Cargar Carácter al LCD  ======
                ;===============================================
                ;Enable Pin A0
                ;R/S  Pin A1
                ;Datos Puerto C
Caracter_LCD            bcf porta,RS;
                        movfw Reg_RAM_LCD;
                        movwf portc;
                        call Pulso_E;
                        bsf porta,RS;
                        movfw Reg_Caracter;
                        movwf portc;    
                        call Pulso_E;
                        return;
;--------------------------------------------------------------------------------------------------
                ;===============================================
                ;======   Subrutina de Enable para LCD    ======
                ;===============================================
                ;Enable Pin A0
                ;R/S  Pin A1
                ;Datos Puerto C
Pulso_E                 bsf porta,Enable;
                        call retardo1;
                        bcf porta,Enable;
                        call retardo15;
                        return;
;--------------------------------------------------------------------------------------------------

                ;===============================================
                ;==== Subrutina de Muestreo de Display  =======
                ;===============================================

Muestreo_Displays       clrf portb;

                        return;
;--------------------------------------------------------------------------------------------------

                ;===============================================
                ;======  Subrutina de Retardo de 1 ms  =========
                ;===============================================

retardo1                movlw N;
                        movwf Contador2;
Loop2                   movlw L;
                        movwf Contador1;
Loop1                   decfsz Contador1,f;
                        goto Loop1;
                        decfsz Contador2,f;
                        goto Loop2;
                        return;
;--------------------------------------------------------------------------------------------------

                ;===============================================
                ;======   Subrutina de Retardo de 1s    ========
                ;===============================================

retardo                 movlw 0x05;N
                        movwf Contador3;
Loop7                   movlw 0xFF;M
                        movwf Contador2;
Loop6                   movlw 0xFF;L
                        movwf Contador1;
Loop5                   decfsz Contador1,f;
                        goto Loop5;
                        decfsz Contador2,f;
                        goto Loop6;
                        decfsz Contador2,f;
                        goto Loop7;
                        return;
;-----------------------------------------------------------------------------------------------------------
                ;===============================================
                ;======  Subrutina de Retardo de 15 ms  ========
                ;===============================================

retardo15               movlw M;
                        movwf Contador2;
Loop4                   movlw L;
                        movwf Contador1;
Loop3                   decfsz Contador1,f;
                        goto Loop3;
                        decfsz Contador2,f;
                        goto Loop4;
                        return;
;-----------------------------------------------------------------------------------------------------------

          END


