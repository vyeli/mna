%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Este script evalúa la diferencia entre la derivada obtenida por DF y la
%    exacta, en función del tamaño del paso de discretización
%    Se evalúa un esquema progresivo (Fordward) , regresivo (Backward) 
%    y centrado 


clear all ; close all; clc
xmax=4; % 
Nmax=35; % nodos internos

Fun = @(x) exp(-x).*sin(3*x); 
dFun = @(x) -exp(-x).*sin(3*x)+ 3*exp(-x).*cos(3*x);

x=linspace(0,xmax,Nmax+1);
F=Fun(x);
h=x(2)-x(1); %calculo el paso

% Método de las Diferencias Centradas 
xCentral=x(2:end-1);
dFCenteral=(F(3:end)-F(1:end-2))/(2*h);  % (f(n+1) - f(n-1))/2

% Método de las Diferencias Progresivas
xForward=x(1:end-1);
dFForward=(F(2:end)-F(1:end-1))/h;

% Método de las Diferencias Regresivas
xBackward=x(2:end);
dFBackward=(F(2:end)-F(1:end-1))/h;

% Método de las Diferencias con 4 puntos 
a = -1/3;
b = -1/2;
c = 1;
d = -1/6;

xFourPoints=x(2:end-2); % a*f(n-1) + b*f(n) + c*f(n+1) + d*f(n+2)
dFFourPoints=(a*F(1:end-3)+ b*F(2:end-2) + c*F(3:end-1) + d*F(4:end))/h; 
plot(x,dFun(x));
hold on
plot(xCentral,dFCenteral,'r')
plot(xForward,dFForward,'k');
plot(xBackward,dFBackward,'g');
plot(xFourPoints,dFFourPoints,'b');
legend('Analytic','Centred','Forward','Backward', 'Four Points')
hold off;

x0=2;
dh=2*xmax/Nmax;
F0=Fun(x0);
dF0=dFun(x0);
Fordward=[];
Backward=[];
Centred=[];
FourPoints=[];
hh=2*dh;
h=[];
fprintf('      h,       Analitica   ,    Fordward   ,   Backward   ,    Centred\n')

for i=1:Nmax;
    hh=hh/2;
    fw = (Fun(x0+hh)-F0);
    fb =(-Fun(x0-hh)+F0);
    fc = (Fun(x0+hh)-Fun(x0-hh));
    fp = (a * Fun(x0-hh) + b * F0 + c * Fun(x0+hh) + d * Fun(x0+2*hh) )
  Fordward=[Fordward abs((fw/hh-dF0))];
  Backward=[Backward abs((fb/hh-dF0))];
  Centred =[Centred abs((fc/(2*hh)-dF0))];
  FourPoints=[FourPoints abs(fp/hh-dF0)];
    h=[h hh];
  fprintf(' %1.6e, %1.6e, %1.6e, %1.6e, %1.6e\n',hh, dF0, abs((fw/hh-dF0)/dF0), ...
  abs((fb/hh-dF0)/dF0), abs((fc/(2*hh)-dF0)/dF0))
endfor

figure 2, loglog(h, Fordward, '-r',h,  Backward, '-g', h, Centred, '-b',h,FourPoints, '-c');
legend('Forward','Backward', 'Centred', 'Four Points')