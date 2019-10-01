#include <LiquidCrystal_I2C.h>
#include <Wire.h>
#include <RTClib.h>

#define BACKLIGHT_PIN     3
#define I2C_ADDR    0X27                                                                                      

#define  LED_OFF  0
#define  LED_ON  1
//                    addr, en,rw,rs,d4,d5,d6,d7,bl,blpol
LiquidCrystal_I2C lcd(I2C_ADDR, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
// Creat a set of new characters
const char weekday [][7] = {"Dom","Lun","Mar","Mie","Jue","Vie","Sab"};
const char months [][13] = {"   ","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"};    

RTC_DS1307 RTC;
void setup () {
     Wire.begin(); // Establece la velocidad de datos del bus I2C
     RTC.begin(); // Establece la velocidad de datos del RTC
     lcd.begin(16,2);
     lcd.setBacklightPin(BACKLIGHT_PIN,POSITIVE);
     lcd.setBacklight(LED_ON);
   if(RTC.readnvram(0x10)!=1)
     {
      RTC.writenvram(0x10, 0x01);//Escritura por primera vez
      RTC.adjust(DateTime(F(__DATE__), F(__TIME__)));
     }
     Serial.begin(9600);
     lcd.println("Comunicacion Comenzada");
     //Serial.flush();
}
void cero(int a){
 if(a<10)
   lcd.print("0");
}

void loop () {
  int Anio, Mes, Dia, Hora, Minuto, Segundo;
      if (Serial.available()>0){
      // Mes Dia, Año, Hora, Minuto, Segundo:
      // rtc.adjust(DateTime(2014, 1, 21, 3, 0, 0));
       Anio = Serial.parseInt();
       Mes = Serial.parseInt();
       Dia = Serial.parseInt();
       Hora = Serial.parseInt();
       Minuto= Serial.parseInt();
       Segundo= Serial.parseInt();
       if (Serial.read() == 'r') {
        //Serial.flush();
        delay(5);
        RTC.adjust(DateTime(Anio, Mes, Dia, Hora, Minuto, Segundo));
        //Serial.print(Anio, DEC);
        //Serial.write("/");
        //Serial.print(Mes, DEC);
        //Serial.write("/");
        //Serial.print(Dia, DEC);
        //Serial.write("/");
        Serial.write(" Datos Cambiados");
        Serial.println();
       }
      }
      else{
      DateTime now = RTC.now();
      int mes=now.month();
      int dia=now.day();
      lcd.setCursor(0,0);
      lcd.print(weekday[now.dayOfWeek()]);
      lcd.setCursor(3,0);
    
      lcd.print(" ");
      cero(now.day());
      lcd.print(now.day(), DEC);
      lcd.print('/');
      lcd.print(months[now.month()]);
      lcd.print('/');
      cero(now.year());
      lcd.print(now.year(), DEC);
      lcd.print(' ');
    
      lcd.setCursor(3,1);
    
      lcd.print(" ");
      cero(now.hour());
      lcd.print(now.hour(), DEC);
      lcd.print(':');
      cero(now.minute());
      lcd.print(now.minute(), DEC);
      lcd.print(':');
      cero(now.second());
      lcd.print(now.second(), DEC);
      //lcd.println();
      delay(15);
      }
   }
