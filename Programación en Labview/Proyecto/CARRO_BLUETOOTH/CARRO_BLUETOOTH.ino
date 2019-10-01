const int Lampara = 13;
const int LLanta_Izq_A=5;//Pin de la llanta Izquierda_A.
const int LLanta_Izq_B=6;//Pin de la llanta Izquierda_B.
const int LLanta_Der_A=3;//Pin de la llanta Derecha_A.
const int LLanta_Der_B=11;//Pin de la llanta Derecha_B.
const int Led_Prueba=9;//Pin del Led de Prueba.
const int Paro=0;//Motor en Paro.
const int Adelante=1;//Motor Girando hacia adelante.
const int Atras=2;//Motor Girando hacia átras.
const int Vel_1=1;//Velocidad Moderada.
const int Vel_2=2;//Velocidad Rapida.
int Carga_PWM,Carga_PWM2,Opcion_A;
void setup()
{
  // initialize the serial communication:
  Serial.begin(9600);
  // initialize the ledPin as an output:
  pinMode(Lampara, OUTPUT);
  pinMode(LLanta_Izq_A, OUTPUT);
  pinMode(LLanta_Izq_B, OUTPUT);
  pinMode(LLanta_Der_A, OUTPUT);
  pinMode(LLanta_Der_B, OUTPUT);
  pinMode(Led_Prueba, OUTPUT);
  TCCR0A =163;//1010,0011 Modo PWM.
  TCCR0B =03;//0000,0011 factor de 64
  TCCR2A =163;
  TCCR2B =03;
  Carga_PWM=200;
  Carga_PWM2=100;
  Opcion_A=8;
  Motor(Paro,Vel_1,Paro,Vel_1);
}
void loop() {
int Opcion,Carga;
 if (Serial.available()>0) {
   Opcion = Serial.parseInt();
   if (Serial.read() == 'r') {
    //Serial.println(Opcion);
    if(Opcion == 0){//Giro Este.
     Motor(Adelante,Vel_2,Paro,Vel_1);}
    else if(Opcion == 1){//Avance NorEste.
     Motor(Adelante,Vel_2,Adelante,Vel_1);}
    else if(Opcion == 2){//Avance Norte.
     Motor(Adelante,Vel_2,Adelante,Vel_2);} 
    else if(Opcion == 3){//Avance NorOeste.
     Motor(Adelante,Vel_1,Adelante,Vel_2);}
    else if(Opcion == 4){//Giro Oeste.
     Motor(Paro,Vel_1,Adelante,Vel_2);}
   else if(Opcion == 5){//Avance SurOeste.
     Motor(Atras,Vel_1,Atras,Vel_2);}
   else if(Opcion == 6){//Avance Sur.
     Motor(Atras,Vel_2,Atras,Vel_2);}
   else if(Opcion == 7){//Avance SurEste.
     Motor(Atras,Vel_2,Atras,Vel_1);}
   else if(Opcion == 8){//Paro del Vehiculo.
     Motor(Paro,Vel_1,Paro,Vel_1);}
   else if(Opcion == 9){//Prender Lámpara.
     digitalWrite(Lampara,HIGH);}
   else if(Opcion == 10){//Apagar Lámpara.
     digitalWrite(Lampara,LOW);}
   else if(Opcion == 11){//Ajustar Velocidad.
     Carga=Serial.parseInt();
     if (Serial.read() == 'r'){
     Carga_PWM=Carga;
     Carga_PWM2=Carga/2;
     //Motor(Paro,Vel_1,Paro,Vel_1);
     //Modificar Velocidad Adecuadamente
     if(Opcion_A == 0){//Giro Este.
     Motor(Adelante,Vel_2,Paro,Vel_1);}
    else if(Opcion_A == 1){//Avance NorEste.
     Motor(Adelante,Vel_2,Adelante,Vel_1);}
    else if(Opcion_A == 2){//Avance Norte.
     Motor(Adelante,Vel_2,Adelante,Vel_2);} 
    else if(Opcion_A == 3){//Avance NorOeste.
     Motor(Adelante,Vel_1,Adelante,Vel_2);}
    else if(Opcion_A == 4){//Giro Oeste.
     Motor(Paro,Vel_1,Adelante,Vel_2);}
   else if(Opcion_A == 5){//Avance SurOeste.
     Motor(Atras,Vel_1,Atras,Vel_2);}
   else if(Opcion_A == 6){//Avance Sur.
     Motor(Atras,Vel_2,Atras,Vel_2);}
   else if(Opcion_A == 7){//Avance SurEste.
     Motor(Atras,Vel_2,Atras,Vel_1);}
   else if(Opcion_A == 8){//Paro del Vehiculo.
     Motor(Paro,Vel_1,Paro,Vel_1);}
     ///Fin de elección*/
     analogWrite(9,Carga_PWM);} }
    if(Opcion<9){
    Opcion_A=Opcion;}
    Serial.flush();
   }
 }
}

 void Motor(int Motor_Izq,int Vel_Izq,int Motor_Der,int Vel_Der){//Llanta Izquierda(xx),,Llanta Derecha(xx)
  //Motor Izquierdo.
  if(Motor_Izq==Paro){
  analogWrite(LLanta_Izq_A,0);
  analogWrite(LLanta_Izq_B,0);}
  //
  else if(Motor_Izq==Adelante && Vel_Izq==Vel_1){
  analogWrite(LLanta_Izq_A,Carga_PWM2);
  analogWrite(LLanta_Izq_B,0);}
  //
  else if(Motor_Izq==Adelante && Vel_Izq==Vel_2){
  analogWrite(LLanta_Izq_A,Carga_PWM);
  analogWrite(LLanta_Izq_B,0);}
  //
  else if(Motor_Izq==Atras && Vel_Izq==Vel_1){
  analogWrite(LLanta_Izq_B,Carga_PWM2);
  analogWrite(LLanta_Izq_A,0);}
  //
  else if(Motor_Izq==Atras && Vel_Izq==Vel_2){
  analogWrite(LLanta_Izq_B,Carga_PWM);
  analogWrite(LLanta_Izq_A,0);}
 //Motor Derecho 
  if(Motor_Der==Paro){
  analogWrite(LLanta_Der_A,0);
  analogWrite(LLanta_Der_B,0);}
  //
  else if(Motor_Der==Adelante && Vel_Der==Vel_1){
  analogWrite(LLanta_Der_A,Carga_PWM2);
  analogWrite(LLanta_Der_B,0);}
  //
  else if(Motor_Der==Adelante && Vel_Der==Vel_2){
  analogWrite(LLanta_Der_A,Carga_PWM);
  analogWrite(LLanta_Der_B,0);}
  //
  else if(Motor_Der==Atras && Vel_Der==Vel_1){
  analogWrite(LLanta_Der_B,Carga_PWM2);
  analogWrite(LLanta_Der_A,0);}
  //
  else if(Motor_Der==Atras && Vel_Der==Vel_2){
  analogWrite(LLanta_Der_B,Carga_PWM);
  analogWrite(LLanta_Der_A,0);}
}
