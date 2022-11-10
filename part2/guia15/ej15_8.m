% BVP 
xmin = 0; 
xmax = 1; 
NI = 4 		% Puntos internos 
h = (xmax-xmin)/(NI+1) % paso

y0 = 1; 
ypL=0; % y'(1)=0
alpha=4;
x = linspace(xmin, xmax, NI+2)

% genero la Matriz

d0 = -(2+alpha*(h^2)*ones(NI+1,1)); 
diagsup= ones(NI,1);
diaginf = diagsup; 
diaginf(end)=2; 
M = diag(diaginf, -1)+diag(d0)+diag(diagsup,1)

% genero b
b = zeros(NI+1,1);
b(1)= -y0;

% vector de incognitas  

yi=M\b; 
disp('Solución aproximada y0, y1 ... yNI+1');
y = [y0; yi] % valor que tiene la funcion en los puntos de mi dominio

yex = @(x) cosh(sqrt(alpha)*(1-x))/cosh(sqrt(alpha)); % sn analitica

error = [0];

for i=1:NI
  error = [error ; abs(y(i) - yex(i*h))];
endfor

#disp('error en cada punto del intervalo')
#[x' abs(y-yex')]
#plot(x, y, '*', x , yex,'-r')
#legend('Aprox', 'Exacta')