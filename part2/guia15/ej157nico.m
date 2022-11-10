clear all ; close all; clc

Xmin = 0;
Xmax = 1000;

Ymin = 0.35503;
Ymax = 0;

N = 10000;
Bj = [];

err = [];
hs = [];

for i=1:300
  h = (Xmax*i)./(N+1);
  X = [Xmin:h:(Xmax*i)];
  
  for j=1:N
    Bj(j,1) = -2-X(j)*(h.^2);
  endfor
  
  B = [ones(N, 1) Bj ones(N, 1)];
  M = spdiags(B, [-1 0 1], N, N);
  b = [-Ymin; zeros(N-1,1)];
  
  Yn=[Ymin ; M\b ; Ymax];
  
  err = [err norm(Yn'-airy(0,X), inf)];
  hs = [hs h];
  
endfor

loglog(hs, err);
xlabel('Valor de h');
ylabel('Error');
title('Error en función del valor de H');
hold on;
plot(hs(11), err(11), 'x');
text(hs(51), err(51), 'o');
hold off;