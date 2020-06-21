import pandas as pd
import numpy as np
from math import *
import matplotlib.pyplot as plt
import configparser

pd.set_option("display.max_rows", 5000)
pd.set_option("display.max_columns", 10)

config = configparser.ConfigParser()
config.read('config.ini')

Temp = float(config['CONSTANTES']['temperatura_local'])
rho = float(config['CONSTANTES']['rho_local'])
j = float(config['CONSTANTES']['angulo_c_vertical'])
Lb = float(config['CONSTANTES']['comprimento_base'])
g = float(config['CONSTANTES']['gravidade'])
de = float(config['AERO']['diâmetro_externo_foguete'])
vo = float(config['AERO']['velocidade_do_vento']) 
Mt = float(config['AERO']['massa_total_do_foguete'])
alfa = float(config['AERO']['coeficiente_de_hellman']) 
CD = float(config['AERO']['cd_medio'])
mp = float(config['PROPULSÃO']['massa_propelente']) 
tq = float(config['PROPULSÃO']['tempo_queima'])
It = float(config['PROPULSÃO']['impulso_total'])
d_pp = float(config['RECUPERAÇÃO']['diâmetro_paraquedas_principal'])
cd_pp = float(config['RECUPERAÇÃO']['cd_paraquedas_principal'])
d_pa = float(config['RECUPERAÇÃO']['diâmetro_paraquedas_arrasto'])
cd_pa = float(config['RECUPERAÇÃO']['cd_paraquedas_arrasto'])
h_pp = float(config['RECUPERAÇÃO']['altura_de_ejecao_paraquedas_principal'])

cdmedio = False
Tmedio = False
Tm = It/tq
#k = 0.5*rho*S*cd#
a = j*np.pi/180 # ângulo do foguete na base com a vertical

S_foguete = (np.pi*de**2)/4
S_pp = (np.pi*d_pp**2)/4
S_pa = (np.pi*d_pa**2)/4


# Inicialização 
vx = 0.0000000000000001
vy = 0.0000000000000001
v = np.sqrt(vx**2 + vy**2)
x = 0.0000000000000001
y = 0.0000000000000001
D = 0
Dx = 0
Dy = 0
d = 0
gx = 0
gy = g
vguide = 0
Vwind = 0


rho_var = rho*0.9**(y/1000) 

i = 0
dt = 0.001
t = 0

T = Tm
Tx = T * np.sin(a)
Ty = T * np.cos(a)
Dx = D * np.sin(a)
Dy = D * np.cos(a)
Fx = Tx - Dx + Mt * g*np.cos(a)*np.sin(a)
Fy = Ty - Dy + Mt * g*np.cos(a)*np.cos(a)
Ax = Fx/Mt
Ay = Fy/Mt
A = np.sqrt(Ax**2 + Ay**2)

list_vy = [vy]
list_vx = [vx]
list_v = [v]
list_t = [t]
list_y = [y]
list_x = [x]
list_i = [i]
list_Ay = [Ay]
list_Ax = [Ax]
list_A = [A]
list_T = [T]
list_Temperatura = [Temp]
list_vel_do_som = [331.45*((Temp+273.15)/(273.15))**(1/2)] 
list_Vwind = [Vwind]

# Ler curva de empuxo
curva_de_empuxo = pd.read_excel('CurvaDeEmpuxo.xlsx')
df_curva = pd.DataFrame(curva_de_empuxo)
T_function = np.polyfit(df_curva['t1'], df_curva['T1'], 18) # selecione a ordem 

df_mach_cd = pd.read_csv('EXPORT_irec.dat', sep='\s+', header=None, skiprows=1)
cd_function = np.polyfit(df_mach_cd[0],df_mach_cd[1], 18)

list_cd = [df_mach_cd.iloc[0][1]]
list_mach = [df_mach_cd.iloc[0][0]]

list_Dx = [Dx]
list_Dy = [Dy]




