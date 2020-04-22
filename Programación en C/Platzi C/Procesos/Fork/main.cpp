#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>

typedef char NAME[100];
typedef char EMAIL[100];

typedef struct Node
{
    int number;
    struct Node* next;//Indica la siguiente posición (Estructura autoreferenciada).
}NODE;

NODE* createNode(int number)
{
    NODE* newNode;

    newNode = new NODE();
        //(NODE*) malloc(sizeof(NODE));
    newNode->next = NULL;
    newNode->number = number;
}

void MostrarNodos(NODE* start)
{
    NODE* current = start;
    printf("La lista contiene los numeros: \n");
    while (current)
    {
        printf("%d", current->number);
        printf(current->next ? ", " : "\n");
        current = current->next;
    }
}

void EliminarNodo(int nodeNumber, NODE** startPtr, int* listSize)
{
    NODE* start, * pastnode, * deletednode;
    if (nodeNumber <= *listSize && nodeNumber > 0) //Si esta fuera del limite solo muestra (no hace cambios).
    {
        start = *startPtr;   //Guarda el puntero al inicio de la lista.
        if (nodeNumber == 1) //Si es el primer nodo.
        {
            *startPtr = start->next; //Hace que el segundo nodo ahora sea el primero.
            free(start);             //Libera de memoria el nodo eliminado.
        }
        else //Si es un nodo de en medio
        {
            pastnode = start; //Se comienza en el nodo origen.
            for (int i = 1; i < nodeNumber - 1; i++)
            {
                pastnode = pastnode->next; //Avanza hasta el nodo anterior al que se quiere eliminar.
            }
            deletednode = pastnode->next;       //Obtiene el nodo que se quiere eliminar.
            pastnode->next = deletednode->next; //Se cambia la dirección del eliminado por el siguiente del eliminado.
            free(deletednode);                  //Libera de memoria el nodo eliminado.
        }
        *listSize = *listSize - 1;
    }
}

int main(int argc, char* argv[])
{
    NODE* start = NULL, * current, * next; //Crea variables de tipo puntero NODE start y  current.
    char goOn = 1;
    int listSize = 0, number;
    do
    {
        printf("La lista contiene %d nodos. Ingrese el siguiente numero (0 para finalizar).\n", listSize);
        scanf("%d", &number);
        if (number != 0)
        {
            if (!start)//Si la lista está vacia.
            {
                start = createNode(number);//Crea el nodo (sin saber cual es la siguiente locación de memoria).
            }
            else
            {
                current = start;//Guarda la primera locación de memoria en un puntero auxiliar (para nunca perder el inicio).
                while (current->next)//Cuando es nulo en el puntero auxiliar se terminó de recorrer la lista.
                {
                    current = current->next;//Se asigna la siguiente locación de memoria de la lista (tipo for).
                }
                current->next = createNode(number);//Crea un nuevo nodo (espacio de lista) y asigna la locación al elemento anterior (en el primer caso a start).
            }
            listSize++;
        }
        else
        {
            goOn = 0;
        }
    } while (goOn);

    do
    {
        goOn = 1;
        if (listSize > 0) { MostrarNodos(start); }
        printf("La lista contiene %d nodos. Ingrese el numero de nodo a borrar (0 para finalizar).\n", listSize);
        scanf("%d", &number);
        if (number)
        {
            EliminarNodo(number, &start, &listSize);
        }
        else
        {
            goOn = 0;
        }
    } while (goOn && listSize > 0);

    current = start;
    while (current)
    {
        next = current->next;//Guarda la siguiente direcciòn
        free(current);//Libera memoria.
        current = next;//Asigna a la dirección actual la guarda anteriormente.
    }

    return 0;
}