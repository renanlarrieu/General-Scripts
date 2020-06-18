
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import numpy as np

x=[1,2,3]
y=[1,2,3]

fig3 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig3, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator()) #anexa os mini traços
plt.rcParams.update({'font.size': 22}) #configura o tamanho da fonte dos parametros


plt.title("X versus Y",fontsize=50) 

plt.xlabel('parametro x',fontsize=50) #nome do eixo x
plt.ylabel('parametro y',fontsize=50) #nome do eixo y

plt.plot(x, y, color='blue',linewidth=4.0, linestyle = '-',label= "LEGENDA AQUI") #dois graficos em 1
plt.legend(loc="upper right",prop={'size': 50}) #plota a legenda e define a localização dela 
plt.scatter(x, y, color='red', marker = '*',linewidth=4.0, linestyle = '-',label="OF") 
plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva gerada
plt.grid(True, which='both') #cria grade no plot 
plt.tick_params(labelsize=50); #define o tamanho das variáveis de trabalho no plot 