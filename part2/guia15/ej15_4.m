#Ej15_4
clear all ; close all; clc
f= @(t) -e^(-t)+t^2-2*t+2;

sim = 0.648;

sim2=0.66951;

imp1=0.727;

imp2=0.708;

abs(f(0.4)-imp2)