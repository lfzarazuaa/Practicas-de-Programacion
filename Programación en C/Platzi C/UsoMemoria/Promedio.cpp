#include <iostream>//Biblioteca para mostrar y escanear números.
 
int main () 
{
    int cantidadNumeros;//Variable donde se almacena la cantidad de números a promediar.
    int repetir=1;//Variable que indica si se va a repetir o no el programa (1 para repetir, otra tecla para finalizar).
    float numEntrada;//Número que recibe cada uno de los datos a promediar.
    float promedio;//Variable donde se calcula el promedio.
    while (repetir==1)//Verifica si se repite o no (repetir se inicializó en 1 por repetir=1).
    {
        promedio = 0;//Inicializa el promedio en 0.
        std::cout << "Ingrese el numero de datos (Entre 1 y 100):";//Despliega la instrucción para ingresar la cantidad de números.
        std::cin >> cantidadNumeros;//Lee el numero ingresado y lo guarda en la variable cantidadNumeros.
        if (cantidadNumeros > 0 && cantidadNumeros < 100) //Verifica que no sea mayor a 100 y menor a 0.
        {
            for (int cont = 0; cont < cantidadNumeros; cont++)//Itera por cada número a promediar.
            {
                std::cout << "\nIngrese el dato numero " << cont + 1 << ":";//Pide el dato sobre el que se itera.
                std::cin >> numEntrada;//Lee el dato ingresado.
                promedio = promedio + numEntrada;//Suma el dato ingresado a la variable promedio.
            }
            promedio = promedio/(float)cantidadNumeros;//Calcula el promedio dividiendo sobre la cantidad de datos.
            std::cout << "El promedio es "<< promedio << " .\n";//Muestra el promedio en pantalla.
        }
        else
        {
            std::cout << "Ingrese un valor correcto.";//Muestra mensaje que se ingresó una cantidad de números incorrecta. 
        }
        std::cout << "Desea repetir el programa (1 para continuar/0 para salir):";//Despliega mensaje para repetir.
        std::cin >> repetir;//Lee el valor ingresado si es 1 el programa se repite.
    }
    return 0;//Finaliza la función.
}