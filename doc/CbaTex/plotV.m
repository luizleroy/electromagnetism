tic;
%fase B (com min value)
plot(1:2499,vc,'*b',1:2499,vo,'.r');

title('An�lise da Fase B');
legend('COM aloca��o de capacitores','SEM aloca��o de capacitores');
xlabel('Barras em ordem decrescente de n�vel de tens�o');
ylabel('Tens�o (pu)');

% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Times');
set(0,'DefaultAxesFontSize', 20);
% Change default text fonts.
set(0,'DefaultTextFontname', 'Times');
set(0,'DefaultTextFontSize', 20);

% tightInset = get(gca, 'TightInset');
% position(1) = tightInset(1);
% position(2) = tightInset(2);
% position(3) = 1 - tightInset(1) - tightInset(3);
% position(4) = 1 - tightInset(2) - tightInset(4);
% set(gca, 'Position', position);
print -painters -dpdf -r300 whatismyname.pdf;
toc;

