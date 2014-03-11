function [ output_args ] = myPlot( x1,y1,x2,y2 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

tic;
plot(x1,y1,x2,y2);
%TITLE, XLABEL, YLABEL, AXIS, AXES, HOLD, LEGEND, SUBPLOT, 
%SCATTER/
pause;
tightInset = get(gca, 'TightInset');
position(1) = tightInset(1);
position(2) = tightInset(2);
position(3) = 1 - tightInset(1) - tightInset(3);
position(4) = 1 - tightInset(2) - tightInset(4);
set(gca, 'Position', position);
print -painters -dpdf -r300 whatismyname.pdf;
clear;
toc; % print end?

end