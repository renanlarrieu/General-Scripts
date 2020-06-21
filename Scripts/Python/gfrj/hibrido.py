# -*- coding: utf-8 -*-
"""
Created on Wed May 13 17:52:16 2020

@author: Renan
"""
n=int(58)
x=0
dx=5.8/n
y = []

for i in range (0,n,1):
    y.append(x+dx)
    x = x + dx
