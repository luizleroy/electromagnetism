% funão responsável por popular S_k, ou seja os indivíduos uniciais, para a
% otimização
%F: armazena todos os valores de função objetivo para um determinado
%conjunto de valores candidatos a solução
%S_k: conjunto de nove pesos por número de soluções candidatas por iteração
function [ F ] = Funcao_Objetivo(S_k)
[L C] = size(S_k);
for i=1:L
    F(i) = fitness14(S_k(i,:));
end
end

