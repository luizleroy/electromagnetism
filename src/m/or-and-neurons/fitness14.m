% O valor x de entrada contém um conjunto candidato de pesos...
%Error: é o valor MSE (mean squared error) da topologia da figura 14 do
%artigo do trabalho
function [ error ] = fitness14( x )
% nove pesos da topologia final
w1 = x(1); w2 = x(2);
u1 = x(3); u2 = x(4); u3 = x(5);
v1 = x(6); v2 = x(7);
l1 = x(8); l2 = x(9);
%cada "diff" abaixo representa a diferença entre a saída da rede (de
%figura14.m) e o valor de treinamento da tabela 1 (pag 639) do artigo
%principal...
diffs(1) = 1 - figura14( 0,0,0,0, w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(2) = 1 - figura14(0,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(3) = 0 - figura14(0,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(4) = 0 - figura14(0,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(5) = 1 - figura14(0,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(6) = 1 - figura14(0,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(7) = 0 - figura14(0,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(8) = 0 - figura14(0,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(9) = 0 - figura14(1,0,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(10) = 0 - figura14(1,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(11) = 1 - figura14(1,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(12) = 1 - figura14(1,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(13) = 0 - figura14(1,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(14) = 0 - figura14(1,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(15) = 1 - figura14(1,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(16) = 0 - figura14(1,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
%cálculo final do erro quadrático médito
error = sum(diffs.^2);
end

