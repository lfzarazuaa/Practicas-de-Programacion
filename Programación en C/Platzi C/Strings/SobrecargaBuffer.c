#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <string.h>
int main(int argc, char * argv[])
{
    char buffer [20];
    char * buffer2 = "Esto va a ser sobrescito.";
    printf("Buffer 2 orignial = %s\n", buffer2);
    strcpy(buffer,argv[1]);//Copia el string sin verificar la struct
    printf("Nuevo Buffer2 = %s\n", buffer2);//No se ejecuta al no poder copiar en el string original.
}