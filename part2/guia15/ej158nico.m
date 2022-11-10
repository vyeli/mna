clear all, clc, close all;

Xmin = 0;
Xmax = 1;
Ymin = 1;

H = [0.5 0.2];
alpha = 2;

err = [];
Bdiag = [];

Fex = cosh(0)/cosh(alpha);

for i=1:1:length(H)
  N = 1/H(i);
  M = sparse(N,N);
  
  diagSup = ones(N, 1);
  diagInf = diagSup;
  diagInf(end-1) = 2;
  diag = diagSup * (-1) * (((alpha^2)*(H(i)^2))+2);
  
  B = [diagInf diag diagSup];
  M = spdiags(B, -1:1, N, N);
  b = [-Ymin; zeros(N-1, 1)];
  
  Faprox = [Ymin; M\b];
  X = [Xmin:H(i):Xmax];
  plot(X, Faprox, 'o-');
  if(i == 1)
    hold on;
  endif
  
  err(i,1) = abs(Faprox(N+1)-Fex);
  err(i,2) = H(i);
endfor


Yex = @(x) cosh(alpha*(1-x))/cosh(alpha);
fplot(Yex, [0 1]);
hold off;