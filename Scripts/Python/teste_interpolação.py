# -*- coding: utf-8 -*-
"""
Created on Wed Feb 26 23:09:04 2020

@author: Renan
"""
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate

x = [1, 2.5, 3.4, 5.8, 6]
y = [2, 4, 5.8, 4.3, 4]


y_interp = scipy.interpolate.interp1d(x,y)
print (y_interp(5.0))

#plt.show(y_interp(5.0))
#plt.plot(x,y)