f = 0
flag2 = 0
while y > 0:
    
    list_Vwind.append(Vwind)
    
    
    d = np.sqrt(x**2 + y**2)
    
    if flag2 != 1:
        indice = i
    
    if f != 1:
        vguide = v
     
    
    if d < Lb and vy > 0: # na base  
        gx = g*np.cos(a)*np.sin(a)
        gy = g*np.cos(a)*np.cos(a)
        
    else: # Já saiu da base
        f = 1
        gy = g
        gx = 0
        a = atan2(vx, vy)  # ângulo entre o foguete e a vertical 
 
      
    i = i+1
    t = t + dt
    
    
    if t < tq:
        M = Mt -t*(mp/tq)
        T = np.polyval(T_function, t)
        if Tmedio == True:
            T = Tm
        Tx = T * np.sin(a)
        Ty = T * np.cos(a)
                
    else:
        Tx = 0
        Ty = 0
        T = 0
    
    Temperatura = Temp -0.0065*y
    vel_do_som = 331.45*((Temperatura+273.15)/(273.15))**(1/2)
    
    Mach = v/vel_do_som
    rho_var = rho*0.9**(y/1000)
    
    if vy > 0:
#       vx = vx + Ax*dt + list_Vwind[i] - list_Vwind[i-1]
        Vwind = 0
        vx = vx + Ax*dt
        vy = vy + Ay*dt
        v = np.sqrt(vx**2 + vy**2)
        x = x + vx*dt
        y = y + vy*dt
        
        cd_aerolab = np.polyval(cd_function, Mach)
        if cdmedio == False:
            CD = cd_aerolab
#
        k1 = 0.5*rho_var*S_foguete*CD
        D = k1*v**2
        
        Dx = D * np.sin(a)
        Dy = D * np.cos(a)
        
    else: # Na queda
        flag2 = 1
        Vwind = vo*(np.sqrt(y/3))**(alfa)
        
        if np.abs(Dy) < np.abs(M*g):
                       
            # paraquedas de arrasto ejetado:
            CD = cd_pa
            k2 = 0.5*rho_var*S_pa*CD
        
            vx = vx + Ax*dt  - list_Vwind[i] + list_Vwind[i-1]
            vy = vy + Ay*dt
            v = np.sqrt(vx**2 + vy**2)
            x = x + vx*dt
            y = y + vy*dt
        
            D = k2*v**2
        
            Dx = D * np.sin(a)
            Dy = D * np.cos(a)
        
        else: # quando atinge a velocidade terminal
            if y > h_pp: 
                # paraquedas de arrasto
                CD = cd_pa
                k3 = 0.5*rho_var*S_pa*CD
            
                Dy = np.abs(M*g)
                Dx = 0
                v = (np.abs(Dy)/k3)**(1/2)
                vx = -Vwind 
                vy = -v
                x = x + vx*dt
                y = y + vy*dt
                
            elif y <= h_pp:       
                # paraquedas principal
                CD = cd_pp
                k4 = 0.5*rho_var*S_pp*CD
                Dy = np.abs(M*g)
                Dx = 0
                v = (np.abs(Dy)/k4)**(1/2)
                vx = -Vwind 
                vy = -v
                x = x + vx*dt
                y = y + vy*dt
              
                
    Fx = Tx - (vx/np.abs(vx))*Dx + M * gx 
    Fy = Ty - (vy/np.abs(vy))*Dy + M * gy
    Ax = Fx/M
    Ay = Fy/M
    A = np.sqrt(Ax**2 + Ay**2)
    
       
    list_vy.append(vy)
    list_vx.append(vx)
    list_v.append(v)
    list_t.append(t)
    list_y.append(y)
    list_x.append(x)
    list_i.append(i)
    list_Ay.append(Ay)
    list_Ax.append(Ax)
    list_A.append(A)
    list_T.append(T)
    list_cd.append(CD)
    list_Dx.append(Dx)
    list_Dy.append(Dy)
    list_mach.append(Mach)
    list_Temperatura.append(Temperatura)
    list_vel_do_som.append(vel_do_som)
        
    
     
