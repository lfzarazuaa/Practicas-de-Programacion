#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <string.h>
int main(int argc, char * argv[])
{
    for (int i = 0; i < argc; i++)
    {
        printf("Argumento %d = %s\n",i, argv[i]);
    }
    
}