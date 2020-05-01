#include <16f877a.h>
#fuses hs,nowdt
#use delay (clock=20M)

void main()
{
    set_tris_b(0b00);//tris B diz que todos os pinos de porte B serão saída, isto é 0 = output e i = input.
    //O '0' antes do 'b' indica que utilizaremos a linguagem binária
    output_low(pin_b0);//inicia o pino 0 como LOW = 0
    output_low(pin_b1);//inicia o pino 1 como LOW = 0


    
    while(true)
    {
        output_high(pin_b0);
        delay_us(1);
        output_low(pin_b0);
        delay_us(1);
        output_high(pin_b1);
        delay_us(10);
        output_low(pin_b1);
        delay_us(10);
    
    
    
    }
    

}
