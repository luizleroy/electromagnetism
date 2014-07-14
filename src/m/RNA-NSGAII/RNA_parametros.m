function [p]=RNA_parametros()

p=struct('n_pso', 0,... % parametro novo: "ajuste fino do PSO" by LuizLeRoy ACEITÁVEL: 10
         'p_trein',0.9,... %original 0.7
         'n_neur',[1 10 1],... %original 6 3 1
         'f_erro','MSE',... origninal MSE
         'n_outliers',0);%FIXME
         %original 300 samples / LEMBREM-SE: ordem de grandeza rede real: 5000 consumidores medidos
p.n_camadas = length(p.n_neur);