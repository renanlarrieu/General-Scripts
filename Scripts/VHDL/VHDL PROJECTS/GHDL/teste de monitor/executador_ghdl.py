# -*- coding: utf-8 -*-
# importing os module  


import os
import time
#nome_do_arquivo = int(input('Nome do arquivo sem formato:'))
#a = "ghdl -s my"
arquivo=str(input("Digite o nome do arquivo vhdl:"))

arquivo_testbench=str(arquivo+'_tb') 


mestre=[]

string1 = 'ghdl -s {}'.format(arquivo)+'.vhdl'                                    #1

string2 = 'ghdl -a {}'.format(arquivo)+'.vhdl'                                    #2

string3 = 'ghdl -a {}'.format(arquivo_testbench)+'.vhdl'                          #3

string4 = 'ghdl -e {}'.format(arquivo_testbench)                                  #4

string5 = 'ghdl -r {}'.format(arquivo_testbench)                                  #5

string6 = 'ghdl -r {}'.format(arquivo_testbench) +' --vcd=' + arquivo + '.vcd'  #6
 
#ghdl -r multiplexador_2_entradas_tb --vcd = multiplexador_2_entradas.vcd

string7 = 'gtkwave {}'.format(arquivo)+'.vcd'                                     #7



#mestre=[string1,string2,string3,string4,string5,string6,string7]


os.system(string1)
os.system(string2)
os.system(string3)
os.system(string4)
os.system(string5)
os.system(string6)
os.system(string7)

'''
1 ghdl -s x.vhdl

2 ghdl -a x.vhdl

3 ghdl -a x_tb.vhdl

4 ghdl -e x_tb

5 ghdl -r x_tb

6 ghdl -r x_tb --vcd=x.vcd

7 gtkwave x.vcd
'''
