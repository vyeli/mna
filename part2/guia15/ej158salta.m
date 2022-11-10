clear all, clc, close all; 

xmin = 0; 
xmax = 1; 
H = [0.2 0.1 0.05 0.025 0.0125];
alpha=2; 

y_exacta = cosh(0)/cosh(alpha); 

for k=1:1:length(H)
  NI = (1/H(k))-1;
  M=sparse(NI+1,NI+1); 
  d1=ones(NI+1,1); 
  d0=d1*(-1)*(((alpha^2)*(H(k)^2))+2); 
  d_1= ones(NI+1,1); 
  d_1(NI)=2;
  B=[d_1 d0 d1]; 
  M=spdiags(B,-1:1,NI+1,NI+1); 
  b=[-1 ; zeros(NI,1)];  
  respuesta = M\b; 
  error(k) = abs(respuesta(NI+1)-y_exacta); 
    
endfor

 plot(H,error,'rx'); 
 


