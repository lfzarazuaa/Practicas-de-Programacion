#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

typedef char NAME[100];
typedef char EMAIL[100];

typedef struct
{
    NAME name;
    EMAIL email;
} CONTACT;

int main(int argc, char *argv[]) //Comentarios inutiles.
{                                //Comentarios inutiles.
    CONTACT *list = NULL;        //Comentarios inutiles.
    char buffer[100];            //Comentarios inutiles.
    int goOn = 1, listSize = 0;  //Comentarios inutiles.
    do
    {
        printf("Ingrese el nombre del nuevo contacto (0 para terminar)\n");
        scanf("%99s", buffer);
        if (strcmp("0", buffer) != 0)
        {
            if (!list) //Si la lista no tiene ningun elemento reserva memoria.
            {
                list = malloc(sizeof(CONTACT)); //Reservar memoria para el primer elemento en la lista.
            }
            else
            {
                list = realloc(list, sizeof(CONTACT) * (listSize + 1)); //Reserva mas memoria de la que ya tenia.
            }
            strcpy(list[listSize].name, buffer); //Guarda la información.
            printf("Ingrese el email del %s\n", buffer);
            scanf("%99s", buffer);
            strcpy(list[listSize].email, buffer); //Guarda la información.
            listSize++;
        }
        else
        {
            goOn = 0;
        }
    } while (goOn);

    printf("\n Esta es tu lista de contactos.!!:\n");

    printf("Nombre\t\tEmail\n");

    for (int i = 0; i < listSize; i++)
    {
        printf("%s\t\t%s\n", list[i].name, list[i].email);
    }
    free(list);
    return 0;
}