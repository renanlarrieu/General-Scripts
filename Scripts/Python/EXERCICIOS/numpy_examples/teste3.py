# -*- coding: utf-8 -*-
"""
Created on Sat May  9 01:22:20 2020

@author: Renan
"""
import numpy as np
import math
import matplotlib.ticker as tck
import scipy.interpolate
import matplotlib.pyplot as plt
#exercicio cleiton


n=10e2

tensao=[]
corrente=[]

t=0

dominio_tempo=[]

dt=(2*np.pi)/n

r=10.

for i in range (0,int(n),1):
    if t < 2*np.pi:
        dominio_tempo.append(t+dt)
        t=t+dt
    else:
        break
for i in dominio_tempo:
    tensao.append(np.sin(i))
    
for i in range(0,len(tensao),1):
    corrente.append(tensao[i]/r)
    
    
fig1 = plt.gcf() #cria a figura    
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams['figure.figsize'] = (20,14) 
plt.plot(dominio_tempo,tensao,color='red')
plt.plot(dominio_tempo,corrente,color='blue')

plt.show    
plt.grid(True, which='both')

 

plt.axhline(y=0, color='k')
    
'''    
v[t]=np.sin(t)

i[t]=v[t]/r
'''