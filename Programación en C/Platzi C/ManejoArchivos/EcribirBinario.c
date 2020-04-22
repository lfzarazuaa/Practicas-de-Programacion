#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

struct person
{
    char name[100];
    unsigned int age;
};

int main(int argc, char * argv[])
{
    FILE * out ;//Modo escritura.
    char buffer[100];
    
    if (argc<2)//Mientras no se llege al final del archivo.
    {
        char *msg="Indique el nombre del archivo de salida";
        printf("%s\n",msg);
        return -1;
    }

    if (!(out = fopen(argv[1], "w")))//Mientras no se llege al final del archivo.
    {
        printf("No se logro escribir el archivo %s\n",argv[1]);
        return -2;
    }

    struct person p;

    do
    {
        printf("Ingrese el nombre de la persona: ");
        scanf("%99s",p.name);//p.name ya es un puntero.
        printf("Ingrese la edad de la persona: ");
        scanf("%d", &(p.age));
        fwrite(&p,sizeof(struct person), 1, out);
        printf("¿Desea grabar otra palabra? (s/n)");
        scanf("%1s",buffer);
    } while (buffer[0]!='n');
    
    fclose(out);

    return 0;
}