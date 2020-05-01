# -*- coding: utf-8 -*-
"""
Created on Mon Mar 30 21:41:48 2020

@author: Renan
"""

import csv

g = 9.80

x=[]
y=[]
with open('dados123.csv', newline='') as dados_file:
    dados_reader = csv.reader(dados_file, delimiter=';')
    all_linha = list(dados_reader)
    x = [float(current_linha[0]) for current_linha in all_linha[1:] if float(current_linha[0]) >= 30]
    y = [float(current_linha[1]) * g for current_linha in all_linha[1:] if float(current_linha[0]) >= 30]

how_many_nada = (len(all_linha) - 1) - len(x)     # Could also been (len(all_linha) - 1) - len(y). No difference
for current_nada in range(how_many_nada):
    print('nada')
len(x)
len(y)    
    