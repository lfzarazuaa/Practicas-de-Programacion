#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <string.h>
#include <stdlib.h>
int main(int argc, char * argv[])
{
    struct
    {           
        char nombre[100];
        int edad;
    }persona;
    
    if (argc < 3)
    {
        printf("Indique nombre y edad por favor\n");
        return 1;
    }
    if (strlen(argv[1]) < 100)
    {
        strcpy(persona.nombre, argv[1]);
    }

    persona.edad = atoi(argv[2]);
    printf("Nombre = %s edad = %d\n", persona.nombre, persona.edad);

    return 0;
    
}