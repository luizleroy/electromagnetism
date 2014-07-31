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
clc;

%rng('default');
 
ObjFunc = INITIALIZE('SPHERE');
n_part=100;
iter_max=100;
best = PSO(ObjFunc, n_part, iter_max);
TestFunction_MONO(best,'SPHERE')