#include <stdio.h> //Directiva de precompilador (inclusión de archivo).

void duplicarSinRef(int a)
{
    a *= 2;
}

void duplicarRef(int *a)//Se le pasa la dirección de memoria.
{
    *a *= 2;
    int **b=&a;
}

int main()
{
    int a=0;
    printf("Ingrese el numero:");
    scanf("%d",&a);
    printf("\nAntes de duplicar a = %d\n", a);
    duplicarSinRef(a);
    printf("Despues de duplicar a = %d\n", a);
    ///Pasando la referencia.
    printf("Antes de duplicar a = %d\n", a);
    duplicarRef(&a);
    printf("Despues de duplicar a = %d\n", a);
}