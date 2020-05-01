# -*- coding: utf-8 -*-
"""
Created on Thu Feb 27 20:03:46 2020

@author: Renan
"""
#A seguir, alguns exemplos de argumentos que podem ser aplicados ao método plot( ).



#color: cor (ver exemplos abaixo)

#label: rótulo

#linestyle: estilo de linha (ver exemplos abaixo)

#linewidth: largura da linha

#marker: marcador (ver exemplos abaixo)



##CORES (color)
#'b' blue

#'g' green

#'r' red

#'c' cyan

#'m' magenta

#'y' yellow

#'k' black

#'w' white#



#Marcadores (marker)
#'.' point marker

#',' pixel marker

#'o' circle marker

#'v' triangle_down marker

#'^' triangle_up marker

#'<' triangle_left marker

#'>' triangle_right marker

#'1' tri_down marker

#'2' tri_up marker

#'3' tri_left marker

#'4' tri_right marker

#'s' square marker

#'p' pentagon marker

#'*' star marker

#'h' hexagon1 marker

#'H' hexagon2 marker

#'+' plus marker

#'x' x marker

#'D' diamond marker

#'d' thin_diamond marker

#'|' vline marker

#'_' hline marker





#Tipos de linha (linestyle)
#'-' solid line style

#'--' dashed line style

#'-.' dash-dot line style#

#':' dotted line style#



import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate


x1 = [10,40,170,200]
y1 = [60, 70, 150, 200]

x2 =[10,20,30,190]
y2 = [15,27,46,200]

w = 'Eixo x'
p = 'Eixo y'
title = 'Gráfico teste'


plt.title(title)
plt.xlabel(w)
plt.ylabel(p)

plt.plot(x1,y1, label ="taxa teste 1", color = 'red')
plt.plot(x2,y2, label ="taxa teste 2", color = 'green')

plt.legend()


plt.show()