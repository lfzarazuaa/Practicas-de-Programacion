//Programa para determinar con que voltaje promedio Inicia a girar el motor.
const int PWM1=3;
const int PWM2=11;
const int Referencia=A0;
const int Retro=A1;
int Valor_ref,Valor_retro,U,Error,K=1;
int Valor_Inicial=85,Margen_Pot=20;
int Valor_PWM;//Valor con que se manda el PWM.
void setup() {
  // Inicializa el pin 5 y 6
  Serial.begin(9600);
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
         Serial.print("K=");
         Serial.print(K);//Valor que Amplifica el error.
         Serial.print(",Valor Inicial=");
         Serial.print(Valor_Inicial);//Valor con que inicia el PWM.
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);//VariaciÃ³n con la que comienza a validar el error en el ADC.
         Serial.flush();
}
void loop() {
  // put your main code here, to run repeatedly:
      if (Serial.available()>0){
      int opcion=Serial.parseInt();  // recibe un byte de la memoria intermedia serie
       if(opcion==1){
          K=Serial.parseInt();//Valor que Amplifica el error.
          Valor_Inicial=Serial.parseInt();//Valor con que inicia el PWM.
          Margen_Pot=Serial.parseInt();//VariaciÃ³n con la que comienza a validar el error en el ADC.
          if (Serial.read()=='r'){
           Serial.println("Datos U, Margen y Valor Inicial Recibidos.");
          }
        }
        else if (opcion==2){
         K=Serial.parseInt();
         if (Serial.read()=='r'){
           Serial.println("Dato K Recibido.");
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
         Serial.print("K=");
         Serial.print(K);
         Serial.print(",Valor Inicial=");
         Serial.print(Valor_Inicial);
         Serial.print(",Margen Potenciometro=");
         Serial.println(Margen_Pot);
         
         Serial.print("U=");
         Serial.print(U);
         Serial.print("Error=");
         Serial.print(Error);
         Serial.print("Valor PWM=");
         Serial.println(Valor_PWM);
         Serial.flush();
       }
  ///Obtencion del error y control P.
  Valor_ref=analogRead(Referencia);//ObtenciÃ³n del valor de referencia al cual se quiere llegar.
  Valor_retro=analogRead(Retro);//ObtenciÃ³n del valor de retroalimentaciÃ³n en el cual se estÃ¡.
  Error=Valor_ref-Valor_retro;
  U=K*Error;
  Giro_motor(U,Valor_Inicial,Margen_Pot);
   delay(5);
//  Serial.print("U=");
//  Serial.print(U);
//  Serial.print("Error=");
//  Serial.print(Error);
//  Serial.print("Valor PWM=");
//  Serial.println(Valor_PWM);
}

//void Giro_motor(int U_1){
////Valor_PWM=map(U, 0, 1023, 0, 127)+127;
//   if (U_1>1023)
//    U_1=1023;
//   else if (U_1<-1023)
//    U_1=-1023;
//   int Valor_PWM=map(U,-1023,1023,0,255);
//   Serial.println(Valor_PWM);
//   Serial.print(",");
//   analogWrite(PWM1,Valor_PWM);
//   analogWrite(PWM2,255-Valor_PWM);
//}

void Giro_motor(int U_1,int Valor_Inicial_1,int Margen_Pot_1){
//Valor_PWM=map(U, 0, 1023, 0, 127)+127;
   
   ///Marcar lÃ­mites de la salida.
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

