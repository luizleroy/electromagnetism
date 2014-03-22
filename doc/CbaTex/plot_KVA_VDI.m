tic;
kva_vdi = [
0
];
[tam ~] = size(kva_vdi);
plot(1:tam,max(kva_vdi'),'-*r', 1:tam,mean(kva_vdi'),'-+b', 1:tam,kva_vdi(:,1), '-vg');
legend('pBest (max)', 'pBest (med)', 'gBest');
xlabel('Gerações', 'FontSize', 20, 'FontName', 'Times')
ylabel('0.55 * |Perdas (kVA)| + 0.45 * |VDI|', 'FontSize', 20, 'FontName', 'Times')
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