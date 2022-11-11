Fex = @(x) 2*(e^x)-x-1;

x0 = 0;
xf = 3;
NI = [5 20];
errors = [];

y0 = 1;

Fimpl = [];

for i=1:length(NI)
  Fimpl = [y0];
  h = (xf - x0)/(NI(i) + 1);
  X = [x0:h:xf];
  
  for j=2:NI(i)+2
    Fimpl = [Fimpl Fimpl(j-1)*(1+h)+h];
  endfor
  
  plot(X, Fimpl, 'o-');
  
  if i==1
    hold on;
  endif
  
  errors(i) = abs(Fex(1)-Fimpl((1/h) + 1));
  
endfor

hDif = (xf/(NI(end-1)+1))/(xf/(NI(end)+1))
errDif = (errors(end)/errors(end-1))

fplot(Fex, [0 3]);
hold off;
