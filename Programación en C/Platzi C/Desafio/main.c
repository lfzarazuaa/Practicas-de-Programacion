#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

char * CadenaMasLarga(int *num, char *argv[])
{
    int indice=1,lenCadena=0,lmax=0,i;
    for (i = 1; i < *num; i++)
    {
        lenCadena = strlen(argv[i]);
        if (lmax < lenCadena)
        {
            lmax = lenCadena;
            indice = i;
        }
    }
    
    return argv[indice];
}

int main(int argc, char * argv[])
{
    switch (argc)
    {
    case 1:
        printf("Sin elementos a comparar.");
        break;
    case 2:
        printf("La cadena mas larga es: %s", argv[1]);
        break;
    default:
        printf("La cadena mas larga es: %s", CadenaMasLarga(&argc,argv));
        break;
    }
    return 0;
}