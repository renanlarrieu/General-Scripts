# -*- coding: utf-8 -*-
"""
Created on Wed Jun 10 17:44:03 2020

@author: Renan
"""


import math
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np



m1=250#massa do do oxidante em gramas g/s#
n=0.69 #expoente parafina
dt=1.4#diametro da garganta cm
at= math.pi*(dt/2)**2 *(1/10000) #area da garganta em m^2 #
k=1.17 # razao de  calores especificos
T= 3277 # temperatura adiabatica da chama em Kelvin 
p2=101325 # pressao atmosferica em pascal
ne=0.90 #eficiencia da tubeira#
mwp= 20.46 #peso molecular do g/m
pf1=0.920 #densidade em g/cm^3
a=0.091 #expoente para # Kg/m^2s#
d=a*(2*n+1) #pra facilitar conta

t=0.02                      #0.000001#.02#tempo inicial#

#ts=0.1 #time step#
L1=10                       #tamanho do grão [cm]
b=(m1/math.pi)**n           # facilitar conta#
kb=(k+1)/(k-1)              #facilitar conta
flutot=0                    #fluxo de massa em 
b1=(m1/math.pi)**n
o=(1/(2*n+1))
Ri=0.5                      #raio inicial da porta cm#
Ro=Ri
R=4.5                       #raio do grao cm#
Ra=0                        #so pra fazer a iteracao#
Rb=(Ri)**(2*n+1)            #pra facilitar conta#
q=((1-2*n)/(1+2*n))         #pra facilitar conta#
ka=(2/(k+1))**kb            #facilitar conta
ct=math.sqrt((8134/mwp)*(T/(k*ka)))




#--------------

k=1.17 # razao de  calores especificos

pf1=920 #densidade em kg/m³




p2=101325 # pressao atmosferica em pascal

m1=0.250#massa do do oxidante em gramas kg/s #input

R_cte= 0.082 #atm. L/mol



Rx=R_cte/mwp #Constante dos gas

T= 3277 # temperatura adiabatica da chama em Kelvin 


ts=0.02

R4 = (d * b1 * t + Rb) ** (o)  # [cm] raio da porta
Ra = R4

npa = math.pi * (R4 / 100) ** 2

oxfl=(m1/npa)*1000 #fluxo de ox em kg/m^2) 

r=a*((oxfl))**n #taxa de regressão kg/m²*kg/m²s=kg²/m^4*s

Ab=2*np.pi*Ra*L1*(1e-4) #área de queima [m²]

V0=11e-9 #volume da câmara [m³]- input

p0=101325 #[pascal]

rho0 = p0/Rx*T #densidade 

#calculo posterior

#dp [psi]

#r / p0 / rho0 / 

dp=(((pf1-rho0)*Ab*r*m1-((p0)/math.sqrt(Rx*T))*math.sqrt(k)*(2/(k+1))**((k+1)/(2*(k-1))))*ts*T*(1/V0))/(6895)