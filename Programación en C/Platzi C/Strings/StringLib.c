#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <string.h>
int main()
{
    char nombre[] = "Luis Fernando ";//Para apuntador char se puede asignar una cadena en vez de una dirección (la cual asignará por default).
    char otronommbre[]= "Zarazua Aguilar\0";
    strcpy(nombre,otronommbre);
    printf("Los nombres son: %s", strcmp(nombre,otronommbre) == 0 ? "iguales" : "distintos");
}