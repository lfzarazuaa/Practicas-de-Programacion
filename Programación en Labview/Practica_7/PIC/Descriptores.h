///////////////////////////////////////////////////////////////////////////
//// Descriptores.h ////
//// ////
//// En este archivo se configuran los elementos descriptores del ////
//// PIC, como son el VID y el PID para el correcto funcionamiento ////
//// del dispositivo. Ademas se configuro el nombre con el que el ////
//// dispositivo sera reconocido por la PC. ////
//// ////
//// Esta configuracion se basa en los parametros indicados ////
//// en la norma USB 2.0 ////
//// ////
/////////////////////////////////////////////////////////////////////////
#IFNDEF __USB_DESCRIPTORS__
#DEFINE __USB_DESCRIPTORS__

#include <usb.h> //Se incluye la libreria con las directivas USB

#DEFINE USB_TOTAL_CONFIG_LEN 32
//Longitud=config+interface+class+endpoint

//Descripcion de la configuracion
char const USB_CONFIG_DESC[] = {
USB_DESC_CONFIG_LEN, //longitud del descriptor
USB_DESC_CONFIG_TYPE, //constante para CONFIGURATION (0x02)
USB_TOTAL_CONFIG_LEN,0,
//Tamano de datos que regresa esta configuracion
1,
//Numero de interfaces soportadas por el dispositivo
0x01,
//Identificador de esta configuracion
0x00,
//indice de la cadena que describe esta configuracion
0xC0,
//bit6=1: autoalimentado (selfÅ]powered)
//bit5=1: activacion remota
//bits 0Å]4: reservados
//bit7=1
0x32,
//energia maxima requerida por el puerto
//(maximum milliamperes/2) (0x32 = 100mA)

//Descripcion de la interfaz
USB_DESC_INTERFACE_LEN, //longitud del descriptor
USB_DESC_INTERFACE_TYPE, //constante para INTERFACE (0x04)
0x00, //Numero que define esta interfaz
0x00, //Seleccion alternativa de interfaz
2, //Numero de endpoints
0xFF, //Codigo de clase
0xFF, //Codigo de subclase
0xFF, //Codigo de protocolo
0x00, //indice de la cadena que
//describe esta configuracion

//Descripcion de endpoint de entrada
USB_DESC_ENDPOINT_LEN,
//longitud del descriptor
USB_DESC_ENDPOINT_TYPE,
//constante para ENDPOINT (0x05)
0x81,
//Numero y direccion del Endpoint (0x81 = EP1 IN)
0x02,
//Tipo de transferencia
//0: control, 1: iso, 2: masiva, 3: interrupciones
USB_EP1_TX_SIZE, 0x00,
//Tamano maximo de paquete soportado
0x01,
//intervalo de polling en ms
//solo para transferencia con interrupciones

//Descripcion de endpoint de salida
USB_DESC_ENDPOINT_LEN,
//longitud del descriptor
USB_DESC_ENDPOINT_TYPE,
//constante para ENDPOINT (0x05)
0x01,
//Numero y direccion del Endpoint (0x01 = EP1 OUT)
0x02,
//Tipo de transferencia
//0 is control, 1 is iso, 2 is bulk, 3 is interrupt
USB_EP1_RX_SIZE, 0x00,
//Tamano maximo de paquete soportado
0x01,
//intervalo de polling en ms
//solo para transferencia con interrupciones
};


#define USB_NUM_HID_INTERFACES 0

#define USB_MAX_NUM_INTERFACES 1


const char USB_NUM_INTERFACES[USB_NUM_CONFIGURATIONS]={1};

#if (sizeof(USB_CONFIG_DESC) != USB_TOTAL_CONFIG_LEN)
#error USB_TOTAL_CONFIG_LEN not defined correctly
#endif
//Descriptores del dispositivo
char const USB_DEVICE_DESC[] ={
USB_DESC_DEVICE_LEN, //Longitud del reporte
0x01, //Constante del dispositivo (0x01)
0x10,0x01, //Version de USB (1.1)
0x00, //Codigo de clase
0x00, //Codigo de subclase
0x00, //Codigo de protocolo
USB_MAX_EP0_PACKET_LENGTH,
//Tamano maximo de paquete para endpointt 0.
//(Baja Velocidad especifica 8)
0xd8,0x04, //vendor id (0x04D8 Microchip)
0x0b,0x00, //product id (0x000b PIC18 Family)
0x01,0x00, //Numero de version del dispositivo
0x01, //Indice de cadena del productor
0x02, //Indice de cadena del producto
0x00, //Indice de cadena del numero de serie
USB_NUM_CONFIGURATIONS //Numero de posibles configuraciones
};

const char USB_STRING_DESC_OFFSET[]={0, 4, 12};
//Ubicacion del inicio de las cadenas

#define USB_STRING_DESC_COUNT sizeof(USB_STRING_DESC_OFFSET)

char const USB_STRING_DESC[]={
//string 0
4, //Longitud de la cadena
USB_DESC_STRING_TYPE, //Tipo de descriptor: String
0x0a,0x08, //Definicion de Microsoft para idioma ingles de EUA
//string 1
8, //Longitud de la cadena
USB_DESC_STRING_TYPE, //Tipo de descriptor: String
'U',0,
'S',0,
'B',0,
//string 2
24, //Longitud de la cadena
USB_DESC_STRING_TYPE, //Tipo de descriptor: String
'D',0,
'A',0,
'Q',0,
'_',0,
'L',0,
'a',0,
'b',0,
'V',0,
'I',0,
'E',0,
'W',0
};
#ENDIF

