clear;
% Main: arquivo principal para treinamento da rede

%método do matlab para otimização
%ObjectiveFunction = @fitness;
%[x,fval] = fminsearch(ObjectiveFunction,[0;0;0;0;0;0]);

[s_gbest,gbest,d,media]=PSO_gbests();
%retorna os valores da tabela verdade da figura 14. Se o treinamento for
%OK, vai ter o seguinte resultado:
%tb =

 % Columns 1 through 10

  %  1.0000    1.0000    0.0000    0.0000    1.0000    1.0000    0.0000    0.0000    0.0000    0.0000

  %Columns 11 through 16

   % 1.0000    1.0000    0.0000    0.0000    1.0000    0.0000
 [L , ~] = size(s_gbest);    
x = s_gbest(L,:);
[tb] = validacao(x)