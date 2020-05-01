# -*- coding: utf-8 -*-
"""
Created on Tue Apr 28 02:56:45 2020

@author: Renan
"""
número_de_bits = int(input('Digite o número de bits :'))
s1=[]
s2=[]
for i in range (0,número_de_bits,1):
    s1.append(i)
for i in range (0,número_de_bits,1):
    s2.append(i)    
for i in range(0,número_de_bits,1):
    s1[i] = int(input('Digite o bit do PRIMEIRO vetor :'))
print('\n')    
print('-------------------------------------------------------------------------\n')    
for i in range(0,número_de_bits,1):    
    s2[i] = int(input('Digite o bit do SEGUNDO vetor :')) 
                 

def hamming_distance(s1, s2):
    assert len(s1) == len(s2)
    print('\n')
    return print('A distância de hamming é :',sum(ch1 != ch2 for ch1, ch2 in zip(s1, s2)))



hamming_distance(s1, s2)