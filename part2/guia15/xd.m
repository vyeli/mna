clear all ; close all; clc


w = 2*pi;
b = 0.5;
A=[0 1; -w**2 -b];

ymin=[1;0];
yi=ymin;
ysimi=[yi];
yipl=[6;9];

ysimi=[ysimi yipl];
ysimi;


ysimi_last = ysimi(:,end)(1); 
ysimi_last;


x=0;
for exp=1:3
  x=x+1;
endfor

x;

xmin=0;
xmax=1;
ymin=0.35503;		% y(0)=1
ymax=0; 	% y(infinito)=0
NI=4;
h=(xmax-xmin)/(NI+1)
x=linspace(xmin,xmax,NI+2)';
x;
dp1=ones(NI-1,1);
dp1;


 