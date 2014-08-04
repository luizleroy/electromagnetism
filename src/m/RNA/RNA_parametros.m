function [p]=RNA_parametros()

p=struct('p_trein',0.70,... %original 0.7
         'n_neur',[13 100 100 100 50 1],...
         'n_outliers',0);%FIXME
p.n_camadas = length(p.n_neur);
n_var = 0;
for k=1:rna.n_camadas-1
   n_var=n_var + p.n_neur(k+1)*(1+p.n_neur(k));
end
p.dim = n_var;