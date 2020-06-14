"""
Created on Wed Jun 10 17:44:03 2020

@author: Renan
"""

class Robot: #classe
    def __init__(self, name, BodyColor, weight ,EyeColor): #construtor 
        
        self.name = name #atributos do objeto que serão passados para o construtor
        self.BodyColor = BodyColor
        self.weight = weight
        self.EyeColor = EyeColor
        

    def Atendimento_inicial(self):
        print("Meu nome é " + self.name + ", sou um Robô do atendimento eletrônico."+" Como posso ajudá-lo(a)?")
        
    def introduce_self_features(self):
        print("Here it is some data about me. Enjoy!")
        print("My body is " + self.BodyColor)
        print("My weight is " + self.weight + " kg" )
        print("My eyes are " + self.EyeColor)

# método ineficiente de passar atributos aos objetos de uma classe 
'''     
r1 = Robot() 
r1.name = "Tom"
r1.BodyColor = "red"
r1.weight = 30

r2 = Robot()
r2.name = "Jerry"
r2.BodyColor = "blue"
r2.weight = 40
'''

#método eficiente"
robot1 = Robot("Tom", "red", "30","Black") #construtor criando objetos a partir dos atributos passados em seus argumentos
robot2 = Robot("Jerry", "blue", "40","blue")

#robot1.introduce_self()
#robot1.introduce_self_features()

#print("-----------------------")

#robot2.introduce_self()
#robot2.introduce_self_features()

