# -*- coding: utf-8 -*-
"""
Created on Fri Mar 27 22:24:04 2020

@author: Renan Larrieu
"""

import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np







y=[2517.435,
3147.021,
3038.602,
2993.382,
2964.949,
2944.436,
2928.512,
2915.569,
2904.71,
2895.384,
2887.233,
2880.007,
2873.528,
2867.664,
2862.314,
2857.401,
2852.862,
2848.647,
2844.717,
2841.036,
2837.578,
2834.317,
2831.235,
2828.314,
2825.539,
2822.896]

x=[0.23846153846153847,
 0.47692307692307695,
 0.7153846153846154,
 0.9538461538461539,
 1.1923076923076923,
 1.4307692307692308,
 1.6692307692307693,
 1.9076923076923078,
 2.146153846153846,
 2.3846153846153846,
 2.623076923076923,
 2.8615384615384616,
 3.1,
 3.3384615384615386,
 3.576923076923077,
 3.8153846153846156,
 4.053846153846154,
 4.292307692307692,
 4.530769230769231,
 4.769230769230769,
 5.007692307692308,
 5.246153846153846,
 5.484615384615385,
 5.723076923076923,
 5.961538461538462,
 6.2]

t=0

print("Bem-vindo ao Graph Propulsion Maker")

#nome_do_arquivo = str(input('Escreva o nome do arquivo que quer abrir com o seu respectivo formato .csv, exemplo: "dadosdeteste.csv": '))

#titulo_do_grafico = str(input('Escolha o título do seu gráfico: '))
    
#titulo_do_eixo_x = str(input('Escolha o nome do eixo x do seu gráfico: '))

#titulo_do_eixo_y = str(input('Escolha o nome do eixo y do seu gráfico: '))

#nome_da_figura = str(input('Escolha o nome da figura que será salva :'))

#nome_do_arquivo_de_texto = (input('Escolha o nome do arquivo de texto que será salvo contendo os cálculos presentes no código. Para isso, insira o nome do arquivo com seu respectivo formato .txt: '))

#itulo_do_grafico = str('a')
    
#titulo_do_eixo_x = str('b')

#titulo_do_eixo_y = str('c')



#g=float(9.8)

'''

dados = open(nome_do_arquivo).readlines() #trocar para o nome_do_arquivo após testes de diagnóstico

'''


'''    
def adiciona_dados():
    for i in range (len(dados)):
        if i !=0:  
            linha = dados[i].split(";")
            x.append(float(linha[0]))
            y.append(float(linha[1])*g)
        else:
            print('erro1')

len(x)
len(y)
def filtra_dados():
    
        for i in range(len(y)):
            if i < 30:
                
                x.remove(i)
                y.remove(i)
            else:
                print('erro2')
            
      
          
        
adiciona_dados()
filtra_dados()
'''
#print(x)
#print(y)    
    



    
fig1 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (40,30) #tamanho do gráfico
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

#------------------------------------------------------

plt.title("Empuxo Orion I")#,' Força [N] x Tempo [S]') #título do grafico

#plt.xlabel(titulo_do_eixo_x)
#plt.ylabel(titulo_do_eixo_y)
plt.xlabel('Tempo [s]') #nome do eixo x
plt.ylabel('Força [N]') #nome do eixo y
plt.plot(x, y, color='blue',linewidth=4.0, linestyle = '-') #dois graficos em 1
plt.scatter(x, y, color='red', marker = '*')#, s= z) #dois graficos em 1
plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both')
plt.show() #plota
#plt.plot(x,y)
#####y_interp = scipy.interpolate.interp1d(x, y)
#####print (y_interp(33.0))
fig1.savefig("Empuxo Orion I",dpi=100) #salva a figura em arquivo .png com qualidade em dpi

#-------------------------------------------------------------------------    
    
fmax = max(float(number) for number in y)

elemento = y.index(fmax)
t = (elemento) 



def integrate(x, y):
    area = np.trapz(y=y, x=x)
    return area



print('Os resultados de seu teste são:')
print('Impulso =',round(integrate(x, y),3),'N.s')
integrate(x,y)
#max(y, key=float)
print('Fmax =',round(fmax,3),'N')
print('Instante Fmáx =',round(x[t],3),'s')
print('Tempo de queima =',round(x[len(x)-1],3),'s')




fmax=str(fmax)
tempodequeima = x[len(x)-1]
tempodequeima = str(tempodequeima)


#--------------------------------------------------
resultados = "Os resultados de seu teste são:\n"

impulso = "Impulso = {}N.s\n"

força_max = "Fmax = {}N\n"

inst_fmax = "Instante Fmáx = {}s\n"

tempo_de_queima = "Tempo de queima = {}s\n"
#-------------------------------------------------------




arquivo = open("Informações_técnicas.txt","w")

arquivo.write(resultados)

arquivo.write(impulso.format(integrate(x,y)))

arquivo.write(força_max.format(fmax))

arquivo.write(inst_fmax.format(x[t]))

arquivo.write(tempo_de_queima.format(tempodequeima))

arquivo.close


#os.system("PAUSE")
    