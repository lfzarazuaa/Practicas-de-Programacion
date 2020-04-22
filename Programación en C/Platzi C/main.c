#include <stdio.h>

int main(int argc, char const *argv[])
{
    int a= 1;
    printf("El valor de a es %d",a);
    if (a==1)
    {
        a=2;
    }
    else
    {
        a=3;
    }
    printf("El valor de a es %d",a);
    return 0;
}
