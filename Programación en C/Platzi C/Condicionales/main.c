
int main()
{
    int n = 1, acum = 10;
    while (acum<10)
    {
        acum += n;
        n++;
    }
    printf("Acum es %d:", acum);

    n = 1, acum = 10;
    do
    {
        acum += n;
        n++;
    }while (acum<10);
    printf("Acum es %d:", acum);
    return 0;
}