# -*- coding: utf-8 -*-
"""
Created on Mon May 25 19:19:16 2020

@author: Renan
"""


import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np

valores_medidos=[0.327,
0.656,
0.985,
1.316,
1.645,
1.973,
2.29,
2.62,
2.95,
3.28]

valores_esperados=[0.330,
0.660,
0.990,
1.320,
1.650,
1.980,
2.310,
2.640,
2.970,
3.300]


fig1 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (30,20) #tamanho do gráfico
fig1, ax = plt.subplots() #anexa os subplots na figura
plt.rcParams.update({'font.size': 40})
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())

ax.tick_params(which='both', width=3.5)
ax.tick_params(which='major', length=7, color='black')
ax.tick_params(which='minor', length=4, color='black')



#------------------------------------------------------

plt.title("Tensão Esperada x Tensão Medida")

plt.xlabel('Tensão Esperada [V]') #nome do eixo x
plt.ylabel('Tensão Medida [V]') #nome do eixo y
plt.plot(valores_esperados, valores_medidos, color='red',linewidth=2.0, linestyle = '-') #dois graficos em 1
plt.scatter(valores_esperados, valores_medidos, color='black', marker = '*',linewidth=8.0)#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both')
plt.show() #plota