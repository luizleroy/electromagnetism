function [ V_k, S_k ] = pso_inicializacao(n_part, x, S_lim, V_lim)
lx = length(x);
V_k = zeros(length(x),n_part);
S_k = V_k;

% matriz que contém as linhas com a primeira variável do ponto PSO
% matriz que contém as colunas com cada ponto PSO

for c = 1:n_part
    S_k(:,c)=S_lim(:,1) + (S_lim(:,2)-S_lim(:,1)).*rand(lx,1);
    V_k(:,c)=S_lim(:,1) + (V_lim(:,2)-V_lim(:,1)).*rand(lx,1);
end

%TODO: ESTUDAR SE ESTA MULTIPLICAÇÃO MATRICIAL VIOLA PRINCÍPIOS
%ESTATÍSTICOS: e também se deve-se ter números imaginários aleatórios em
%relação à números reais...

end

