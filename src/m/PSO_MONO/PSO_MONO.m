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
n_part=299;
iter_max=300;

s{1} = 'SPHERE';
s{2} = 'SCHWEFEL_2';
% s{3} = 'POL';
% s{4} = 'KUR';
% s{5} = 'ZDT1';
% s{6} = 'ZDT2';
% s{7} = 'ZDT3';
% s{8} = 'ZDT6';
% s{9} = 'ZDT4';
for i = 1:length(s)
    display(s{i});
    ObjFunc = INITIALIZE(s{i});
    best = PSO(ObjFunc, n_part, iter_max)
    result = TestFunction_MONO(best,s{i})
    toc;
end