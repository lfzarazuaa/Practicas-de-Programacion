#include <stdio.h> //Directiva de precompilador (inclusión de archivo).
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char * argv[])
{
    int pid = fork();
     
    if (pid!=0)//Número diferente de cero
    {
        printf("Este es el proceso padre\n. My PID es %d y tu PID es %d\n", getpid(),pid);
    }
    wait(NULL);
    printf("Soy el proceso padre.\n");
    else
    {
        printf("Soy el proceso hijo. Mi PID es %d\n", getpid());
        sleep(2);
    }
    
    while (1){}

    return 0;
}