df = pd.DataFrame({'i':list_i, 't':list_t, 'vy':list_vy,'vx':list_vx,'v':list_v, 'x':list_x,  'y':list_y,'Ax':list_Ax, 'Ay':list_Ay,'A':list_A, 'T': list_T, 'Mach': list_mach, 'cd': list_cd, 'Temp': list_Temperatura, 'vs':list_vel_do_som, 'Dx': list_Dx, 'Dy':list_Dy, 'v_vento': list_Vwind })
df1 = (df.reset_index().drop('index', axis=1).set_index('i'))

#(caso queira ver os valores em tabela, com incremento dt)
#print(df1)
#print(df1.loc[:, ['Mach','cd']])
#print(df1.loc[:, ['Mach','y']])  
#print(df1.loc[:, ['t','T']]) 
#print(df1.loc[:, ['Mach','cd','t','y','Temp','vs']]) 

# Plotar gráficos
# Empuxo x tempo
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['t'][1:4000], df['T'][1:4000])
ax.set_xlabel('Tempo (s)', fontsize=12, fontname='Calibri')
ax.set_ylabel('Empuxo (N)', fontsize=12, fontname='Calibri')
# Altura x tempo
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['t'], df['y'])
ax.set_xlabel('Tempo (s)', fontsize=12, fontname='Calibri')
ax.set_ylabel('H (m)', fontsize=12, fontname='Calibri')
# Posição x tempo
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['t'], df['x'])
ax.set_xlabel('Tempo (s)', fontsize=12, fontname='Calibri')
ax.set_ylabel('x (m)', fontsize=12, fontname='Calibri')
# Posição x Altura
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['x'], df['y'])
ax.set_xlabel('Distância (m)', fontsize=12, fontname='Calibri')
ax.set_ylabel(' Altura (m)', fontsize=12, fontname='Calibri')
# Velocidade vertical x tempo
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['t'], df['vy'])
ax.set_xlabel('Tempo (s)', fontsize=12, fontname='Calibri')
ax.set_ylabel(' Vy (m)', fontsize=12, fontname='Calibri')
# Aceleração vertical x tempo
fig_size = (12, 7) # in cm
fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
f, ax = plt.subplots(figsize=fig_size)
ax.plot(df['t'], df['Ay'])
ax.set_xlabel('Tempo (s)', fontsize=12, fontname='Calibri')
ax.set_ylabel(' Ay (m)', fontsize=12, fontname='Calibri')

##Cd x Mach
#fig_size = (12, 7) # in cm
#fig_size = tuple(map(lambda x: x/2.54, fig_size)) # to inches
#f, ax = plt.subplots(figsize=fig_size)
#ax.plot(df['Mach'], df['cd'])
#ax.set_xlabel('Mach', fontsize=12, fontname='Calibri')
#ax.set_ylabel(' Cd', fontsize=12, fontname='Calibri')

v_max = df1['v'].max()
A_max = df1['A'].max()
x_max = df1['x'].max()
H_max = df1['y'].max()
t_total = df1['t'].max()
t_ate_apogeu =  df1.iloc[df1['y'].idxmax()]['t']
Mach_max = df1['Mach'].max()
vel_queda = df1.iloc[-2]['vy']
pos_queda = df1.iloc[-2]['x']

#df2['z\'(t)'].idxmin()


print('Resultados:\n Apogeu = {:.2f} m \n Distância horizontal máxima = {:.2f} m \n Velocidade máxima = {:.2f} m/s \n Aceleração máxima = {:.2f} m/s² \n Tempo até o apogeu = {:.2f} \n Tempo total = {:.2f} s \n Mach max = {:.2f}'.format(H_max, x_max, v_max, A_max,t_ate_apogeu, t_total, Mach_max) )
print(' Velocidade de saída da base = {:.2f} m/s'.format(vguide))
print(' Velocidade ao atingir solo = {:.2f} m/s'.format(np.abs(vel_queda)))
print(' Posição da queda em relação à base  = {:.2f} m'.format(pos_queda))

#writer = pd.ExcelWriter('output_gfrj_hj.xlsx')
#df1.to_excel(writer,'Sheet1')
#writer.save()