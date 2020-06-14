# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 15:04:50 2020

@author: Renan
"""

from scipy import signal
import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np



#%matplotlib inline

percent=float(input('Duty Cycle :'))
TimePeriod=float(input('Period :'))
Cycles=int(input('Number of cycles :'))
dt=0.01  # 0.01 appears to be your time resolution

x=np.arange(0,Cycles*TimePeriod,dt);  #linspace's third argument is number of samples, not step

y=np.zeros_like(x)   # makes array of zeros of the same length as x
npts=TimePeriod/dt

i=0
while i*dt< Cycles*TimePeriod:
    if (i % npts)/npts < percent/100.0:
        y[i]=1
    i=i+1

plt.plot(x,y,'.-')
plt.ylim([-.1,1.1])
plt.grid(True, which='both')
