int main()
{
    int a = 1;

    if(a==1)
    {
        a = 2;
    }
    else
    {
        a = 3;
    }
    
    switch (a)
    {
    case 1:
        a=10;
    case 2:
        a=20;
    case 3:
        a=50;
    default:
        a=100;
        break;
    }
}