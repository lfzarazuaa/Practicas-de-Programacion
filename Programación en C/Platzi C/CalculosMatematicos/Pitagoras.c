#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(int argc, char * argv[])
{
    int a, b;
    if (argc>1)
    {
        a = atof(argv[1]);
        b = atof(argv[2]);
        printf("La hipotenusa mide %.2f\n", sqrt(pow(a,2)+pow(b,2)));
    }
    return 0;
}