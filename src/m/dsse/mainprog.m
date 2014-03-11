%this is the main state estimate program
clear all;
clc;
global nbus;
global nlines;
global nshunts;
global tolerance;

nbus=input('enter the number of buses.');
nlines=input('enter the number of lines.');
nshunts=input('enter the number of shunts.');
tolerance=input('enter the tolerance.');

disp('1:input data 2:run program\n');
choice=input('enter whether you want to enter data or run the program.\n');
if choice==1
    nbus=input('enter the number of buses.');
    nlines=input('enter the number of lines.');
    nshunts=input('enter the number of shunts.');
    tolerance=input('enter the tolerance.');
    dataentry(choice,nbus,nlines,nshunts,tolerance);
    %nbus=x(1);
    %nlines=x(2);
    %nshunts=x(3);
    %tolerance=x(4);
end
if choice==2
    programengine(choice,nbus,nlines,nshunts,tolerance);
end
%if choice==3
 %   viewoutput(choice);
 %end