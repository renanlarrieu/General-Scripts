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

n = int(10e4)
x=.0
dx=(2*np.pi)/n


y1=.0
y2=.0
y3=.0
y4=.0




dy=4/n

dominio=[]

#limites do dominio
'''
limite_inferior_primeiro_quadrante = 0
limite_superior_primeiro_quadrante = int(len(dominio)/4)

limite_inferior_segundo_quadrante = int(len(dominio)/4)
limite_superior_segundo_quadrante = int(2*len(dominio)/4)

limite_inferior_terceiro_quadrante = int(2*len(dominio)/4)
limite_superior_terceiro_quadrante = int(3*len(dominio)/4)

limite_inferior_quarto_quadrante = int(3*len(dominio)/4)
limite_superior_quarto_quadrante = int(len(dominio))
'''

imagem1=[]
imagem2=[]
imagem3=[]
imagem4=[]

dominio1=[]
dominio2=[]
dominio3=[]
dominio4=[]


for i in range (0,int(n),1):
    if x < 2*np.pi:
        dominio.append(x+dx)
        x=x+dx
    else:
        break
    
#matriz de intervalos do dominio    
intervalo=[  [0                      , int(len(dominio)/4)],
             [int(len(dominio)/4)    , int(2*len(dominio)/4)],
             [int(2*len(dominio)/4)  , int(3*len(dominio)/4)],  
             [int(3*len(dominio)/4)  , int(len(dominio))] ]        


#definindo os dominios(n) de intervalos    
for i in range (intervalo[0][0],intervalo[0][1],1):
    dominio1.append(dominio[i])
    
for i in range (intervalo[1][0],intervalo[1][1],1):
    dominio2.append(dominio[i])
   
for i in range (intervalo[2][0],intervalo[2][1],1):
    dominio3.append(dominio[i])
    
for i in range (intervalo[3][0],intervalo[3][1],1):
    dominio4.append(dominio[i])
            
     
    
for i in range (0,int(n/4),1):
        #dominio.append(x+dx)
    imagem1.append(y1+dy)
        #x=x+dx
    y1=y1+dy


y2=y1    
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem2.append(y2-dy)
        y2=y2-dy
    else:
        break  
y3=0
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem3.append(y3-dy)
        y3=y3-dy
    else:
        break         
y4=-1
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem4.append(y4+dy)
        y4=y4+dy
    else:
        break  

fig1 = plt.gcf() #cria a figura    
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams['figure.figsize'] = (20,14) 
plt.plot(dominio1,imagem1,color='purple')
plt.plot(dominio2,imagem2,color='red')
plt.plot(dominio3,imagem3,color='blue')
plt.plot(dominio4,imagem4,color='green')
plt.show    
plt.grid(True, which='both')

 

plt.axhline(y=0, color='k')
