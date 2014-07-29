%%
%Script para testes de desempenho e qualidade em:
%ANN / Regression Problem

tic; clear; close all;
rng('default');
display('Início do treinamento em:')
format shortg;
clock
display('gerando base de dados...')
%início
[rna]=RNA_parametros();
func = 'BODY'
[x, y, rna] = FACTORY_buildFunction( rna, func );

[x, ~, ~] = normIO(x);
%[y, mins, maxs] = normIO(y);
maxs = -1000;
mins = -1000000;
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

rna.dim = n_var;
rna.x = x_trein;
rna.y = y_trein;
%pop 75 gen 6000 => funções de teste...
pop = 25
gen = 50000
nsga_2(rna,pop,gen);

toc;

%VALIDAÇÃO GRÁFICA DO ALGORITMO!!!
[samples_mse,erroMax, w, wb] = RNA_view(x_valid,y_valid,mins,maxs,rna)

