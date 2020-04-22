#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
int main()
{
    char * nombre = "Luis";//Para apuntador char se puede asignar una cadena en vez de una dirección (la cual asignará por default).
    printf("Nombre = %s, (%p)\n",nombre, nombre);
    for (int i = 0; i < 5; i++)
    {
        printf("name[%d](%p) = %c = %c \n", i,nombre+i,nombre[i],*(nombre+i));
    }
    // gcc Strings\StringPuntero.c -o Strings/stringA
    // .\Strings\stringA.exe
}