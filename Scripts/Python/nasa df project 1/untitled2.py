# -*- coding: utf-8 -*-
"""
Created on Mon Apr  6 17:03:46 2020

@author: Renan
"""

# Import libraries
import requests
import urllib.request
import time
from bs4 import BeautifulSoup
caracteres = []
lista =[ ]


a=[]
# Set the URL you want to webscrape from
vgm_url = 'https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY'

html_text = requests.get(vgm_url).text
# Connect to the URL
#response = requests.get(url)

# Parse HTML and save to BeautifulSoup object¶
soup = BeautifulSoup(html_text,'html.parser')#, "html.parser")

# To download the whole data set, let's do a for loop through all a tags
#line_count = 1 #variable to track what line you are on
#for one_a_tag in soup.findAll('a'):  #'a' tags are for links
#    if line_count >= 36: #code for text files starts at line 36
#        link = one_a_tag['href']
#        download_url = 'http://web.mta.info/developers/'+ link
#        urllib.request.urlretrieve(download_url,'./'+link[link.find('/turnstile_')+1:]) 
#        time.sleep(1) #pause the code for a sec
    #add 1 for next line
#    line_count +=1
for link in soup.find_all('a'):
    print(link.get('href'))
    #lista.append(i)
    
#caracteres = lista[0]

#for i in caracteres:
#    if caracteres[i] == '{':
#        while caracteres[i] != '}':
#            a.append(i)
#    else:
#        None


    
