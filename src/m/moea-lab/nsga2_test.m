%% Test Function
% Summary of example objective: generate tests for nsga_2.m (by Deb group at all)

%% We choose many problems:

% *Fonseca and Fleming’s study (FON),
% *Poloni’s study (POL) and
% *Kursawe’s study (KUR).
% Zitzler et al. followed those guidelines and suggested six test problems. 
% We choose five of those
% seven problems here and counting...
%SCH  -> Schaffer's study is a convex and continum function in the objective space
%FON  -> nonconvex 
%POL  -> nonconvex and disconected
%KUR  -> nonconvex
%ZDT1 
%ZDT4 -> therrifc function: não convexa, discontinua ??????
%ZDT6

%my
%SPHERES -> with dim=100!

%% Section Principal: evaluate metrics
% TIME
% NICHO (?)

%rng('default');
clear;
tic;
pop = 150;
gen = 3000;
nsga_2('ZDT4',pop,gen);
toc;
%figure;
%nsga_2('SPHERES',pop,gen);
%toc;

%print -painters -dpdf SCH.pdf
