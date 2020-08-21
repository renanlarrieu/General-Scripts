# -*- coding: utf-8 -*-
"""
Created on Mon May 18 22:38:37 2020

@author: Renan
"""


import os
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
#import scipy.interpolate
#import numpy as np

n=int(100)

dt=1

yo=0

y=[]

x=[]

c=0

while c<628:
    y.append(yo+dt)
    yo=yo+dt
    c=c+1

for i in range (0,n,1):
    x.append(i)
