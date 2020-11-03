int led = 9;
int button = 2;

void setup() {
  // put your setup code here, to run once:
  pinMode(led,OUTPUT);
  pinMode(button,INPUT);
  
  digitalWrite(button,HIGH); //Começando a chave em nível alto

}

void loop() {
  if ((digitalRead(button) == LOW))
  {
    digitalWrite(led,HIGH);
    }
  else
  {
    digitalWrite(led,LOW);
    }
    
  // put your main code here, to run repeatedly:

}
