/*
 * Teclado_Mega_Biblioteca.c
 *
 * Created: 24/04/2018 12:34:24 p. m.
 * Author : LuisFernando
 */ 

#include <avr/io.h>
#include <Teclado_Mega.h>
void Accion_Tecla_0(void){
  PORTA=Tecla_0;
}
void Accion_Tecla_1(void){
  PORTA=Tecla_1;
}
void Accion_Tecla_2(void){
  PORTA=Tecla_2;
}
void Accion_Tecla_3(void){
  PORTA=Tecla_3;
}
void Accion_Tecla_4(void){
  PORTA=Tecla_4;
}
void Accion_Tecla_5(void){
 PORTA=Tecla_5;
}
void Accion_Tecla_6(void){

}
void Accion_Tecla_7(void){

}
void Accion_Tecla_8(void){

}
void Accion_Tecla_9(void){

}
void Accion_Tecla_A(void){

}
void Accion_Tecla_B(void){

}
void Accion_Tecla_C(void){

}
void Accion_Tecla_D(void){

}
void Accion_Tecla_Ast(void){

}
void Accion_Tecla_Num(void){

}
int main(void)
{
    cli();
    DDRA=0xFF;
    DDRB=0xFF;
    Inicializar_Teclado();
    sei();
    /* Replace with your application code */
    while (1)
    {
	    PORTB=Tecla_Presionada;
    }
}

