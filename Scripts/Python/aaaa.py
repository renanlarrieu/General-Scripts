# -*- coding: utf-8 -*-
"""
Created on Mon Apr  6 16:20:30 2020

@author: Renan
"""

import requests

api_url = 'https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY'

req_url = requests.get(api_url)

if req_url.status_code == 200:

    dados = req_url.json()
print(dados)
#tkd = dados['id']['estimated_diameter'][3]


#print(tkd)