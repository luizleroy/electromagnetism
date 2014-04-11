function [ V_k, S_k ] = pso_inicializacao(n_part, x, S_lim, V_lim)
lx = length(x);
V_k = zeros(length(x),n_part);
S_k = V_k;

% matriz que cont�m as linhas com a primeira vari�vel do ponto PSO
% matriz que cont�m as colunas com cada ponto PSO

for c = 1:n_part
    S_k(:,c)=S_lim(:,1) + (S_lim(:,2)-S_lim(:,1)).*rand(lx,1);
    V_k(:,c)=S_lim(:,1) + (V_lim(:,2)-V_lim(:,1)).*rand(lx,1);
end

%TODO: ESTUDAR SE ESTA MULTIPLICA��O MATRICIAL VIOLA PRINC�PIOS
%ESTAT�STICOS: e tamb�m se deve-se ter n�meros imagin�rios aleat�rios em
%rela��o � n�meros reais...

end

