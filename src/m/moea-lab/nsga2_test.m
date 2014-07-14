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

rng('default');
clear;
close all;
tic;
pop = 75; %100
gen = 6000; %5000
s{1} = 'SCH';
s{2} = 'FON';
s{3} = 'POL';
s{4} = 'KUR';
s{5} = 'ZDT1';
s{6} = 'ZDT2';
s{7} = 'ZDT3';
s{8} = 'ZDT6';
%s{9} = 'ZDT4';
for i = 1:length(s)
    subplot(4,2,i);
    nsga_2(s{i},pop,gen);
    toc;
end
% subplot(5,2,10);
% hist(randn(10000,1),100)
