# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 14:47:37 2020

@author: Renan
"""


from scipy import signal
import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np

f=5.

t = np.linspace(0, 1, 500, endpoint=False)
plt.plot(t, signal.square(2 * np.pi * f * t))
plt.ylim(-2, 2)
plt.grid(True, which='both')

#fig = plt.gcf() #cria a figura 
plt.rcParams['figure.figsize'] = (20,12) #tamanho do gráfico
#fig, ax = plt.subplots() #anexa os subplots na figura
#ax.yaxis.set_minor_locator(tck.AutoMinorLocator())

plt.figure()
sig = np.sin(2 * np.pi * t)

pwm = signal.square(2 * np.pi * 30 * t, duty=(sig + 1 )/2)

plt.subplot(2, 1, 1)
plt.plot(t, sig)
plt.grid(True, which='both')


plt.subplot(2, 1, 2)
plt.plot(t, pwm)

plt.ylim(-1.5, 1.5)


plt.grid(True, which='both')


