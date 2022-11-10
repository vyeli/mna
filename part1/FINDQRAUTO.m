#{
Conocidos los autovalores de A, se puede estimar los autovectores de A
con el metodo de las potencias inversa que esta
#}

function B = FINDQRAUTO (A, tol, max_iter)
    n=size(A,1);
    B=zeros(size(A));
    for i =1:n
        s=A(i,i);
        [v, lambda, niter] = ISPOWER(A, ones(n,1), s, tol, max_iter);
        B(:,i)=v;
    endfor
endfunction
