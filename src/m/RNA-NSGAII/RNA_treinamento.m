%%
%Script para testes de desempenho e qualidade em:
%ANN / Regression Problem

tic; clear; close all;
%rng('default');
display('Início do treinamento em:')
format shortg;
clock
display('gerando base de dados...')
%início
[rna]=RNA_parametros()
func = 'IDENTITY'
[x, y, rna] = FACTORY_buildFunction( rna, func );
n_amostras=rna.nAmostra;

%[x,y] = removeExtremos(x_noise,y_noise,1); %remove até três desvios padrão (mantendo 99,74% dos dados)
[x, ~, ~] = normIO(x);
[y, mins, maxs] = normIO(y);
toc;

display('RNA by Gustavo@puc (IO: luizleroy@axxiom)');
[s_gbest,x_trein,y_trein,x_valid,y_valid] = RNA(x,y);

[w,wb]=RNA_codifica_pesos(s_gbest(end,:),1,n_amostras,rna);
display('Para mensurar o desempenho total:');
toc;

% VALIDAÇÃO GRÁFICA DO ALGORITMO!!!
[samples_mse,erroMax] = RNA_view(x_valid,y_valid,w,wb,mins,maxs,rna)

