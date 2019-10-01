const int t0=100;
const int t1=100;
void setup(){
  Serial.begin(9600);
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT); 
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT); 
}
//int estacion[8]=[0,1,0,2,0,3,0,4];
int v;
void loop(){
  
  for(int i=0;i<9;i++){
  if(i==1){
  digitalWrite(2, HIGH);
  delay(t1);}
  else if(i==3){
  digitalWrite(3, HIGH);
  delay(t1);}
  else if(i==5){
  digitalWrite(4, HIGH);
  delay(t1);}
  else if(i==7){
  digitalWrite(5, HIGH);
  delay(t1);}
  else{
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  delay(t0);}  
  } 
}
