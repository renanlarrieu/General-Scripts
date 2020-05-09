# -*- coding: utf-8 -*-
"""
Created on Sat May  9 01:12:20 2020

@author: Renan
"""


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
    if dominio[i] < 2*np.pi:
        imagem1.append(np.sin(dominio1[i]))
        y1=np.sin(dominio1[i])


y2=y1    
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem2.append(np.sin(dominio2[i]))
        y2=np.sin(dominio2[i])
    else:
        break  
    
y3=y2
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem3.append(np.sin(dominio3[i]))
        y3=np.sin(dominio3[i])
    else:
        break         
y4=y3
for i in range (0,int(n/4),1):
    if dominio[i] < 2*np.pi:
        imagem4.append(np.sin(dominio4[i]))
        y4=np.sin(dominio4[i])
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
