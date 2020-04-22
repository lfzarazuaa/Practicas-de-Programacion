#include <stdio.h> //Directiva de precompilador (inclusión de archivo).

int main()
{
    int n=5;
    int m=155;
    int * pi = &n;//Direccion de la variable n.
    char c = 'B';
    char * pc = &c;//Direccion de la variable c.

    printf("Despues pi=%p y pc = %p pm %p\n", pi, pc, &m);
    //pi++;//Incremento de puntero de tipo int.
    pc++;//Incremento de puntero de tipo char.
    printf("Antes pi=%p y pc = %p\n", pi, pc);
    printf("n = %d y m= %d \n", *pi, *(pi-1));
}