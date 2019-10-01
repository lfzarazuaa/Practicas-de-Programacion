const int t0=100;
const int t1=100;
const int Sensor1=12;
const int Sensor2=11;
const int Sensor3=10;
const int Sensor4=9;
void setup(){
  Serial.begin(9600);
  pinMode(Sensor1, INPUT); 
  pinMode(Sensor2, INPUT); 
  pinMode(Sensor3, INPUT); 
  pinMode(Sensor4, INPUT); 
}
int S1,S2,S3,S4,estacion=0;
void loop(){
  if (Serial.available()>0){
      if (Serial.read()=='r')
      {
       Serial.println(estacion);
      }
    }
  S1=digitalRead(Sensor1);
  S2=digitalRead(Sensor2);
  S3=digitalRead(Sensor3);
  S4=digitalRead(Sensor4);
  if(S1==1&&S2==0&&S3==0&&S4==0)
  estacion=1;
  else if(S1==0&&S2==1&&S3==0&&S4==0)
  estacion=2;
  else if(S1==0&&S2==0&&S3==1&&S4==0)
  estacion=3;
  else if(S1==0&&S2==0&&S3==0&&S4==1)
  estacion=4;
  else if(S1==0&&S2==0&&S3==0&&S4==0)
  estacion=estacion;
  else
  estacion=5;//Error
}
