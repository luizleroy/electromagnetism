function [ F ] = Funcao_Objetivo(S_k)
[L C] = size(S_k);
for i=1:L
    F(i) = fitness14(S_k(i,:));
end
end

