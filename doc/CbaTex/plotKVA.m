tic;
load('kva');
plot(1:15,mean(kva(1:15,2:81)')','--',1:15,kva(1:15,1));
legend('pBest (média)','gBest'); % fontName and FontSize!
xlabel('Gerações', 'FontSize', 20, 'FontName', 'Times')
ylabel('Perdas (kVA)', 'FontSize', 20, 'FontName', 'Times')
%AXIS  % fontName and FontSize!
%SCATTER
pause;
% tightInset = get(gca, 'TightInset');
% position(1) = tightInset(1);
% position(2) = tightInset(2);
% position(3) = 1 - tightInset(1) - tightInset(3);
% position(4) = 1 - tightInset(2) - tightInset(4);
% set(gca, 'Position', position);
print -painters -dpdf -r300 whatismyname.pdf;
clear;
toc;