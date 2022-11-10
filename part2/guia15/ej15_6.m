%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Se resuelve la ecuación
%          y''+b*y'+w^2*y=0
%          en el intervalo [xmin;xmax]
%    con las condicion inicial y(xmin)=1; 
%    se usa una aprxomicaion progresiva de la derivada 
%    con NI puntos interiores
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all ; close all; clc
#Intervalo de la t (aca lo pusimos como x)
xmin=0;
xmax=2*pi;

ymin=[1;0]; %Condiciones iniciales (tenemos un vector parado de 1 = y0
                                                              # 0 = u0

#Datos w y b
w = 2*pi;
b = 0
A=[0 1; -w**2 -b];

h=0.001
NI=(xmax-xmin)/h - 1 % puntos interiores 

yex= @(x) exp(0.5*(-b)*x).*cos(w*x); 
yex_2pi=yex(xmax)  #Esto es lo que voy a comparar con la aproximacion

Id = eye(size(A)); % identidad 

% Implícito
yi=ymin;
ysimi=[yi];
autovalores = abs(eig(Id - h*A)); #Para ver si converge
autovalores

for i=0:NI  
   yip1=inv(Id - h*A)*yi; #Esta es la formula que nos quedo yn+1 = (Id-h*A)^-1*yn  
   ysimi=[ysimi yip1];   #Voy concatenando los resultados como columnas de una matriz que tiene 2 filas (los resultados son vectores de 2x1)
   yi=yip1; #Aca actualizamos con yn para que en la iteracion siguiente se use el valor anterior
endfor  
ysimi_last = ysimi(:,end)(1) #Con esto estamos yendo a la ultima iteracion acumulada y saco solo el primer elemento de la fila 1 osea [a;b] saco el a
error = abs((yex_2pi-ysimi_last))

% Explícito
yi=ymin;
ysimi=[yi];
autovaloresExp = abs(eig(Id + h*A)); #Para ver si converge
autovaloresExp
for i=0:NI
   yip1=(Id+A*h)*yi;
   ysimi=[ysimi yip1];
   yi=yip1;
endfor  
ysimi_last = ysimi(:,end)(1)
error = abs((yex_2pi-ysimi_last))

% Crank-nicolson
yi=ymin;
ysimi=[yi];
autovaloresCN = abs(eig(inv((Id - A*h/2))*(Id + A*h/2))); #Para ver si converge
autovaloresCN
for i=0:NI
   yip1=inv((Id - A*h/2))*(Id + A*h/2)*yi;
   ysimi=[ysimi yip1];
   yi=yip1;
endfor 
ysimi_last = ysimi(:,end)(1)
error = abs((yex_2pi-ysimi_last))