tic;clear;
close all;
%adicionando path c/ código global
ph = path;
myPh = ph(1:35);
%Factroy Test
factest = [myPh,'\FACTEST'];
addpath(factest);
%KANGAL NSGAII
pso = [myPh,'\PSO'];
addpath(pso);
clear ph myPh factest pso

%rng('default');
n_part=500;
iter_max=500;

% s{8} = 'ESPHERE';
% s{9} = 'SCHWEFEL_2';
for i = 1:length(s)
    display(s{i});
    ObjFunc = INITIALIZE(s{i});
    best = PSO(ObjFunc, n_part, iter_max)
    result = TestFunction_MONO(best,s{i})
    toc;
end