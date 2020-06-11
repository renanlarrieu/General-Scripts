# -*- coding: utf-8 -*-
"""
Created on Sun May 17 22:27:36 2020

@author: Renan
"""


import math
#import mathplotlib.pyplot as plt#

m1=100#massa do do oxidante em gramas#
n=0.69
dt=1#diametro da garganta cm
at= math.pi*(dt/2)**2 *(1/10000)
k=1.17 # razao de  calores especificos

T= 3277 # temperatura adiabatica da chama em Kelvin
 
p2=101325 # pressao atmosferica em pascal

ne=0.90 #eficiencia da tubeira#

mwp= 20.46 #peso molecular do g/m

pf1=0.95 #densidade em g/cm^3

a=0.091 #expoente para # Kg/m^2s#

a1=0.188 #expoente para g/m^2s

d=a*(2*n+1) #pra facilitar conta

t=0.02#tempo inicial#

ts=0.02 #time step#

L1=15#comprimento em cm#

b=(m1/math.pi)**n  # facilitar conta#

kb=(k+1)/(k-1)

flutot=0 #fluxo de massa em 

totalreg=0

b1=(17/math.pi)**n

o=(1/(2*n+1))

Ri=1.05 #raio inicial da porta#

Ro=Ri

R=2.3 #raio do grao cm#

Ric=0.0064 #raio inicial usado para recursao#

Ra=0 #so pra fazer a iteracao#

Rb=(Ri)**(2*n+1) #pra facilitar conta#

q=((1-2*n)/(1+2*n))#pra facilitar conta#

ka=(2/(k+1))**kb

ct=math.sqrt((8134/mwp)*(T/(k*ka)))

print(round(ct,3),"ct")

mf_data=[]
oxfl_data=[]
r_data=[]
flutot_data=[]
of_data=[]
t_data=[]
F_data=[]
R4_data=[]

while Ra<R:
	 R4=((d*b1*t)+Rb)**(o) #raio da porta
	 Ra=R4
	 if Ra<R:
 	 	npa=math.pi*(R4)**2
 	 	oxfl=(m1/npa)*10 #fluxo de ox em kg/m^2)
 	 	print(round(R4,3), 'raio instantâneo [cm]')    
 	 	print(round(oxfl,3),'Fluxo de OX instantâneo [kg/m²]')
 	 	r=a*((oxfl))**n
 	 	mf=math.pi*L1*pf1*(R4**2 - Ro**2)*(1/ts)# massa do combustive g/s#
 	 	print(round(mf,3), "m de cobusti [g/s]")
 	 	flutot=m1+mf
 	 	print(round(flutot,3), "Fluxo total instantâneo [g/s]")
 	 	of=m1/mf
 	 	print(round(of,3),"fluxo of")
 	 	p1=(flutot/(at*1000))*ct
 	 	p3=p1/6895
 	 	print ((round(p3,3)), 'Pressão instantânea')
 	 	t=t+ts
 	 	print(round(t,3), 'Instante [s]')
 	 	cf=math.sqrt((((2*k**2)/(k-1)))*ka*(1-(p2/p1)**((k-1)/k)))*ne
 	 	#print (cf,"coeficiente de empuxo")
 	 	F=cf*at*p1
 	 	print(round(F,3),"Força [N]")
 	 	Ro=R4

'''
     else:
         break
'''         