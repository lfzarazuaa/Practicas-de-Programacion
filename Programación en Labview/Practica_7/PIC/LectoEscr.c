/////////////////////////////////////////////////////////////////////////
//// LectoEscr.c ////
//// ////
//// Este archivo contiene las rutinas y configuraci�n necesaria ////
//// para el funcionamiento del PIC, con este c�digo se leen los ////
//// valores de las entradas del microcontrolador y se env�an, ////
//// tambi�n se reciben los datos enviados por la PC y se colocan ////
//// en las salidas. ////
//// Esta configuraci�n se basa en los parametros indicados ////
//// en la norma USB 2.0 ////
//// ////
////////////////////////////////////////////////////////////////////////

#include <18F4550.h> //Libreria con las instrucciones del PIC
//Configuraci�n del reloj
#FUSES HSPLL
#FUSES PLL5
#FUSES USBDIV
#FUSES CPUDIV1
#FUSES NOWDT,NOPROTECT,NOLVP,NODEBUG,VREGEN
//Fin de configuraci�n de los fuses

#use delay(clock=48000000) //Definimos la frecuencia del oscilador

#define USB_HID_DEVICE FALSE
//deshabilitamos el uso de las directivas HID
#define USB_EP1_TX_ENABLE USB_ENABLE_BULK
//Habilitamos EP1(EndPoint1) de entrada para transferencias masivas (bulk)
#define USB_EP1_RX_ENABLE USB_ENABLE_BULK
//Habilitamos EP1(EndPoint1) de salida para transferencias masivas (bulk)
#define USB_EP1_TX_SIZE 8
//Tama�o del buffer para el endpoint de transferencias
#define USB_EP1_RX_SIZE 8
//Tama�o del buffer para el endpoint de recepci�n

#include <pic18_usb.h>
//Driver para la familia Microchip PIC18Fxx5x
#include <Descriptores.h>
//Configuraci�n del USB y los descriptores para este dispositivo
#include <usb.c>
//Libreria con las instrucciones para el manejo del puerto USB

#define LEDV PIN_C0 //Se definen los pines que se ocupar�n
#define LEDR PIN_C1 //los LED's indicadores
#define Enciende output_high // as� como las instrucciones
#define Apaga output_low // para encenderlos y apagarlos

//Se definen variables para cada una de las posiciones
//de la variable recbuf, la cual es un arreglo de 8 elementos
#define B0 recbuf[0]
#define B1 recbuf[1]
#define B2 recbuf[2]
#define B3 recbuf[3]
#define B4 recbuf[4]
#define B5 recbuf[5]
#define B6 recbuf[6]
#define B7 recbuf[7]

//Se define un nombre para cada uno de los pines del puerto B
#define BIT0 PIN_B0
#define BIT1 PIN_B1
#define BIT2 PIN_B2
#define BIT3 PIN_B3
#define BIT4 PIN_B4
#define BIT5 PIN_B5
#define BIT6 PIN_B6
#define BIT7 PIN_B7

//Rutina principal
void main(void) {

int1 recbuf[8]; //Se declaran las variables donde seran
int1 envia[8]; //almacenados los datos a enviar y recibir
//ambas ser�n de 8 bits

Apaga(LEDV); //encendemos led rojo hasta que se
Enciende(LEDR); //enumere el dispositivo

usb_init(); //se inicializa el puerto USB
usb_task(); //se habilita el periferico
usb_wait_for_enumeration();
//la ejecuci�n del c�digo se detiene en este punto hasta que
//el dispositivo haya sido enumerado por el host, una vez
//que esto ocurra el programa continua su ejecuci�n

while (TRUE) //Esta rutina ser� efectuada incondicionalmente
{
if(usb_enumerated()) //si el dispositivo ha sido enumerado
Apaga(LEDR); //se apaga el LED indicador rojo y se
Enciende(LEDV); //enciende el LED verde
{
while (true){ /*Una vez encendidos los indicadores se ejecuta
este ciclo de manera incondicional
Para la comunicaci�n desde el PIC a la PC (host):
Dependiendo del estado de las entradas (1 � 0) se almacena su
valor en la variable env�a, la cual es un arreglo de 8 bits
*/
if(input(PIN_D0))
{envia[0]=1;}
else
{envia[0]=0;}
if(input(PIN_D1))
{envia[1]=1;}
else
{envia[1]=0;}
if(input(PIN_D2))
{envia[2]=1;}
else
{envia[2]=0;}
if(input(PIN_D3))
{envia[3]=1;}
else
{envia[3]=0;}
if(input(PIN_D4))
{envia[4]=1;}
else
{envia[4]=0;}
if(input(PIN_D5))
{envia[5]=1;}
else
{envia[5]=0;}
if(input(PIN_D6))
{envia[6]=1;}
else
{envia[6]=0;}
if(input(PIN_D7))
{envia[7]=1;}
else
{envia[7]=0;}

usb_put_packet(1, envia,8, USB_DTS_TOGGLE);
/*Se envia la variable "envia", la cual tiene un tama�o de
8 bits, por el endpoint 1 */

//Para efectuar la comunicaci�n desde la PC (host) al PIC
if (usb_kbhit(1)) {
//si el endpoint de entrada contiene datos provenientes del host el
//programa continua su ejecuci�n, de lo contrario salta esta secci�n
usb_get_packet(1,recbuf,8);
/*Se recibe la informaci�n y se almacena en la variable recbuf
que es de tipo arreglo, cada una de las posiciones corresponde
a cada uno de los bits del puerto B*/
if(B0 == 1)
Enciende(BIT0);
else
Apaga(BIT0);

if(B1 == 1)
Enciende(BIT1);
else
Apaga(BIT1);

if(B2 == 1)
{Enciende(BIT2); }
else
{Apaga(BIT2);}

if(B3 == 1)
{Enciende(BIT3); }
else
{Apaga(BIT3);}

if(B4 == 1)
{Enciende(BIT4); }
else
{Apaga(BIT4);}

if(B5 == 1)
{Enciende(BIT5); }
else
{Apaga(BIT5);}

if(B6 == 1)
{Enciende(BIT6); }
else
{Apaga(BIT6);}

if(B7 == 1)
{Enciende(BIT7); }
else
{Apaga(BIT7);}
}
}
}
}
} //Fin del programa

