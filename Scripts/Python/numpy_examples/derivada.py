# -*- coding: utf-8 -*-
"""
Created on Wed Jun 10 17:20:35 2020

@author: Renan
"""


import math
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
import scipy.interpolate
import numpy as np


from sympy import *
import numpy as np

x = Symbol('x')
y = x**2 + 1
yprime = y.diff(x)

