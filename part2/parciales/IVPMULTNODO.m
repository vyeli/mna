#Sistema para IVP, aproximar la derivada con varios puntos

#Rec Ej4

A=[1 1 1 1 1; -1 0 1 2 3; 1/2 0 1/2 2 9/2; -1/6 0 1/6 4/3 9/2; 1/24 0 1/24 2/3 27/8];
B=[0 0 1 0 0]';

Resp = A\B;
rats(Resp)  #Formato racional


format long
xd = 1/12*(11*0.045242-20*0.05+6*0.045242+4*0.033516-0.020328)

