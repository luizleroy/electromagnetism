function [p]=PSO_parametros()
p=struct('C',[1 0.6],...   % constantes para pbest e gbest, respecitivamente
         'W',[0.1 1.1],... % peso minimo e maximo para as iteracoes
         'n_part',200,...   % numero de particulas 200
         'iter_max',100,...% numero maximo de iteracoes 100
         'p_mut',0.01);    % percentual de operador de diversidade
