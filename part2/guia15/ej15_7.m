%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve por un esquema de segundo orden la ecuación
%          y'=xy
%          en el intervalo [xmin;xmax]
%    con las condiciones de borde y(0)=1; y(infinito)=0
%    se  utiliza un esquema centrado de segundo orden; con NI puntos interiores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc
xmin=0;
xmax=1;
ymin=0.35503;		% y(0)=1
ymax=0; 	% y(infinito)=0
NI=4;
h=(xmax-xmin)/(NI+1)  #Para calcular el tamano del h
x=linspace(xmin,xmax,NI+2)'; #Comando linear space para crear un vector de [xmin;xmax] igualmente espaciados por NI+2, notemos que lo ponemos parado

% Armo la matriz de a diagonales
dp1=ones(NI-1,1); #Retorna una matriz de NI-1 * 1 de todo 1 lo usamos para la diagonal superior e inferior en este ejercicio
d0=-(2+h^2*x(2:end-1)); #Arma la diagonal que es h^2*xi siendo xi los nodos internos
M=diag(d0)+diag(dp1,1)+diag(dp1,-1); % diag(d,1) es la supradiag, diag(d, -1) es la infradiag

#Pongo la matriz B 
b=zeros(NI,1);
b(1)=-ymin;
b(end)=-ymax;

#Resuelvo el sistema y me guardo los resultados en ysimi
ysimi=inv(M)*b % puntos intermedios 
ysim=[ymin; ysimi;  ymax];

yex=airy(0, x); % sn exacta 

plot(x, ysim, '*', x , yex,'-r')
legend('Aprox', 'Exacta')