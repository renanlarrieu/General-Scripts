# -*- coding: utf-8 -*-
"""
Created on Mon May  4 19:22:27 2020

@author: Renan
"""


import numpy as np
import math
import matplotlib.ticker as tck
import scipy.interpolate
import matplotlib.pyplot as plt
'''
x=[]
w=[]
n=100

dx=(2*np.pi/n)



for i in range(0,6,1):
    w.append(i)
    x.append(w[i]+dx)

'''
n =100
dx=(2*np.pi/n)
x=0

resultados=[]


while x < 2*np.pi:
    x=x+dx
    resultados.append(x)

resultado2=[]
for i in range(0,len(resultados),1):
    resultado2.append(i)
    
    
    
    
    
fig1 = plt.gcf() #cria a figura    
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams['figure.figsize'] = (12,8) 
plt.plot(resultado2,resultados)
plt.show    
plt.grid(True, which='both')

 

#plt.axhline(y=3, color='k')