#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(int argc, char * argv[])
{
    srand(time(NULL));//Inicializar el generador de números aleatorios.
    printf("%d\n",rand());
    return 0;
}