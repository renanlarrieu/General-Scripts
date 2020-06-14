# -*- coding: utf-8 -*-
"""
Created on Mon May 18 22:48:05 2020

@author: Renan
"""
import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np
#teste serie de taylor para seno



phi=0.5

f=1.0

w=2*np.pi*f

x = (w*f+phi) #0 a 2pi

seno = (x - x**3/6 + x**5/120 - x**7/5040+ x**9/362880 -x**11/39916800)

print ("Seno(x) = ",round(seno,4))
