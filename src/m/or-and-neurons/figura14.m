%Toploliga final da rede com neurônios OR AND
function [ y ] = figura14( x1,x2,x3,x4, w1, w2, u1, u2, u3, v1, v2, l1, l2 )
% neuronio OR com duas entradas
w = n_or(w1,w2, not(x4), not(x2));
%neuronio and com três entradas
u = n_and3(u1,u2,u3, x1, x3, w);
%neuronio and com duas entradas
v = n_and(v1, v2, not(x1), not(x3));
%neuronio or com duas entradas
y = n_or(l1,l2, v, u);
end


%TOpologia figura 14:
%w armazena not(x4) or not(x2)
%u armazena resultado de w and x1 and x3
%v armazena not x1 and not x3
%y, resultado final, armazena V or U