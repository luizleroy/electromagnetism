%fun��o mono-objetivo: mapear todo o estado para 1 valor correlacionado
%com as medidas atrav�s da rede neural

function [ff]=FF(x)
%valor rand�mico dos pesos!
%w = rand(length(x),1);
w = [0.4211;
    0.0568;
    0.5857;
    0.1742;
    0.7286;
    0.5343];
display('valor rand�mico dos pesos!');
display(w);
% z = h_ann(x);
% ff = z;
%display(x);
ff = sum(x.*w);
%%%%%%%%%%%%%J = (z - h)'*Rminus1*(z-h);
end
