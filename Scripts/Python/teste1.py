# -*- coding: utf-8 -*-
"""
Created on Sun Mar 29 19:33:18 2020

@author: Renan
"""

import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np
t=0
dados = open("dados123.csv").readlines()
print("Bem-vindo ao Graph Propulsion Maker")

#nome_do_arquivo = str(input('Escreva o nome do arquivo que quer abrir com o seu respectivo formato .csv: '))

titulo_do_grafico = str(input('Escolha o título do seu gráfico: '))
    
titulo_do_eixo_x = str(input('Escolha o nome do eixo x do seu gráfico: '))

titulo_do_eixo_y = str(input('Escolha o nome do eixo y do seu gráfico: '))

nome_da_figura = str(input('Escolha o nome da figura que será salva :'))


x=[]
y=[]


#x = tempo
#y = força


#y = força

#z = [100 ,100 ,100, 100, 100, 100, 100 ,100,100,100,100,100,100,300,100,100,100,100,100,100, 100, 100, 100, 100, 100,100,100,100,100,100,100,100,100]#dimensão do ponto
#fig = plt.figure()
fig1 = plt.gcf() #cria a figura
plt.rcParams['figure.figsize'] = (20,12) #tamanho do gráfico
fig1, ax = plt.subplots() #anexa os subplots na figura

ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
##----------------------------------------
plt.title('Primeiro Teste estático CP3  - Força [N] x Tempo [S]') #título do grafico
plt.xlabel('Tempo [s]') #nome do eixo x
plt.ylabel('Força [N]') #nome do eixo y

plt.plot(x, y, color='black', linestyle = '-') #dois graficos em 1
plt.scatter(x, y, color='red', marker = '*')#, s= z) #dois graficos em 1
plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True) #grade
plt.show() #plota
#plt.plot(x,y)
#####y_interp = scipy.interpolate.interp1d(x, y)
#####print (y_interp(33.0))
fig1.savefig('Primeiro Teste estático CP3 - Força [N] x Tempo [S]') #salva a figura em arquivo .png com qualidade em dpi


#fig.savefig('Teste estático CP3 - Força [N] x Tempo [S]',400 dpi)

#fig = plt.gcf()
#plt.savefig('gráfico_CP3_1.png')
#fig.savefig('teste.png', format='png') 
#plt.plot(x,y) #caso eu quisesse plotar um gráfico só
#fmax = max(float(number) for number in y)

elemento = y.index(fmax)
t = (elemento)

def integrate(x, y):
    area = np.trapz(y=y, x=x)
    return area
print('Impulso =',integrate(x, y),'N.s')

integrate(x,y)
#max(y, key=float)
print('Fmax =',fmax,'N')
print('Instante Fmáx =',x[t],'s')
print('Tempo de queima =',x[len(x)-1],'s')

nada = str(input('digite qualquer merda: '))
os.system("PAUSE")