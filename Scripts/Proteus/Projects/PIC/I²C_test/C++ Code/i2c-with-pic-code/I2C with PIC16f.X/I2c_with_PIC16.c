/*
 * File:   IIC with PIC16F
 * Author: Aswinth Raj
 *
 * Created on 7 May, 2018, 6:42 PM
 */
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#define _XTAL_FREQ 20000000

#include <xc.h>
#include "PIC16F877a_I2C.h"


int main()
{
    I2C_Initialize(100); //Initialize I2C Master with 100KHz clock

while(1)
  {
   I2C_Begin();       
   I2C_Write(0xD0); 
   I2C_Write(0x88); 
   I2C_Write(0xFF); 
   I2C_End();
   
   __delay_ms(1000);

}
}