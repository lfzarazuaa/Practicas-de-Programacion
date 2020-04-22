#include <iostream>//Biblioteca para mostrar y escanear números.
 
int main () 
{
    int opcion;//Variable donde se almacena la cantidad de números a promediar.
    int repetir=1;//Variable que indica si se va a repetir o no el programa (1 para repetir, otra tecla para finalizar).
    float numEntradaA, numEntradaB;//Número que recibe cada uno de los datos a promediar.
    while (repetir==1)//Verifica si se repite o no (repetir se inicializó en 1 por repetir=1).
    {
        std::cout << "Ingrese la opcion deseada\n1-Suma.\n2-Resta.\n3-Multiplicacion.\n4-Division.\n";//Despliega la instrucción para ingresar la operación.
        std::cin >> opcion;//Lee el número ingresado y lo guarda en la variable opcion.
        switch (opcion)
        {
        case 1://Si opción vale 1.
                std::cout << "\nIngrese el sumando 1: ";//Pide el dato 1.
                std::cin >> numEntradaA;//Lee el dato ingresado.
                std::cout << "\nIngrese el sumando 2: ";//Pide el dato 2.
                std::cin >> numEntradaB;//Lee el dato ingresado.
                std::cout << numEntradaA << "+" << numEntradaB << "=" << numEntradaA+numEntradaB;//Calcula la suma y la muestra.
            break;
        case 2://Si opción vale 2.
                std::cout << "\nIngrese el minuendo: ";//Pide el dato 1.
                std::cin >> numEntradaA;//Lee el dato ingresado.
                std::cout << "\nIngrese el substrayendo: ";//Pide el dato 2.
                std::cin >> numEntradaB;//Lee el dato ingresado.
                std::cout << numEntradaA << "-" << numEntradaB << "=" << numEntradaA-numEntradaB;//Calcula la resta y la muestra.
            break;
        case 3://Si opción vale 3.
                std::cout << "\nIngrese el factor 1: ";//Pide el dato 1.
                std::cin >> numEntradaA;//Lee el dato ingresado.
                std::cout << "\nIngrese el factor 2: ";//Pide el dato 2.
                std::cin >> numEntradaB;//Lee el dato ingresado.
                std::cout << numEntradaA << "*" << numEntradaB << "=" << numEntradaA*numEntradaB;//Calcula la multiplicación y la muestra.
            break;
        case 4://Si opción vale 4.
                std::cout << "\nIngrese el factor 1: ";//Pide el dato 1.
                std::cin >> numEntradaA;//Lee el dato ingresado.
                std::cout << "\nIngrese el factor 2: ";//Pide el dato 2.
                std::cin >> numEntradaB;//Lee el dato ingresado.
                std::cout << numEntradaA << "/" << numEntradaB << "=" << numEntradaA/numEntradaB;//Calcula la división y la muestra.
            break;
        default://Si opción tiene otro valor.
                std::cout << "\nIngrese una opcion correcta. ";//Despliega mensaje de error,
            break;
        }
        
        std::cout << "\nDesea repetir el programa (1 para continuar/0 para salir):";//Despliega mensaje para repetir.
        std::cin >> repetir;//Lee el valor ingresado si es 1 el programa se repite.
    }
    return 0;//Finaliza la función.
}