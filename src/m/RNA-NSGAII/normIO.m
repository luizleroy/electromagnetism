function [x_normal, mins, maxs] = normIO(x_full)
%% this function normalization input for this tecnical:
%my method normalization
% deslocamento no eixo para o ponto O;
%|----|----|----|----|----|...|----|
%    -3   -2    -1   0    1  ...   5    

[l,c] = size(x_full);

x_normal = zeros(l,c);
for k=1:l
    minValue = min(x_full(k,:));
    mins(k)=minValue;
    x_normal(k,:) = x_full(k,:) - minValue;
    maxValue = max(x_normal(k,:));
    x_normal(k,:) = x_normal(k,:)/(maxValue);
    maxs(k) = maxValue;
end
%FIXME: versão original para analisar depois...
% function [x_norma]=Normaliza(x_bruto,X)
% [n_entradas,n_amostras]=size(x_bruto);
%         for k=1:n_entradas
%             x_norma(k,:) = interp1(X{k},[0 1],x_bruto(k,:));
%         end
% end