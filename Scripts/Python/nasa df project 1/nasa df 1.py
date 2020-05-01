# -*- coding: utf-8 -*-
"""
Created on Mon Apr  6 15:09:40 2020

@author: Renan
"""

import requests
import urllib.request
import time
import matplotlib.pyplot as plt
import matplotlib.ticker as tck
from splinter import Browser
import numpy as np
import pandas as pd
import requests
from bs4 import BeautifulSoup


# Execução do Request GET para obter o conteúdo da página
req = requests.get('https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY')
if req.status_code == 200: # Status 200 indica que a requisição foi completada
    print('Requisição bem sucedida!')
    content = req.content # obtém conteúdo da página



soup = BeautifulSoup(content, 'html.parser')
# Utilizando somente o nome da tag HTML
table = soup.find(name='table')
# Especificando atributos da tag
table = soup.find(name='table', attrs={'id':'totals_stats'})
# Usando find_all
table = soup.find_all(name='table')

# Lendo como Data Frame
table_str = str(table)
df = pd.read_html(table_str)[1]
print (df)
#print (df)
#df2= pd.read_html(table_str)[1]
#print(df)
