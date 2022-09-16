% Usado para hacer scripting

format long


#Para gauss 
rref

#Para normalizar un vector
vnorm = v/norm(v)

[U S V] = svd(B, "econ")


#Lineal y=a1x+a0
X = [1, 2 ,3 ,4 ,5]';
b = [2.1, 3.9, 4.2, 5.5, 6.9]';
A = [ones(size(X)) X];
p = pinv(A)*b

#Cuadratica y = a2X^2 + a1*x + a0
X = [1, 2 ,3 ,4 ,5]';
X2 = X.^2;
b = [1.1, 3.9, 8.8, 15.5, 23]';
A = [ones(size(X)) X X2];
p = pinv(A)*b

#Parcial 2021
M=gallery("dramadah", 9)
[P D] = eig(M) # Como esto me da los numeros complejos hago otra cosa
[U S V] = svd(M)
#Me hago los productos de la diagonal que son los valores singulares dos veces
function [d] = prod(A)
  x = A(1, 1) * A(1,1);
  n = length(A);
  for i=2:n
    x = x * A(i,i)^2;
  endfor
  d = x;
endfunction;


# inv(A)*B = A\B

#Punto B
A = [1 1 1 1 1 ; 0 0 0 0 0; -1 -1 -1 -1 -1; 0 0 0 0 0; 1 1 1 1 1; -1 -1 -1 -1 -1; 0 0 0 0 0];
[U S V] = svd(A);
err = 1e-16;
rank = 0;
i = 1;
while S(i,1) > err
  rank += 1;
  i++;
end
rank







