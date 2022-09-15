function X=PLUSOLVE(L,U,P,B)
  [m n]=size(B);
  pb = P*B;
  X=zeros(size(B));
  for i = 1:n
    yi = FSUB(L, pb (:, i));
    xi = BSUB (U, yi);
    X (:, i) = xi;
  endfor
endfunction


#{

function X = LUSOLVE (A, B)
[L,U,P]=PLUD(A);
 k=size(B,2);
 pb = P*B;
 X=zeros(size(B));
 for i = 1:k
 yi = FSUB (L, pb (:, i));
 xi = BSUB (U, yi);
 X (:, i) = xi;
 endfor
endfunction 

}#