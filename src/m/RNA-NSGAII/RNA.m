function [s_gbest,x_trein,y_trein,x_valid,y_valid]=RNA(x,y)

%não é mais utilizado: carrega dados das amostras / ('BD.mat')

% carregamento de parametros da RNA
[rna]=RNA_parametros();

% normalizacao das entradas e saidas
%VEJA: decidi não trabalhar mais com normalização!!!
%JÁ GERO MINHA NUVEM DE TESTES NORMALIZADA!

% separacao dos dados em treinamento e validacao
[x_trein,y_trein,x_valid,y_valid]=RNA_classifica(x,y,rna.p_trein);

% calculo do numero de variaveis
n_var=0;
for k=1:rna.n_camadas-1
   n_var=n_var + rna.n_neur(k+1)*(1+rna.n_neur(k));
end

% VERIFICADO n_var = n_neur(1)*n_neur(2) + n_neur(2)*n_neur(3)... +
%                              n_neur(2) +           n_neur(3)...

% quantidade de vezes que o PSO executara. Cada vez, o retorno
% do PSO retorna 01 gbest. Os n_pso gbest sao as particulas
% iniciais de uma ultima execucao de PSO

%n_pso=100; %ORIGINAL: 10
%for z=1:n_pso
    z = 1 % apenas para acompanhar as execucoes
    [s_gbest,gbest,d]=PSO2(rna,n_var,x_trein,y_trein);
    s_gbest_pso(z,:)=s_gbest(end,:);
%end
display('Desempenho da otimização principal:');
gbestMax = max(gbest)
gbestMin = min(gbest)
gbestEND = gbest(end)
toc
% % % [s_gbest]=PSO(rna,n_var,x_trein,y_trein);

d2Plot = d;
gbest2Plot = gbest;

%TODO clear s_gbest gbest d

%"AJUSTE FINO"
for f = 1:rna.n_pso
f
[s_gbest,gbest,d]=PSO_gbests(rna,n_var,x_trein,y_trein,s_gbest_pso); % ultima execucao com particulas iniciais de gbests
[a,~] = size(s_gbest);
s_gbest_pso = [s_gbest(end,:); s_gbest(randi(a,1,rna.n_pso),:)];
d2Plot = [d2Plot , d];
gbest2Plot = [gbest2Plot , gbest];
end
figure;
plot(gbest2Plot,'.g')
figure;
plot(d2Plot,'*g');
gbestMax = max(gbest)
gbestMin = min(gbest)
gbestEND = gbest(end)

