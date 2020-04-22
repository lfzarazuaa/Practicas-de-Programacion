#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main(int argc, char * argv[])
{
    time_t oneDay = 24* 60 * 60;//Segundos en un dia.
    time_t today = time(NULL), nextDate;//Devuelva la fecha actual.
    nextDate= today+oneDay *atoi(argv[1]);
    printf("%s\n", nextDate);
    return 0;
}