#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

int main(int argc, char * argv[])
{
    FILE * fp = fopen(argv[1], "r");//Modo lectura.
    char c;
    while ((c = fgetc(fp)) != EOF)//Mientras no se llege al final del archivo.
    {
        printf("%c",c);
    }
    
    fclose(fp);

    return 0;
}