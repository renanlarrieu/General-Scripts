# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 16:30:51 2020

@author: Renan
"""
x=[]

n=26 #número de amostras de força
t=6.2 #tempo total de queima
a=0
da=6.2/n
for i in range (0,n,1):
    x.append(a+da)
    a=a+da
    
    
