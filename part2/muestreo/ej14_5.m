#Ej 14.5
clear all;
clc


#x(t) => se la representa como xn=x(t)*n/fs con fs = 2*fmax 
#xn=sin(450*pi*n/fs)+3*sin(1450*pi*n/fs)
#x(t)=sin(450*pi*t)+3*sin(1450*pi*t)  Ts=1/fs >> Ts=(0:n)./fs
#xn=sin(450*pi*Ts)+3*sin(1450*pi*Ts)

#x(t)=sin(450*pi*t)+3*sin(1450*pi*t)

t=0:0.001:1;
xt=sin(450*pi*t)+3*sin(1450*pi*t);
subplot(2,1,1), plot(t,xt,'b','LineWidth',3)
grid on
