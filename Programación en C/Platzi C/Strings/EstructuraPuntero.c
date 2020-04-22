#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <string.h>
#include <stdlib.h>

typedef char NOMBRE[100];//Se define un nuevo tipo de dato
typedef int EDAD;

struct persona{           
        NOMBRE nombre;
        EDAD edad;
};

void RellenarDatosPersona(struct persona * personaje, const char * nombre, int edad)
{
    if (strlen(nombre) < 100)
    {
        strcpy((*personaje).nombre, nombre);
    }
   personaje->edad= edad;//(*personaje) se puede sustituir por ->.
}

int main(int argc, char * argv[])
{
    struct persona personaje;
    
    if (argc < 3)
    {
        printf("Indique nombre y edad por favor\n");
        return 1;
    }
    
    RellenarDatosPersona(&personaje, argv[1], atoi(argv[2]));
    printf("Nombre = %s edad = %d\n", personaje.nombre, personaje.edad);

    return 0;
    
}