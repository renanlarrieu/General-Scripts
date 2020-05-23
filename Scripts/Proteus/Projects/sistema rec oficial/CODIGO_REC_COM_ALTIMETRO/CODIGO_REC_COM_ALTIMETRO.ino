int MAIN =  8;
int DROGUE = 6;

int MOTOR = 2;
int SERVO = 11;


void setup()
{
  pinMode(MOTOR, OUTPUT);
  pinMode(DROGUE, INPUT);
  pinMode(SERVO, OUTPUT);
  pinMode(MAIN, INPUT);

  
  //digitalWrite(ACIONADOR1, HIGH);
 // digitalWrite(ACIONADOR2, HIGH);
  
  digitalWrite(MOTOR, LOW);
  digitalWrite(SERVO, LOW);
  
  
}

 
void loop()
{ 
  if (digitalRead(DROGUE)==HIGH)
  {
    digitalWrite(SERVO, HIGH);
    delay(3000); //tempo em milissegundos
    digitalWrite(SERVO, LOW);
  }

  
  if (digitalRead(MAIN)==HIGH)
  {
    digitalWrite(MOTOR, HIGH);
    delay(3000); //tempo em milissegundos
    digitalWrite(MOTOR, LOW);
  }


  
  else
  {
    digitalWrite(MOTOR, LOW);
    digitalWrite(DROGUE, LOW);
  }




}
