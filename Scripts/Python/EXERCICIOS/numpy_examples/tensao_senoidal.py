import numpy as np
import math
import matplotlib.ticker as tck
import scipy.interpolate
import matplotlib.pyplot as plt

 

F = 5.e2          # No. of cycles per second, F = 500 Hz
T = 5.e-3         # Time period, T = 2 ms
Fs = 50.e3       # No. of samples per second, Fs = 50 kHz
Ts = 1./Fs        # Sampling interval, Ts = 20 us
N = int(T/Ts)     # No. of samples for 2 ms, N = 100

w=2*(np.pi)*F

#-------------------------------------------------------------
Vp = float(15) #tensão de pico = amplitude
phi = float(np.pi) #em radiano
R = 4.3


Ip = Vp/R






t = np.linspace(0, T, N ,endpoint=True)

voltage = Vp*np.sin(w*t+phi)

current = Ip*np.sin(w*t+phi)


x=t
y=voltage
def integrate(x, y):
    area = np.trapz(y=y, x=x)
    return area

integrate(x,y)


fig1 = plt.gcf() #cria a figura    
fig1, ax = plt.subplots() #anexa os subplots na figura
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.rcParams['figure.figsize'] = (12,8)
ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
plt.plot(t, voltage, color='red')
plt.plot(t, current, color='blue')

plt.xlabel('Time (s)')
plt.ylabel('Voltage (V) and Current (A)')

plt.grid(True, which='both')

 

plt.axhline(y=0, color='k')


#fig2 = plt.gcf() #cria a figura    
#fig2, ax = plt.subplots() #anexa os subplots na figura
#ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
#plt.rcParams['figure.figsize'] = (10,8)

#plt.plot(t, current)
#plt.xlabel('Time (s)')
#plt.ylabel('Current (A)')


 

plt.show()


'''
# Get x values of the sine wave

time  = np.arange(0, 10, 0.01);

voltage = np.arange(0,100,0.01);

r = float(122.1)

current = np.arange(0,11,0.01)

np.arange()
#V(t)=Vp.sin(wt+phi)
#w=2pif
 

# Amplitude of the sine wave is sine of a variable like time

amplitude = np.sin(time)

 

# Plot a sine wave using time and amplitude obtained for the sine wave

plot.plot(time, amplitude)

 

# Give a title for the sine wave plot

plot.title('Sine wave')

 

# Give x axis label for the sine wave plot

plot.xlabel('Time')

 

# Give y axis label for the sine wave plot

plot.ylabel('Amplitude = sin(time)')

 

plot.grid(True, which='both')

 

plot.axhline(y=0, color='k')

 

plot.show()

 

# Display the sine wave

plot.show()

'''