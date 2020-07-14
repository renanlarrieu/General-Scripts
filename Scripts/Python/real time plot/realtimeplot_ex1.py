# -*- coding: utf-8 -*-
"""
Created on Tue Jul 14 02:06:39 2020

@author: Renan
"""


import random
from itertools import count
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

plt.style.use('fivethirtyeight')

x_values = []
random_values = []
y_values = []

index = count()

for i in range (0,100,1):
    y_values.append(random.randint(0,10))

def animate(i):
    x_values.append(next(index))
    #y_values.append(random.randint(0, 5))
    plt.cla()
    plt.plot(x_values, y_values)


ani = FuncAnimation(plt.gcf(), animate, 1000)


plt.tight_layout()
plt.show()