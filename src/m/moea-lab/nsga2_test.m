%% Test Function
% Summary of example objective: generate tests for nsga_2.m (by Deb group at all)

%% We choose many problems:

% *Fonseca and Fleming’s study (FON),
% *Poloni’s study (POL) and
% *Kursawe’s study (KUR).
% Zitzler et al. followed those guidelines and suggested six test problems. 
% We choose five of those
% seven problems here and counting...
%SCH  -> dificult for big space! "Schaffer"
%FON  -> nonconvex "Fonseca and Flaming"
%POL  -> disconected "Poloni"
%KUR  -> disconected "Kursawe"
%ZDT1 -> "Zitzler–Deb–Thiele"
%ZDT2 -> "Zitzler–Deb–Thiele"
%ZDT3 -> disconected "Zitzler–Deb–Thiele"
%ZDT4 -> TERRIFIC "Zitzler–Deb–Thiele"
%ZDT6 -> "Zitzler–Deb–Thiele"

%my
%SPHERES contínua

%rng('default');
clear;
tic;
pop = 120;
gen = 1100;
nsga_2('ZDT6',pop,gen);
toc;
%figure;
%nsga_2('SPHERES',pop,gen);
%toc;

%print -painters -dpdf SCH.pdf
