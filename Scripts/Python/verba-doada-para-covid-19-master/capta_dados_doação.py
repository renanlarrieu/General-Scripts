#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr 19 18:00:55 2020

@author: renan
"""

'''
intervalo(2,255)=> doações de organizações => dados[i].split(',')[3]

dados[256].split(',')[3] => total de doações por todas organizações

--------------------------------------------------------------------
intervalo(260,266)
artistas => dados[i].split(',')[1]
valor doado = > dados[i].split(',')[3]

dados[267].split(',')[3] => total de doações por artistas

-------------------------------------------------------------------
dados[276].split(',')[3] => total geral somado

'''





org_nome=[]
org_quantia=[]

artista_nome=[]
artista_valor=[]
dados = open("testeteste.xlsx").readlines() #trocar para o nome_do_arquivo após testes de diagnóstico
'''
for i in range (2,136,1):
    if len(dados[i].split(',')) == 4:
        org_nome.append(str(dados[i].split(',')[1]))
        org_quantia.append(float(dados[i].split(',')[3].split('\n')[0]))
    elif len(dados[i].split(',')) == 5:
        org_nome.append(str(dados[i].split(',')[1]))
        org_quantia.append(float(dados[i].split(',')[4].split('\n')[0]))

#fig1 = plt.gcf() #cria a figura 
'''

'''
for i in range (1,134,1):
    c=0

    if len(dados[i].split(','))==4:
        c=c+1


    elif len(dados[i].split(','))!=4:
        print('dado',dados[i],'numero',i,'numero de listas',len(dados[i].split(',')))     
'''    