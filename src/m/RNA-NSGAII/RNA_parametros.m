function [p]=RNA_parametros()

p=struct('p_trein',0.70,... %original 0.7
         'n_neur',[13 100 100 100 50 1],...
         'n_outliers',0);%FIXME
p.n_camadas = length(p.n_neur);