/*
    Curso de Arduino Aula 20
    
    Estudo do Protocolo I2C ou TWI
    
    Dispositivo Slave
    
    Arduino UNO

    Objetivo: Enviar a mensagem ARM 5 utilizando o Paradoxus-Duino
    como master.
    Receber e exibir via serial monitor pelo Arduino UNO configurado
    como slave

*/


#include <Wire.h>                //Inclui a biblioteca I2C

void setup()
{
  Wire.begin(15);                //Barramento I2C do endereço 15
  Wire.onReceive(receiveEvent);  //Recepção de dados (chama função auxiliar)
  Serial.begin(9600);            //Inicia comunicação Serial com 9600 de baud rate
}

void loop()
{
  delay(100);
}

//Função auxiliar para processar os dados recebidos do Master
void receiveEvent(int howMany)
{
  while (1 < Wire.available()) //Loop para receber toda String de dados
  {
    char c = Wire.read();      //Recebe um byte caractere
    Serial.print(c);           //Imprime na Serial
  }
  int x = Wire.read();         //recebe um byte do tipo inteiro
  Serial.println(x);           //Imprime na Serial
}
