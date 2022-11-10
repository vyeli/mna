# Ejercicio 15.5

function H = getMaxStep()
xmin=0; 
xmax=12;
y0=1000; % y(0) 
MAX_NI=100; % puntos interiores 
k=10000;
r0=0.294;
H=-1;

for NI=10:MAX_NI
   h=(xmax-xmin)/(NI+1); % calculo el paso 

   x=linspace(xmin,xmax,NI+1)';

   yi=y0;
   ysime=[yi];

   exacta = @(x) (k*y0*e^(r0*x))/(k+y0*(e^(r0*x)-1));

   % Explícito
   yi=y0;
   ysimi=[yi];
   for i=0:NI
      yip1=yi*(h*r0*(1-yi/k)+1);
      ysimi=[ysimi; yip1];
      yi=yip1;
   endfor 
 
   ysimi_t12 = ysimi(end);
   yex_t12=exacta(xmax); %(k*y0*e^(r0*xmax))/(k+y0*(e^(r0*xmax)-1));

   perc_relative_error = 100*abs((yex_t12-ysimi_t12)/yex_t12);
   
   if perc_relative_error < 1
     if h > H
       H = h;
     endif
   endif
endfor
endfunction