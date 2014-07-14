function [x_trein,y_trein,x_valid,y_valid]=RNA_classifica(x_norma,y_norma,p_trein)

[~,n_amostras]=size(x_norma);

indices=randperm(n_amostras);
n_amostras_trein=floor(p_trein*n_amostras);
ind_trein=indices(1:n_amostras_trein);
ind_valid=indices(n_amostras_trein+1:n_amostras);

x_trein=x_norma(:,ind_trein);
y_trein=y_norma(:,ind_trein);
x_valid=x_norma(:,ind_valid);
y_valid=y_norma(:,ind_valid);