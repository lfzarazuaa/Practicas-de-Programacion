#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

struct person
{
    char name[100];
    char nombre[100];
    unsigned int age;
};

int main(int argc, char * argv[])
{
    FILE * in;//Modo lectura.
    char buffer[100];
    
    if (argc<2)//Mientras no se llege al final del archivo.
    {
        char *msg="Indique el nombre del archivo de salida";
        printf("%s\n",msg);
        return -1;
    }

    if (!(in = fopen(argv[1], "r")))//Mientras no se llege al final del archivo.
    {
        printf("No se logro leer el archivo %s\n",argv[1]);
        return -2;
    }

    struct person p;

    while (fread(&p,sizeof(struct person), 1, in))
    {
        printf("%s tiene %d anios\n", p.nombre, p.age);
    }
    
    fclose(in);

    return 0;
}