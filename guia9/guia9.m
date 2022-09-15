#EJ2
A=[1 -1 0; 2 4 -2; 0 -1 1];

B=[-5 3 -3; -3 1 9; -3 3 -11];


x0=[1;-0.5;1];

[v, l, niter] = APOWER(A, x0, tol=1e-10, n=1000);

[P D] = eig(A);  #matriz de paso con col autovectores

#Para el de menor modulo
[v, l, niter] = ISPOWER(A, x0, s=0, tol=1e-10, n=1000);


#Ej8 calcular con QR

