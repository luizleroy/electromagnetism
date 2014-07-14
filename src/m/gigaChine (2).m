clear; close all; tic;
%rng('default');

display('Popula��o (cuidado: a an�lise for�a bruta cresce com o quadrado do valor!)')
pop = 1200

func = 'ZDT1';
f = functionTable(pop, func);

subplot(2,1,1);
set(0,'DefaultTextFontSize', 20);
plot(f(:,1),f(:,2),'.');

subplot(2,1,2);
title('TESTANDO');

maxf1 = max(f(:,1));
maxf2 = max(f(:,2));

d = f;
for i=1:pop
    for j=1:pop % � poss�vel otimizar? Sem fazer o produto cruzado, e sim combina��o 2 a 2?
        if dominioV1(f(i,:),f(j,:))
            d(j,:) = [maxf1,maxf2];
        end
    end
end

plot(d(:,1),d(:,2),'.r');
hold on
plot(maxf1,maxf2,'^r');
toc;