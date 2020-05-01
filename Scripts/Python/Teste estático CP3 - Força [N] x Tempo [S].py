# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate


x =[0,
0.085,
0.172,
0.256,
0.341,
0.428,
0.512,
0.597,
0.684,
0.768,
0.853,
0.94,
1.024,
1.109,
1.196,
1.28,
1.365,
1.452,
1.536,
1.621,
1.708,
1.792,
1.877,
1.964,
2.048,
2.133,
2.22,
2.304,
2.389,
2.476,
2.56,
2.645,
2.732,
2.816
]
y = [26.461,
26.405,
26.540,
40.259,
88.587,
116.932,
143.892,
202.308,
327.413,
505.418,
665.065,
747.545,
778.683,
786.196,
775.018,
764.045,
740.047,
697.310,
639.306,
571.802,
510.310,
452.936,
406.587,
367.814,
328.797,
287.403,
236.087,
170.648,
106.807,
60.524,
40.079,
38.077,
39.223,
40.137]
z = [100 ,100 ,100, 100, 100, 100, 100 ,100,100,100,100,100,100,300,100,100,100,100,100,100, 100, 100, 100, 100, 100,100,100,100,100,100,100,100,100]#dimensão do ponto
#fig = plt.figure()
fig1 = plt.gcf() #cria a figura
plt.rcParams['figure.figsize'] = (20,12) #tamanho do gráfico
fig1, ax = plt.subplots() #anexa os subplots na figura

ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
##----------------------------------------
plt.title('Teste estático CP3 - Força [N] x Tempo [S]') #título do grafico
plt.xlabel('Tempo [s]') #nome do eixo x
plt.ylabel('Força [N]') #nome do eixo y

plt.plot(x, y, color='black', linestyle = '-') #dois graficos em 1
plt.scatter(x, y, color='red', marker = '*', s= z) #dois graficos em 1
plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True) #grade
plt.show() #plota
#plt.plot(x,y)
#####y_interp = scipy.interpolate.interp1d(x, y)
#####print (y_interp(33.0))
fig1.savefig('Teste estático CP3 - Força [N] x Tempo [S]') #salva a figura em arquivo .png com qualidade em dpi


#fig.savefig('Teste estático CP3 - Força [N] x Tempo [S]',400 dpi)

#fig = plt.gcf()
#plt.savefig('gráfico_CP3_1.png')
#fig.savefig('teste.png', format='png') 
#plt.plot(x,y) #caso eu quisesse plotar um gráfico só

