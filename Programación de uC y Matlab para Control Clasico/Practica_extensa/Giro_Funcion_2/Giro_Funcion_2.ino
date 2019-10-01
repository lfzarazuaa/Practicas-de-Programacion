const int PWM1=5;
const int PWM2=6;
const int Referencia=A0;
const int Retro=A1;
int Valor_ref,Valor_retro;
int Error;
void setup() {
  // Inicializa el pin 5 y 6
  Serial.begin(9600);
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
}

// Función loop que corre el programa indefinidamente.
void loop() {
   int K=1;
   int U;
   int Valor_Inicial=0;
   
   if(Serial.available()>0){
     
     if (Serial.read()==',')
     {
      Valor_Inicial==1;
     }
   }   
   Valor_ref=analogRead(Referencia);
   Serial.print("Valor Ref=");
   Serial.print(Valor_ref);
   Serial.print(", Valor Retroalimentacion=");
   Valor_retro=analogRead(Retro);
   Serial.print(Valor_retro);
   Serial.print(", Error=");
   Error=Valor_ref-Valor_retro;
   Serial.print(Error);
   Serial.print(", Valor Inicial=");
   Serial.print(Valor_Inicial);
   Serial.print(", Valores PWM=");
   U=K*Error;
   if (U>1023){
   U=1023;}
   else if (U<-1023){
   U=-1023;} 
   Giro_motor(U,Valor_Inicial);
   delay(10);// Espera por 10 ms.   
}

//void Giro_motor(int U, int K){
////Valor_PWM=map(U, 0, 1023, 0, 127)+127;
//   int Valor_PWM=map(U,-1023*K,1023*K,0,255);
//   Serial.println(Valor_PWM);
//   Serial.print(",");
//   analogWrite(PWM1,Valor_PWM);
//   analogWrite(PWM2,255-Valor_PWM);
//}

void Giro_motor(int U, int Valor_Inicial){
//Valor_PWM=map(U, 0, 1023, 0, 127)+127;
   int Valor_PWM;
   if(U>0){//Giro en sentido horario
    Valor_PWM=map(U, 1, 1023, Valor_Inicial, 255);
    analogWrite(PWM1,Valor_PWM);
    digitalWrite(PWM2,LOW);
    Serial.println(Valor_PWM);
    Serial.print(",");
   }
   else if(U<0){
    Valor_PWM=map(-U, 1, 1023, Valor_Inicial, 255);
    digitalWrite(PWM1,LOW);
    analogWrite(PWM2,Valor_PWM);
    Serial.println(Valor_PWM);
    Serial.print(","); 
   }
   else{//No gira
    digitalWrite(PWM1,LOW); 
    digitalWrite(PWM2,LOW);
    Serial.print("0,"); 
   }
//   Serial.println(Valor_PWM);
//   Serial.print(",");
   analogWrite(PWM1,Valor_PWM);
   analogWrite(PWM2,255-Valor_PWM);
}
