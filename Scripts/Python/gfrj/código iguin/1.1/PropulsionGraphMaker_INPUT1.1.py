import math
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np

#Author: Propulsão + Renan larrieu FEN-DETEL


print("-------------------------------------------------------------")
print("NOVA SIMULAÇÃO")
print("-------------------------------------------------------------")
ts=float(input("Timestep da simulação : "))

Ri=float(input("Raio da porta [cm] : "))
R=float(input("Raio do grão [cm] : "))
a=float(input("Constante de Regressão [Kg/m²s] : "))
L1=float(input("Tamanho do grão [cm] : "))
dt=float(input("Diâmetro da garganta [cm] : "))
m1=float(input("Vazão de oxidante [g/s] : "))

print("-------------------------------------------------------------")


#densidade/raio da porta/ raio do grao / constante de regressão
# / tamanho do grão / tamanho da garganta / fluxo do oxidante 

#o que falta
#consideracao de variacao o oxidante
#consideracao sobre injetor
#consideracao de variacao no k
#grafico, mas logo eu coloco
#correcoes no mwp (peso molecular dos gases de exaustao)
#melhorar identacao
#aplicar regime trasiente partida e final de quima
#impor mais variaveis


#m1=250#massa do do oxidante em gramas g/s#
n=0.69 #expoente parafina
#dt=1.4#diametro da garganta cm
at= math.pi*(dt/2)**2 *(1/10000) #area da garganta em m^2 #
k=1.17 # razao de  calores especificos
T= 3277 # temperatura adiabatica da chama em Kelvin 
p2=101325 # pressao atmosferica em pascal
ne=0.90 #eficiencia da tubeira#
mwp= 20.46 #peso molecular do g/m
pf1=0.920 #densidade em g/cm^3
#a=0.091 #expoente para # Kg/m^2s#
d=a*(2*n+1) #pra facilitar conta
t=0.02#tempo inicial#
#ts=0.1 #time step#
#L1=10#comprimento em cm do grao#
b=(m1/math.pi)**n  # facilitar conta#
kb=(k+1)/(k-1) #facilitar conta
flutot=0 #fluxo de massa em 
b1=(m1/math.pi)**n
o=(1/(2*n+1))
#Ri=0.5#raio inicial da porta cm#
Ro=Ri
#R=4.5#raio do grao cm#
Ra=0 #so pra fazer a iteracao#
Rb=(Ri)**(2*n+1) #pra facilitar conta#
q=((1-2*n)/(1+2*n))#pra facilitar conta#
ka=(2/(k+1))**kb #facilitar conta
ct=math.sqrt((8134/mwp)*(T/(k*ka)))

def integrate(x, y):
    area = np.trapz(y=y, x=x)
    return area



lista_fluxo_total=[]
lista_massa_combustivel=[]
lista_fluxo_of=[]
lista_força=[]
lista_pressão=[]
lista_oxfl=[]

lista_tempo=[]

#fluxo de massa total e combust/ tempo - OF/tempo - força/tempo - pressao/tempo - oxfl/tempo

#fluxo total/força/pressao
while Ra<R:
    R4 = (d * b1 * t + Rb) ** (o)  # raio da porta
    Ra = R4
    if Ra < R:
        lista_tempo.append(t)
        t = t + ts       
        
        npa = math.pi * (R4 / 100) ** 2
        oxfl=(m1/npa)*1000 #fluxo de ox em kg/m^2)   
        lista_oxfl.append(oxfl)
#---------------------------------------------------         

        r=a*((oxfl))**n
        mf = math.pi * L1 * pf1 * ((R4) ** 2 - (Ro) ** 2) * (1 / ts)  # massa do combustive g/s#
        lista_massa_combustivel.append(mf)
#--------------------------------------------------- 
        flutot = (m1 / 1000) + (mf / 1000)
        lista_fluxo_total.append(flutot)

#---------------------------------------------------        
        of = m1 / mf
        lista_fluxo_of.append(of)
#---------------------------------------------------        
        
        p1 = (flutot / (at)) * ct
        p3 = p1 / 6895
        lista_pressão.append(p3)
#---------------------------------------------------        
        
        cf = math.sqrt((((2 * k ** 2) / (k - 1))) * ka * (1 - (p2 / p1) ** ((k - 1) / k))) * ne

