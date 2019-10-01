const int PWM1=5;
const int PWM2=6;
const int Potenciometro=A0;
int Valor_pot,Valor_PWM;
void setup() {
  // Inicializa el pin 5 y 6
  pinMode(PWM1, OUTPUT);
  pinMode(PWM2, OUTPUT);
}

// Función loop que corre el programa indefinidamente.
void loop() {
   Valor_pot=analogRead(Potenciometro);
   Valor_PWM=map(Valor_pot, 0, 1023, 0, 255);
   analogWrite(PWM1,Valor_PWM);
   analogWrite(PWM2,255-Valor_PWM);
   delay(10);// Espera por 10 ms.   
}
