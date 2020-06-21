int Controle_motor_rec =  9;
 
void setup()
{
  pinMode(Controle_motor_rec, OUTPUT);
}
 
void loop()
{
  digitalWrite(Controle_motor_rec, HIGH);
  delay(3000); //tempo em milissegundos
  digitalWrite(Controle_motor_rec, LOW);


}
