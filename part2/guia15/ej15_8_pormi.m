% BVP
clear all, clc, close all;
xmin = 0;
xmax = 1;
NI = 61011 		% Puntos internos
h = (xmax-xmin)/(NI+1) % paso

y0 = 1;
ypL=0; % y'(1)=0
alpha=4;
x = linspace(xmin, xmax, NI+2)

% genero la Matriz por spdiags

d0 = -(2+alpha*(h^2)*ones(NI+1,1));

#Notemos que para usar spdiags tenemos que hacer que los vectores columna tenga la misma longitud
#Estas longitudes se van a perder por que son mas chicas que la diagonal, por lo tanto tenemos que poner el -2 en el anteultimo lugar en la diag inf
diagsup= ones(NI+1,1);
diaginf = diagsup;
diaginf(end-1)=2; #Aca esta la correcion
#Aca esta la magia de matriz sparse
#Notemos que spdiags quiere que todos los vectores columna tenga la misma longitud por lo tanto no queda otra que armala de mas a la diagonal superior e inferior
M = spdiags([diaginf d0 diagsup], -1:1, NI+1, NI+1);

% genero b
b = zeros(NI+1,1);
b(1)= -y0;

% vector de incognitas

yi=M\b;
yi(end)




#disp('error en cada punto del intervalo')
#[x' abs(y-yex')]
#plot(x, y, '*', x , yex,'-r')
#legend('Aprox', 'Exacta')
