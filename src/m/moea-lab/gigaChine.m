clear; close all;
rng('default');

a=-2; b=2;
pop = 1000;
x = a + (b-a).*rand(pop,2);

f(:,1)=x(:,1).^2+x(:,2).^2;
f(:,2)=(x(:,1)-1).^2+x(:,2).^2;

subplot(2,1,1);
%plot(x(:,1),x(:,2),'*');
plot(f(:,1),f(:,2),'.');

subplot(2,1,2);

maxf1 = max(f(:,1));
maxf2 = max(f(:,2));

d = f;
for i=1:pop
    for j=1:pop % é possível otimizar? Sem fazer o produto cruzado, e sim combinação 2 a 2?
        if dominioV1(f(i,:),f(j,:))
            d(j,:) = [maxf1,maxf2];
        end
    end
end

plot(d(:,1),d(:,2),'.r');
hold on
plot(maxf1,maxf2,'^r');