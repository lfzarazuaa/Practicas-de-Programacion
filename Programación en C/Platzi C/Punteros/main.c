#include <stdio.h> //Directiva de precompilador (inclusión de archivo).

int main()
{
    int numero=116;
    int * punteroAnumero = &numero; //Puntero para dato de tipo int.
    printf("%p %d %d \n", punteroAnumero, &punteroAnumero, *punteroAnumero);
}