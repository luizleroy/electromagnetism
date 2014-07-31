%% Test Function
% Summary of example objective: generate tests for nsga_2.m (by Deb group at all)

%We choose many problems:

% *Fonseca and Fleming’s study (FON),
% *Poloni’s study (POL) and
% *Kursawe’s study (KUR).
% Zitzler et al. followed those guidelines and suggested six test problems. 
% We choose five of those
% seven problems here and counting...
%SPHERES ->
%SCH  -> dificult for big space! "Schaffer"
%FON  -> nonconvex "Fonseca and Flaming"
%POL  -> disconected "Poloni"
%KUR  -> disconected "Kursawe"
%ZDT1 -> "Zitzler–Deb–Thiele"
%ZDT2 -> "Zitzler–Deb–Thiele"
%ZDT3 -> disconected "Zitzler–Deb–Thiele"
%ZDT4 -> TERRIFIC "Zitzler–Deb–Thiele"
%ZDT6 -> "Zitzler–Deb–Thiele"

tic;clear;
close all;
%adicionando path c/ código global
ph = path;
myPh = ph(1:35);
%Factroy Test
factest = [myPh,'\FACTEST'];
addpath(factest);
%KANGAL NSGAII
kangal = [myPh,'\KANGAL'];
addpath(kangal);
clear ph myPh factest kangal
clc;

rng('default');

pop = 50;
gen = 300;
s{1} = 'SCH'; %
s{2} = 'SPHERES'; %FON
% s{3} = 'POL';
% s{4} = 'KUR';
% s{5} = 'ZDT1';
% s{6} = 'ZDT2';
% s{7} = 'ZDT3';
% s{8} = 'ZDT6';
% s{9} = 'ZDT4';
for i = 1:length(s)
    subplot(2,1,i);
    ObjFunc = INITIALIZE(s{i});
    chro = KANGAL_nsga_2(ObjFunc,pop,gen);
    
    %% Result
    % Save the result in ASCII text format.
    %save solution.txt chromosome -ASCII
    
    %% Visualize
    % The following is used to visualize the result if objective space
    % dimension is visualizable.
    plot(chro(:,ObjFunc.dim + 1),chro(:,ObjFunc.dim + 2),'ok','MarkerFaceColor','b');
    title(s{i});
    xlabel('f_1(x)') % x-axis label
    ylabel('f_2(x)') % y-axis label
    toc;
end