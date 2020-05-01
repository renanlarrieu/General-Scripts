# -*- coding: utf-8 -*-
"""
Created on Mon Apr  6 16:20:30 2020

@author: Renan
"""

x=[]
a=[]

import requests
from bs4 import BeautifulSoup

URL = 'https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY'
page = requests.get(URL)

soup = BeautifulSoup(page.content, 'html.parser')

#print(soup.prettify())

    
for i in soup:
    if i != 0:
        x.append(i)
    else:
        None
        