#---------------------------------------------------        
        F = cf * at * p1
        lista_força.append(F)

        Ro = R4

#--------------------------------------------------------------------------


fig0 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig0, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

plt.title("Simulação Motor Híbrido",fontsize=50)

plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
#plt.ylabel('Fluxo de massa combustível [g/s]',fontsize=40) #nome do eixo y
plt.plot(lista_tempo, lista_massa_combustivel, color='red',linewidth=4.0, linestyle = '-',label="Vazão [g/s]") #dois graficos em 1
#plt.scatter(lista_tempo, lista_massa_combustivel, color='red', marker = '*')#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both') 
plt.tick_params(labelsize=50); 
#---------------------------------------------------  


#---------------------------------------------------  


plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
#plt.ylabel('Pressão [psi]',fontsize=40) #nome do eixo y
plt.plot(lista_tempo,lista_pressão, color='black',linewidth=4.0, linestyle = '-',label="Pressão [psi]") #dois graficos em 1
#plt.scatter(lista_tempo,lista_pressão, color='red', marker = '*')#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both')
plt.tick_params(labelsize=50);  

pmax = max(float(number) for number in lista_pressão)
elemento = lista_pressão.index(pmax)
instante_pmax = (lista_tempo[elemento])

print ("Força máxima :",round(pmax,3),"psi")
print ("Instante de pressão máxima :",round(instante_pmax,3),"s")

#---------------------------------------------------  




plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
#plt.ylabel('Força [N]',fontsize=40) #nome do eixo y
plt.plot(lista_tempo,lista_força, color='blue',linewidth=4.0, linestyle = '-',label="Força [N]") #dois graficos em 1
plt.legend(loc="upper right",prop={'size': 50})

plt.grid(True, which='both')
plt.tick_params(labelsize=50);  

integrate(lista_tempo,lista_força)
print("Impulso :",round(integrate(lista_tempo,lista_força),3),"N.s")

fmax = max(float(number) for number in lista_força)
elemento = lista_força.index(fmax)
instante_fmax = (lista_tempo[elemento])
print ("Força máxima :",round(fmax,3),"N")
print ("Instante de força máxima :",round(instante_fmax,3),"s")
print('Tempo de queima =',round(lista_tempo[len(lista_tempo)-1],3),'s')




#--------------------------------------------------- 
 


fig6 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig6, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

plt.title("OXFL x tempo",fontsize=50)

plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
plt.ylabel('OXFL [kg/m²]',fontsize=50) #nome do eixo y

plt.plot(lista_tempo,lista_oxfl, color='purple',linewidth=4.0, linestyle = '-',label = "OXFL [Kg/m²]") #dois graficos em 1
plt.legend(loc="upper right",prop={'size': 50})
plt.scatter(lista_tempo,lista_oxfl, color='red', marker = '*')#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both') 
plt.tick_params(labelsize=50); 



fig1 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})


plt.title("Fluxo de massa total x tempo",fontsize=50)

plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
plt.ylabel('Fluxo de massa total [kg/s]',fontsize=50) #nome do eixo y

plt.plot(lista_tempo, lista_fluxo_total, color='blue',linewidth=4.0, linestyle = '-',label= "Vazão total [Kg/s]") #dois graficos em 1
plt.legend(loc="upper right",prop={'size': 50})
plt.scatter(lista_tempo, lista_fluxo_total, color='red', marker = '*')#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both') 
plt.tick_params(labelsize=50); 

#---------------------------------------------------  
'''
fig2 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (40,30) #tamanho do gráfico
fig2, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

#-----
'''

fig3 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig3, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

plt.title("Razão OF x tempo",fontsize=50)

plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
plt.ylabel('Razão OF',fontsize=50) #nome do eixo y



plt.xlabel('Tempo [s]',fontsize=50) #nome do eixo x
plt.plot(lista_tempo,lista_fluxo_of, color='orange',linewidth=4.0, linestyle = '-',label="OF") #dois graficos em 1
plt.legend(loc="upper right",prop={'size': 50})
plt.scatter(lista_tempo,lista_fluxo_of, color='red', marker = '*')#, s= z) #dois graficos em 1
#plt.fill_between(x,0,y, color = 'grey') #pinta a área sob a curva
plt.grid(True, which='both')
plt.tick_params(labelsize=50);  

print("-------------------------------------------------------------")
