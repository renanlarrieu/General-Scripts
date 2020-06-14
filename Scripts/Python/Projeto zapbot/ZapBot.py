# -*- coding: utf-8 -*-
"""
Created on Sat Jun 13 18:15:40 2020

@author: Renan

OBSERVAÇÃO IMPORTANTE: O BOT SÓ CONSEGUE MANDAR MENSAGEM PARA AS CAIXAS DE MENSAGENS 
QUE ESTIVEREM VISÍVEIS NA BARRA LATERAL ESQUERDA DO WHATSAPPWEB

"""


from selenium import webdriver
import time


class WhatsappBot:
    def __init__(self):
        # Parte 1 - A mensagem que você quer enviar
        self.mensagem = "Sou um bot chamado Squirtle. Por favor, Lucas Ferreira, hidrate-se. :)"
        # Parte 2 - Nome dos grupos ou pessoas a quem você deseja enviar a mensagem
        self.grupos_ou_pessoas = ["HIDRATE-SE LUCAS","Renan foi mal","Backup da hora","Renan foi mal","Lembrete entregar capinha","Bença familiar","Rolê Barbixas","FESTA JUNINA UFRJ","Bjo grego do luc", "Renan me desculpa" , "Renan me perdoa"]
#        self.grupos_ou_pessoas = ["Backup da hora"]
        options = webdriver.ChromeOptions()
        options.add_argument('lang=pt-br')
        self.driver = webdriver.Chrome(
            executable_path=r'./chromedriver.exe', chrome_options=options)
        self.driver.get('https://web.whatsapp.com')
        time.sleep(10)

    def EnviarMensagens(self):
        #<span dir="auto" title="Carusinho" class="_3ko75 _5h6Y_ _3Whw5">Carusinho</span>
        
        #<span dir="auto" title="Lucas Ferreira" class="_3ko75 _5h6Y_ _3Whw5">Lucas Ferreira</span>
        
        #<div tabindex="-1" class="_3uMse">
        
        #<span data-icon="send" class="">
        '''
        self.driver.get('https://web.whatsapp.com')
        time.sleep(10)
        '''
        for grupo_ou_pessoa in self.grupos_ou_pessoas:
            campo_grupo = self.driver.find_element_by_xpath(
                f"//span[@title='{grupo_ou_pessoa}']")
            time.sleep(3)
            campo_grupo.click()
            chat_box = self.driver.find_element_by_class_name('_3uMse')
            time.sleep(3)
            chat_box.click()
            chat_box.send_keys(self.mensagem)
            botao_enviar = self.driver.find_element_by_xpath(
                "//span[@data-icon='send']")
            time.sleep(3)
            botao_enviar.click()
            time.sleep(5)


bot = WhatsappBot()
bot.EnviarMensagens()


'''
for i in range (0,10,1):
    bot.EnviarMensagens()
    time.sleep(3)
'''