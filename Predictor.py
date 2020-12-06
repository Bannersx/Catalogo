# -*- coding: utf-8 -*-
"""
Created on Sat Dec  5 18:30:52 2020

@author: alekm
"""
##Importando sympy
import sympy
from sympy import *
import numpy as np


##Definiendo los simbolos
x = Symbol('x')
y = Symbol('y')

##Definiendo la funcion f(x,y) = y'
f = y - x**2 + 1

##Definiendo una función auxiliar
def evaluar(fun, x, y):
    fs = str(fun)
    fs = fs.replace('x', str(x))
    fs = fs.replace('y', str(y))
    return eval(fs)

##Definiendo valores iniciales
w = 11  #Numero de puntos
a = 0   #punto inicial del intervalo
b = 2   #punto final del intervalo
h = (b-a)/(w-1) #h
y0 = 0.5    #condicion inicial

#Vectores para la solucion
X = [0 for x in range(11)]
Y = [0 for x in range(11)]
Yc = [0 for x in range(11)]

#Colocando el valor inicial del vector predictor 
Yc[0] = y0

#Calculando los valores Xi del vector X
for i in range(0,10):
    X[i] = a + h*(i)
    
#Calculando el vector predictor y el corrector:
for i in range(0,10):
    Y[i+1] = Yc[i]+ h * evaluar(f, X[i],Yc[i])
    Yc[i+1] = Yc[i]+ h * ((evaluar(f, X[i],Yc[i]))+(evaluar(f, X[i+1],Y[i+1])))/2 
    
##Mostrando los valores obtenidos.
print("Valores pred.")
print(Y)
print("\n")
print("Valores corr.")
print(Yc)
