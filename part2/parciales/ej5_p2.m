clear all ; close all; clc
xmin=0;
xmax=1;
ymax=1; %y5
NI=4;
h=(xmax-xmin)/(NI+1);
x=linspace(xmin,xmax,NI+2)'; 

% Armo la matriz de 5x5, no se depejaba el valor 0
dp1=[(2-h^2); (1-h^2)*ones(NI-1,1)] % vector 2-h^2 1-h2^2 1-h^2 1-h^2 1-h^2
d0=-2*ones(NI+1,1);  % diagonal de -2
dn1=ones(NI,1);
M=diag(d0)+diag(dp1,1)+diag(dn1,-1); % diag(d,1) es la supradiag, diag(d, -1) es la infradiag

b=h^2*ones(NI+1,1);  
b(end) = h^2-(1-h^2)*ymax; % con ymax=f(1) = 1 es -1+2h^2

ysimi=M\b % inv(M)*b; % bpuntos intermedios incluyendo la frontera izquierda
ysim=[ysimi;  ymax];

yex = @(x) 2*( (e.^x + e.^(-x))/(e+e^(-1)) )-1; % sn exacta 

plot(x, ysim, '*', x , yex(x),'-r')

error_ = norm(yex(x)-ysim, 'inf') % max(abs(yex(x)-ysim))  Norma infinita