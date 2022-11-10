clear all; 
w=2*pi; 
beta=0; 
for exp=3:6
  h=10^(-exp); 
  iniciales=[1;0]; 
  A=[0 1; -w^2 -beta];
  t=0:h:2*pi; 

  current=iniciales; 
  ide=eye(size(A)); 
  aprox=zeros(2,size(t)); 
  aprox(:,1)=iniciales; 
  matrix=inv((ide- A*h/2))*(ide+A*h/2); 
  autovalores = abs(eig(matrix)); 

  
  for i=1:(2*pi/h)
    next = matrix*current;
    aprox(:,i+1)=next; 
    current=next; 
  endfor
  subplot(3,1,exp);hold on; 
  sti=sprintf('Exponente %d',exp);
  title(sti); 
  plot(t,aprox(1,:),'k'); 
  realt=(0:.001:2*pi); 
  yreal= (e.^(realt*(-beta/2))).*(cos(w*realt)); 
  plot(realt,yreal,'b'); 
  legend('Explicit','Exact'); 
  hold off; 
  
endfor
