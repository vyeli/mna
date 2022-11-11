#Sistema para IVP, aproximar la derivada con varios puntos 

#Rec Ej4

A=[1 1 1 1 1; -1 0 1 2 3; 1/2 0 1/2 2 9/2; -1/6 0 1/6 4/3 9/2; 1/24 0 1/24 2/3 27/8];
B=[0 1 0 0 0]';

Resp = A\B;
rats(Resp);  #Formato racional

f= @(x) 3*e^(3*x);

h=0.1;
format long;
aprox = 1/(12*h) * (-3*e^(3*(3-h))-10*e^(3*3)+18*e^(3*(3+h))-6*e^(3*(3+2*h))+e^(3*(3+3*h)));

error1 = abs(f(3)-aprox);

h=0.05;
aprox = 1/(12*h) * (-3*e^(3*(3-h))-10*e^(3*3)+18*e^(3*(3+h))-6*e^(3*(3+2*h))+e^(3*(3+3*h)));
error2 = abs(f(3)-aprox);

xd = error1/error2;


#EJ4 parcial 2021

A=[1 1 1 1 1; 2 1 0 -1 -2; 2 1/2 0 1/2 2; 4/3 1/6 0 -1/6 -4/3; 2/3 1/24 0 1/24 2/3];
B=[0 0 0 1 0]';
Resp = A\B;
rats(Resp)  #Formato racional