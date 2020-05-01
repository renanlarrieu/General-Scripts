# -*- coding: utf-8 -*-
"""
Created on Sun Apr  5 22:07:55 2020

@author: Renan
"""
import time
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import numpy as np
import pandas as pd
import requests
from bs4 import BeautifulSoup

país=[]
casos=[]
mortes=[]
death_rate=[]


# Execução do Request GET para obter o conteúdo da página
req = requests.get('https://www.bbc.com/portuguese/internacional-51718755')
if req.status_code == 200: # Status 200 indica que a requisição foi completada
    print('Requisição bem sucedida!')
    content = req.content # obtém conteúdo da página

nan=0

soup = BeautifulSoup(content, 'html.parser')
# Utilizando somente o nome da tag HTML
table = soup.find(name='table')
# Especificando atributos da tag
table = soup.find(name='table', attrs={'id':'totals_stats'})
# Usando find_all
table = soup.find_all(name='table')

# Lendo como Data Frame
table_str = str(table)
df = pd.read_html(table_str)[1]
#print (df)
#df2= pd.read_html(table_str)[1]
#print(df)


#País [i][0] >> [naturais][0]

#Casos [i][1] >> até 211

#Mortes [i][2] >> até 211


#row2 = df.iloc[1][2]
#print(row2)

for i in range(0,212,1):
    mortes.append(str(df.iloc[i][2]))
    if mortes[i]== 'nan':
        mortes[i]=0
    else:
        None
    
for i in range(0,len(mortes),1):  
    mortes[i]= float(mortes[i])
    if mortes[i]%1 >0:
        mortes[i] = mortes[i]*int(1000)
        mortes[i] = int(mortes[i])
       # round(mortes[i],1)
        
    else:          
        None  
        mortes[i]=int(mortes[i])
    

for i in range(0,212,1):
    país.append(str(df.iloc[i][0]))
    
for i in range(0,212,1):
    casos.append(round((df.iloc[i][1]),4))
    
    
    if casos[i]%1 > 0:      
        casos[i] = casos[i]*int(1000)
        casos[i] = int(casos[i])
    else:
        None
        casos[i]= int(casos[i])
           
for i in range(1,len(mortes),1):
    if mortes[i] == "nan" :
        mortes.replace("nan",int(0))
    else:
        None


for i in range (0,len(casos),1):
    death_rate.append(float((mortes[i]/casos[i])*100))
    round(death_rate[i],3)
    
fig2 = plt.gcf() #cria a figura    



fig1 = plt.gcf() #cria a figura    


plt.rcParams['figure.figsize'] = (400,20) #tamanho do gráfico

fig1, ax = plt.subplots() #anexa os subplots na figura
fig2, ax = plt.subplots() #anexa os subplots na figura

ax.yaxis.set_minor_locator(tck.AutoMinorLocator())

plt.title('Covid-19 Cases confirmed per country')#,' Força [N] x Tempo [S]') #título do grafico
plt.ylabel('Cases confirmed')
plt.xlabel('Country') 
plt.bar(país, casos, color='green')#, color='black', linestyle = '-') #dois graficos em 1
plt.bar(país,mortes, color='red')
plt.scatter(país, casos, color='red', marker = '^')#, s= z) #dois graficos em 1
#plt.fill_between(país,0,casos, color = 'grey') #pinta a área sob a curva
plt.show()

plt.rcParams['figure.figsize'] = (300,20) #tamanho do gráfico

plt.title('Covid-19 Death rate per country')
plt.ylabel('Death rate in percent [%]')
plt.xlabel('Country')
plt.bar(país,death_rate,color='pink')
plt.show()
plt.grid(True) #grade




fig1.savefig('Cases confirmed and Death cases per country') #salva a figura em arquivo .png com qualidade em dpi
fig2.savefig('Death rate per country') #salva a figura em arquivo .png com qualidade em dpi

#arquivo = open(nome_do_arquivo_de_texto,"w")  

# Limpando dados desnecessários
#drop_indexes = df[df['Rk'] == 'Rk'].index # Pega indexes onde a coluna 'Rk' possui valor 'Rk'
#df.drop(drop_indexes, inplace=True) # elimina os valores dos index passados da tabela
