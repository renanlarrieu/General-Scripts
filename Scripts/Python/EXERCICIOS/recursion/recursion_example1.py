n = int(6)

def fact(n):
    if (n>=1):
        return n*fact(n-1)
    else:
        return 1

x = fact(n)
print(x)



def teste1():
    if (n>5):
        return True
    else:
        return False

def teste2():
    if (teste1()==True):
        return n*fact(n-1)
    else:
        return None

y = teste2()
print(y)

counter = 1
def teste3(n):
    if(n<15):
        return n+1

z = teste3(n)
print(z)
print("Counter = ",counter)
