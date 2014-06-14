clear;
clc;

%ObjectiveFunction = @fitness;
%[x,fval] = fminsearch(ObjectiveFunction,[0;0;0;0;0;0]);

[s_gbest,gbest,d,media]=PSO_gbests();
