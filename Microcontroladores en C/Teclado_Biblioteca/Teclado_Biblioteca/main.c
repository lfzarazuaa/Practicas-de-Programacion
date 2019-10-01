/*
 * Teclado_Biblioteca.c
 *
 * Created: 22/04/2018 11:03:00 p. m.
 * Author : LuisFernando
 */ 
#define F_CPU 1000000UL
#include <avr/io.h>
#include <Teclado_Matricial_lib.h>

int main(void)
{
	DDRA=0xFF;
	Inicializar_Teclado();
    /* Replace with your application code */
    while (1) 
    {
		PORTA=Obtener_Tecla();
    }
}

