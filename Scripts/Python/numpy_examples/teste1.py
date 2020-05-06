# -*- coding: utf-8 -*-
"""
Created on Mon May  4 19:03:57 2020

@author: Renan
"""


import numpy as np
import math
import matplotlib.ticker as tck
import scipy.interpolate
import matplotlib.pyplot as plt

n = 1000000

dx = (2*np.pi)/(n)


x=[]

for i in range (0,10,1):
    x.append(i)
    
x_processado=[]

for i in range (0,10,1):
    x_processado.append(x[i]+dx)
    
x_processado2=[]    

for i in range(0,len(x_processado)):
    x_processado2.append(x_processado[i]*x_processado[i])
    
fig1 = plt.gcf() #cria a figura    
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams['figure.figsize'] = (12,8) 
plt.plot(x_processado,x_processado2)
plt.show    
plt.grid(True, which='both')

 

plt.axhline(y=0, color='k')