#include <iostream.h>
#include <string.h>
#include <windows.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
BOOL SerialSendByte(HANDLE hPort, BYTE byte); 
BOOL SerialReceiveByte(HANDLE hPort,BYTE *pbyte, BOOL *PTimeout); 
BOOL CloseSerialPort(HANDLE hPort); 

HANDLE OpenSerialPort(char *psPort,DWORD dwBaudRate, BYTE  dwByteSize,BYTE  bParity,BYTE  bStopBits, DWORD Timeout){
   HANDLE hPort;
   DCB    dcbPort;
   DWORD  dwError;
   COMMTIMEOUTS commTimeouts;
   
   hPort = CreateFile(psPort,GENERIC_READ | GENERIC_WRITE,0,NULL,OPEN_EXISTING,0,NULL);
   if(hPort == INVALID_HANDLE_VALUE)
   {
            dwError = GetLastError();
            system("pause");
            return(hPort);
   }
   FillMemory(&dcbPort, sizeof(dcbPort),0);
   dcbPort.DCBlength = sizeof(dcbPort);
   
   GetCommState (hPort, &dcbPort); 
   dcbPort.BaudRate = dwBaudRate; 
   dcbPort.ByteSize = dwByteSize;
   dcbPort.Parity   = bParity;
   dcbPort.StopBits = bStopBits;
   
   if(!SetCommState(hPort, &dcbPort))  
   {
        dwError = GetLastError();
        CloseSerialPort(hPort);
        hPort = INVALID_HANDLE_VALUE;
        return(hPort);
   }
   
   if(!SetCommTimeouts(hPort, &commTimeouts))
   {
        dwError = GetLastError();
        CloseSerialPort(hPort);
        hPort = INVALID_HANDLE_VALUE;
        return(hPort);
   } 
   
   return hPort;
}

BOOL SerialSendByte(HANDLE hPort, BYTE byte){
     BOOL bRes;
     DWORD dwError, dwNumBytesWritten = 0;
     
     bRes = WriteFile(hPort,&byte,1,&dwNumBytesWritten,NULL);
                     
     if((!bRes)||(dwNumBytesWritten !=1))
     {
                                    dwError = GetLastError();
     }
     
     return bRes;
}

BOOL SerialReceiveByte(HANDLE hPort, BYTE *pbyte, BOOL *PTimeout)
{
    BOOL bRes;
    DWORD dwError, lpNumberOfBytesRead=0;
    DWORD *pTimeout; 
    
    *pTimeout =FALSE;
    bRes = ReadFile(hPort,pbyte,1,&lpNumberOfBytesRead,NULL);
    if(!bRes){
       dwError = GetLastError();          
    }   
    
    if((bRes)&& (lpNumberOfBytesRead ==0)){
       *pTimeout = TRUE;        
    }  
   return bRes;
}

BOOL CloseSerialPort(HANDLE hPort)
{
   BOOL bRes;
   DWORD dwError;
   
   bRes = CloseHandle(hPort); 
   
    if(!bRes){
       dwError = GetLastError();          
    }   
       
    return bRes; 
}
void int2char(int x, char r[])
{
  if(x<10){
   r[0]='0';
   r[1]=48+x;
           }    
  else{
   r[0]=x/10+48;
   r[1]=x%10+48;
       }
}
int main()
 {
  HANDLE hPort;
  BOOL   bRes;
  char   c;
  BYTE   byte;
  BOOL   Timeout;
  
  hPort = OpenSerialPort("COM2",CBR_9600,8,NOPARITY,ONESTOPBIT,5000);  
  if(hPort == INVALID_HANDLE_VALUE){
       printf("Error al abrir el puerto\n");
       system("pause");
       return 1;
  }   
   int anio=15;
   int mes=2;
   int dia=21;
   int hora=12;
   int minuto=17;
   int segundo=33;
   int datos[6];
   char cadena[3];
   char n=164;
   char i=161;
      //printf("\nLectura: ");
      //bRes = SerialReceiveByte(hPort, &byte, &Timeout);
      printf("\t\t\tReloj en C para LCD por Serial/I2C");
      printf("\nIngrese a%co: ",n);
      scanf("%d",&anio);
      printf("\nIngrese mes: ");
      scanf("%d",&mes);
      printf("\nIngrese d%ca: ",i);
      scanf("%d",&dia);
      printf("\nIngrese hora: ");
      scanf("%d",&hora);
      printf("\nIngrese minuto: ");
      scanf("%d",&minuto);
      printf("\nIngrese segundo: ");
      scanf("%d",&segundo);
       int s = 1, d = 1;
       for ( s = 1 ; s <= 25000 ; s++ )
       for ( d = 1 ; d <= 32767 ; d++ )
       {}
      int j;
      cadena[2]=',';
      datos[0]=anio;
      datos[1]=mes;
      datos[2]=dia;
      datos[3]=hora;
      datos[4]=minuto;
      datos[5]=segundo;
      for(j=0;j<=5;j++){
          if(j==5)
          cadena[2]='r';
          int2char(datos[j], cadena);
          bRes =SerialSendByte(hPort, cadena[0]);
          bRes =SerialSendByte(hPort, cadena[1]);
          bRes =SerialSendByte(hPort, cadena[2]);
          }
    /*bRes =SerialSendByte(hPort, '1');
      bRes =SerialSendByte(hPort, '5');
      bRes =SerialSendByte(hPort, ',');
      bRes =SerialSendByte(hPort, '0');
      bRes =SerialSendByte(hPort, '7');
      bRes =SerialSendByte(hPort, ',');
      bRes =SerialSendByte(hPort, '2');
      bRes =SerialSendByte(hPort, '0');
      bRes =SerialSendByte(hPort, ',');
      bRes =SerialSendByte(hPort, '1');
      bRes =SerialSendByte(hPort, '5');
      bRes =SerialSendByte(hPort, ',');
      bRes =SerialSendByte(hPort, '5');
      bRes =SerialSendByte(hPort, '2');
      bRes =SerialSendByte(hPort, ',');
      bRes =SerialSendByte(hPort, '2');
      bRes =SerialSendByte(hPort, '0');
      bRes =SerialSendByte(hPort, 10);*/
      CloseSerialPort(hPort);
      system ("pause");
      return 0; 
 }
