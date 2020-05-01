# -*- coding: utf-8 -*-
"""
Created on Thu Feb 27 23:52:06 2020

@author: Renan
"""
import matplotlib.pyplot as plt
from shapely.geometry import Polygon

x_y_curve1 = [(0.121,0.232),(2.898,4.554),(7.865,9.987)] #these are your points for curve 1 (I just put some random numbers)
x_y_curve2 = [(1.221,1.232),(3.898,5.554),(8.865,7.987)] #these are your points for curve 2 (I just put some random numbers)

polygon_points = [] #creates a empty list where we will append the points to create the polygon

for xyvalue in x_y_curve1:
    polygon_points.append([xyvalue[0],xyvalue[1]]) #append all xy points for curve 1

for xyvalue in x_y_curve2[::-1]:
    polygon_points.append([xyvalue[0],xyvalue[1]]) #append all xy points for curve 2 in the reverse order (from last point to first point)

for xyvalue in x_y_curve1[0:1]:
    polygon_points.append([xyvalue[0],xyvalue[1]]) #append the first point in curve 1 again, to it "closes" the polygon

polygon = Polygon(polygon_points)
area = polygon.area
print(area)