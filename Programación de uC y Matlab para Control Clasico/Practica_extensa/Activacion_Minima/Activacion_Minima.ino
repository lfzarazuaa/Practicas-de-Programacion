//Programa para determinar con que voltaje promedio Inicia a girar el motor.
const int PWM1=5;
const int PWM2=6;
int Valor_pot;
int U=0,Valor_Inicial=55,Margen_Pot=0;
void setup() {
  // Inicializa el pin 5 y 6
  Serial.begin(9600);
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
         Serial.print("U=");
         Serial.print(U);
         Serial.print(",Valor Inicial=");
         Serial.print(Valor_Inicial);
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);
         Serial.flush();
}
void loop() {
  // put your main code here, to run repeatedly:
      if (Serial.available()>0){
      int opcion=Serial.parseInt();  // recibe un byte de la memoria intermedia serie
       if(opcion==1){
          U=Serial.parseInt();//K¨*Error.
          Valor_Inicial=Serial.parseInt();//Valor con que inicia el PWM.
          Margen_Pot=Serial.parseInt();//Variación con la que comienza a validar el error.
          if (Serial.read()=='r'){
           Serial.println("Datos U, Margen y Valor Inicial Recibidos.");
          }
        }
        else if (opcion==2){
         U=Serial.parseInt();
         if (Serial.read()=='r'){
           Serial.println("Dato U Recibido.");
          }
        }
        else if (opcion==3){
         Valor_Inicial=Serial.parseInt();
         if (Serial.read()=='r'){
           Serial.println("Dato Valor Inicial Potenciometro Recibido.");
          }
        }
        else if (opcion==4){
         Margen_Pot=Serial.parseInt();
         if (Serial.read()=='r'){
           Serial.println("Dato Margen Potenciometro Recibido.");
          }
        }
         Serial.print("U=");
         Serial.print(U);
         Serial.print(",Valor Inicial=");
         Serial.print(Valor_Inicial);
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);
         Serial.flush();
       }
  Giro_motor(U,Valor_Inicial,Margen_Pot);
  delay(5);
}

//void Giro_motor(int U, int K){
////Valor_PWM=map(U, 0, 1023, 0, 127)+127;
//   int Valor_PWM=map(U,-1023*K,1023*K,0,255);
//   Serial.println(Valor_PWM);
//   Serial.print(",");
//   analogWrite(PWM1,Valor_PWM);
//   analogWrite(PWM2,255-Valor_PWM);
//}

void Giro_motor(int U_1,int Valor_Inicial_1,int Margen_Pot_1){
//Valor_PWM=map(U, 0, 1023, 0, 127)+127;
   int Valor_PWM;  
   ///Marcar límites de la salida.
   if (U_1>1023)
    U_1=1023;
   else if (U_1<-1023)
    U_1=-1023;
   //Determina el valor del PWM y el Giro.
   if(U_1>Margen_Pot_1){//Giro en sentido horario
    Valor_PWM=map(U_1,1, 1023, Valor_Inicial_1, 255);
    analogWrite(PWM1,Valor_PWM);
    digitalWrite(PWM2,LOW);
   }
   else if(U_1<-Margen_Pot_1){//Giro en sentido antihorario
    Valor_PWM=map(-U_1,1, 1023, Valor_Inicial_1, 255);
    digitalWrite(PWM1,LOW);
    analogWrite(PWM2,Valor_PWM);
   }
   else{//No gira
    digitalWrite(PWM1,LOW);
    digitalWrite(PWM2,LOW);
   }
}
