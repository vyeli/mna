clear all ; close all; clc

x0 = 0;
xf = 1;

NI = 5;       # Nodos internos
h = (xf-x0)/(NI+1);  # 1/40

diagSup = ones(NI, 1)*(1+h);
diagInf = ones(NI, 1)*(1-h);
diag = ones(NI, 1)*(-2);

M = spdiags([diagInf diag diagSup], -1:1, NI, NI);
b = [-10*h.^3-1+h];

for i=2:NI
  b(i,1) = -10*i*h.^3;
endfor

Faprox = M\b

b

Faprox((NI+1)/2) #6/2 = 3 la posicion 3 del la respuesta esta en la posicion 5 en la recta
