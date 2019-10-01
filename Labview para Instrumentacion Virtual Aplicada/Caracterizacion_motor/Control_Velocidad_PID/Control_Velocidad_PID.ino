//Programa para determinar con que voltaje promedio Inicia a girar el motor.
const int PWM1=3;
const int PWM2=11;
const int Referencia=A0;
const int Retro=A1;
int Valor_ref,Valor_retro;
//float K=9.7313,KD=0.1460,Error=0;
float K=1,KD=0,Error=0;
int Valor_Inicial_1=0,Margen_Pot=3,U;//Pot es entrada analogica de la velocidad;
float Error_Presente=0,Error_Pasado=0;
float dif,Ts;
unsigned long Tiempo_Inicial,Tiempo_Final,Tiempo;
float Valor_PWM=0;//Valor con que se manda el PWM.
const float factor=10000;
void setup() {
  // Inicializa el pin 5 y 6
  Serial.begin(9600);
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
         Serial.print("K=");
         Serial.print(K);//Valor que Amplifica el error.
         Serial.print("KD=");
         Serial.print(KD);//Valor que Amplifica derivada del error.
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);//VariaciÃ³n con la que comienza a validar el error en el ADC.
         Serial.flush();
         Tiempo_Inicial=micros();
}
void loop() {
  // put your main code here, to run repeatedly:
      if (Serial.available()>0){
      int opcion=Serial.parseInt();  // recibe un byte de la memoria intermedia serie
       if(opcion==1){
          K=Serial.parseInt()/factor;//Valor que Amplifica el error.
          KD=Serial.parseInt();//Valor con que inicia el PWM.
          Margen_Pot=Serial.parseInt();//VariaciÃ³n con la que comienza a validar el error en el ADC.
          if (Serial.read()=='r'){
           Serial.println("Datos U, Margen y Valor Inicial Recibidos.");
          }
        }
        else if (opcion==2){
         K=Serial.parseInt()/factor;
         if (Serial.read()=='r'){
           Serial.println("Dato K Recibido.");
          }
        }
        else if (opcion==3){
         KD=Serial.parseInt()/factor;
         if (Serial.read()=='r'){
           Serial.println("Dato KD Recibido.");
          }
        }
        else if (opcion==4){
         Margen_Pot=Serial.parseInt();
         if (Serial.read()=='r'){
           Serial.println("Dato Margen Potenciometro Recibido.");
          }
        }
         Serial.print("K=");
         Serial.print(K);
         Serial.print(",KD=");
         Serial.print(KD);
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);
         
         Serial.print("U=");
         Serial.print(U);
         Serial.print("Error=");
         Serial.print(Error);
         Serial.print("Tiempo=");
         Serial.print(Tiempo);
         Serial.print("Derivada=");
         Serial.print(dif);
         Serial.print("Valor PWM=");
         Serial.println(Valor_PWM);
         Serial.flush();
       }
  ///Obtencion del error y control P.
  Tiempo_Final=micros();
  //Cálculos del tiempo.
  Tiempo=Tiempo_Final-Tiempo_Inicial;
  //k1=K+TD*K/Ts;
  //k2=k*TD/Ts;
  //Cálculos del tiempo.
  Tiempo_Inicial=micros();
  Valor_ref=analogRead(Referencia);//ObtenciÃ³n del valor de referencia al cual se quiere llegar.
  Valor_retro=analogRead(Retro);//ObtenciÃ³n del valor de retroalimentaciÃ³n en el cual se estÃ¡.
  ////
  //Ts=Tiempo/1000000;
  //dif=(Error_Presente-Error_Pasado)/Ts;
  dif=(Error_Presente-Error_Pasado)*1000000/Tiempo;
  ///
  Error_Pasado=Error;
  Error=Valor_ref-Valor_retro;
  Error_Presente=Error;
  U=K*Error+KD*dif;
  Giro_motor(U,Margen_Pot);
  delay(5);
}

void Giro_motor(int U_1,int Margen_Pot_1){
//Valor_PWM=map(U, 0, 1023, 0, 127)+127;
   
   ///Marcar límites de la salida.
   if (U_1>1023)
    U_1=1023;
   else if (U_1<-1023)
    U_1=-1023;
   //Determina el valor del PWM y el Giro.
   if(U_1>Margen_Pot_1){//Reducción de Velocidad
    Valor_PWM=Valor_PWM+map(U_1,1, 1023, Valor_Inicial_1, 255);
    if (Valor_PWM>255){
     Valor_PWM=255;  
    }
    analogWrite(PWM1,Valor_PWM);
   }
   else if(U_1<-Margen_Pot_1){//Aumento de Velocidad
    Valor_PWM=Valor_PWM-map(-U_1,1, 1023, Valor_Inicial_1, 255);
    if (Valor_PWM<5){
     Valor_PWM=5;  
    }
    analogWrite(PWM1,Valor_PWM);
   }
   else{//No gira
    Valor_PWM=Valor_PWM;
   }
}

