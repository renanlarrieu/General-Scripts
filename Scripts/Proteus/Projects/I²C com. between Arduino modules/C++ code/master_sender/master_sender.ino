/*
    Curso de Arduino Aula 20
    
    Estudo do Protocolo I2C ou TWI
    
    Dispositivo Master
    
    Paradoxus-Duino

    Objetivo: Enviar a mensagem ARM 5 utilizando o Paradoxus-Duino
    como master.
    Receber e exibir via serial monitor pelo Arduino UNO configurado
    como slave

*/


#include <Wire.h>

void setup()
{
  Wire.begin();              // Configura o barramento I2C
}

byte x = 4;                  // Variável para transmitir

void loop()
{
  Wire.beginTransmission(15); // Transmite para o dispositivo número 15
  Wire.write("ARM ");         // Envia 4 bytes
  Wire.write(x);              // Envia 1 byte
  Wire.endTransmission();     // Para transmissão

  x++;                        // Incrementa x
  delay(100);
}
