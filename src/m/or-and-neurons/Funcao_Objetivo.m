% fun�o respons�vel por popular S_k, ou seja os indiv�duos uniciais, para a
% otimiza��o
%F: armazena todos os valores de fun��o objetivo para um determinado
%conjunto de valores candidatos a solu��o
%S_k: conjunto de nove pesos por n�mero de solu��es candidatas por itera��o
function [ F ] = Funcao_Objetivo(S_k)
[L C] = size(S_k);
for i=1:L
    F(i) = fitness14(S_k(i,:));
end
end

