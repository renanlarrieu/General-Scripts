int GATE1 =  12;
int GATE2 = 9;

int ACIONADOR1 = 7;
int ACIONADOR2 = 4;


void setup()
{
  pinMode(GATE1, OUTPUT);
  pinMode(ACIONADOR1, INPUT);
  pinMode(GATE2, OUTPUT);
  pinMode(ACIONADOR2, INPUT);

  
  digitalWrite(ACIONADOR1, HIGH);
  digitalWrite(ACIONADOR2, HIGH);
  
  digitalWrite(GATE2, LOW);
  digitalWrite(GATE1, LOW);
  
  
}

 
void loop()
{ 
  if (digitalRead(ACIONADOR1)==LOW)
  {
    digitalWrite(GATE1, HIGH);
    delay(3000); //tempo em milissegundos
    digitalWrite(GATE1, LOW);
  }

  
  if (digitalRead(ACIONADOR2)==LOW)
  {
    digitalWrite(GATE2, HIGH);
    delay(3000); //tempo em milissegundos
    digitalWrite(GATE2, LOW);
  }


  
  else
  {
    digitalWrite(GATE1, LOW);
    digitalWrite(GATE2, LOW);
  }




}
