#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>
#include "mylib.h"

int main(int argc, char * argv[])
{
    hello(argv[1]);
    return 0;
}