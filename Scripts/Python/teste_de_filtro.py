# -*- coding: utf-8 -*-
"""
Created on Mon Mar 30 16:25:33 2020

@author: Renan
"""

#teste de filtro

import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np


g=float(9.8)

p=[]

x=[]
y=[]

dados = open('dados123.csv').readlines() #trocar para o nome_do_arquivo após testes de diagnóstico
def adiciona_dados():
    for i in range (len(dados)):
        if i !=0:  
            linha = dados[i].split(";")
            x.append(float(linha[0]))
            y.append(float(linha[1])*g)



adiciona_dados()

y=p
def filtra_dados():                
    for i in range(len(p)):  
        if p[i] < float(30):

            x.remove(x[i])
            y.remove(y[i])

              

filtra_dados()    





