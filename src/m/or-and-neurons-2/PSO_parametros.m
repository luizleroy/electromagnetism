function [p]=PSO_parametros()
p=struct('C',[1 0.6],...   % constantes para pbest e gbest, respecitivamente
         'W',[0.1 0.9],... % peso minimo e maximo para as iteracoes
         'n_part',200,...   % numero de particulas
         'iter_max',500,...% numero maximo de iteracoes
         'n_var', 9,...
         'p_mut',0.08);    % percentual de operador de diversidade
