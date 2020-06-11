# -*- coding: utf-8 -*-
"""
Created on Tue Jun  9 15:42:54 2020

@author: Renan
"""
import math
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np

nsp=float(input('ENTER THE NO. OF STAR POINTS :'))
w=float(input('ENTER THE WEB THICKNESS (mm) :'))
ro=float(input('ENTER THE OUTER RADIUS (mm) :'))
ri=float(input('ENTER THE INNER RADIUS :'))
OA=float(input('ENTER THE OPENING ANGLE IN DEGREES :'))
ef=float(input('ENTER THE ANGULAR FRACTON :'))
f=float(input('ENTER THE FILLET RADIUS (mm) :'))
L=float(input('ENTER THE LENGTH OF GRAIN (mm) :'))
rin=float(input('ENTER THE INITIAL BURN RATE(mm/sec) :'))
pin=float(input('ENTER THE INITIAL PRESSURE (N/mm2) :'))
n=float(input('ENTER THE CONSTANT INPUT VALUE FOR n :'))
d=float(input('ENTER THE DENSITY OF CHAMBER (kg/mm3) :'))
v=float(input('ENTER THE CHARECTERISSTIC VELOCITY (mm/sec) :'))
D=float(input('ENTER THE THROAT DIAMETER (mm) :'))
x=float(input('ENTER THE EACH EXTENT VALUE FOR WHICH PROGRAM WRITTEN (mm) :'))

#CALCULATION FOR CONSTANT VALUES
At=4*(np.pi/4)*(D**2)
a=(rin/((pin)**n))
rp=ro-w-f
H=rp*np.sin(np.pi*ef/nsp)
OA=2*math.atan(rp*np.sin(np.pi*ef/nsp)*np.tan(np.pi*ef/nsp)/(rp*np.sin(np.pi*ef/nsp)-ri*np.tan(np.pi*ef/nsp)));
oa=OA*np.pi/180
iss=0
ymax=math.sqrt(((ro-rp*np.cos(np.pi*ef/nsp))**2)+(rp*np.sin(np.pi*ef/nsp))**2)-f
ym=ymax-abs((ymax-round(ymax)))
B=((np.pi/2)-(oa/2)+(np.pi*ef/nsp))

#CALCULATION FOR VARIABLE VALUES
y=0

t=[]
p=[]
T=[]
dt=[]
r=[]

for i in range (0,100,1):
    t.append(None)
    p.append(None)
    T.append(None)
    dt.append(None)
    r.append(None)
    


Constante1=(rp*(np.sin(ef*np.pi/nsp)/np.cos(oa/2)))-f





while y<Constante1:
    y=y+0.05
    iss=iss+1
    t[0]=0
    p[0]=0
        
        
        
'''
for y=0:0.05:(rp*(np.sin(ef*np.pi/nsp)/np.cos(oa/2)))-f#***********

iss=iss+1
t(1)=0
p(1)=0
'''
#CONDITIONS FOR PHASE I

if y<=(  rp*(np.sin(ef*np.pi/nsp)  /(np.cos(oa/2))  )-f):

       s1=(rp*np.sin(np.pi*ef/nsp)/np.sin(oa/2))-((y+f)*(1/np.tan(oa/2)));
       s2=(y+f)*((np.pi/2)-(oa/2)+((np.pi*ef)/nsp))
       s3=(rp+y+f)*(((np.pi)/nsp)-((np.pi*ef)/nsp))
       s=(2*nsp)*(s1+s2+s3)
       A=s*L
       p[iss+1]=((a*A*d*v/At)**(1/(1-n)))
       T[iss+1]=(p[iss+1]*At)



r[iss]=a*(p[iss+1]**n)
dt[iss]=(x/r[iss])
t[iss+1]=t[iss]+dt[iss]


Constante2=(rp*(np.sin(ef*np.pi/nsp)/np.cos(oa/2)))-f
while Constante2<w:
    Constante2=Constante2+0.05
    iss=iss+1
'''    
for y=(rp*(np.sin(ef*np.pi/nsp)/np.cos(oa/2)))-f:0.05:w #***********
    iss=iss+1
'''

#CONDITIONS FOR PHASE II



if (((rp*(np.sin(ef*np.pi/nsp)/np.cos(oa/2)))-f)<y<=w): #***********

    s=(2*nsp)*((y+f)*((np.pi*ef/nsp)+(np.pi/2)-(math.atan((math.sqrt(((y+f)**2)-(H**2)))/H)))+((rp+y+f)*((np.pi/nsp)-(np.pi*ef/nsp))))
    A=s*L
    p[iss+1]=((a*A*d*v/At)**(1/(1-n)))
    T[iss+1]=(p[iss+1]*At)
    #end
    r[iss]=a*(p[iss+1]**n)
    dt[iss]=(x/r[iss])
    t[iss+1]=t[iss]+dt[iss]
    #end
y=w    
while y<ym:
    y=y+0.05
    iss=iss+1
    
'''      
for y=w:0.05:ym; #***********
    iss=iss+1;
'''

#CONDITIONS FOR PHASE III

if (w<y<=ym): #***********
    G=(math.atan(math.sqrt(((y+f)**2)-((rp*np.sin(ef*np.pi/nsp))**2))/(rp*np.sin(np.pi*ef/nsp))))-(oa/2)
    Z=(np.pi)-(math.acos(-((ro**2)-(rp**2)-((y+f)**2))/(2*rp*(y+f))))
    s=(2*nsp)*((y+f)*(B-G-Z))
    A=s*L
    p[iss+1]=((a*A*d*v/At)**(1/(1-n)))
    T[iss+1]=(p[iss+1]*At)
    #end
    r[iss]=a*(p(iss+1)**n)
    dt[iss]=(x/r[iss])
    t[iss+1]=t[iss]+dt[iss]
    #end

#CONDTION TO PLOT GRAPH FOR THRUST VS TIME

fig0 = plt.gcf() #cria a figura    
plt.rcParams['figure.figsize'] = (50,40) #tamanho do gráfico
fig0, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams.update({'font.size': 22})

plt.plot(t,T,color='blue',linewidth=4.0, linestyle = '-')