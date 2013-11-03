function [S_lim,V_lim,C,W,n_part,iter_max,funcao,offset]=parametros_PSO

opcao=11;
nVar=1;

[funcao domInf domSup offset] = TabelaFuncoes(opcao,nVar);

S_lim(1,:)=domInf;
S_lim(2,:)=domSup;
%[-100 -100 -100 -100 -100 -100 -100 -100 -100 -100 -100 -100 -100 -100 -100; 100 100 100 100 100 100 100 100 100 100 100 100 100 100 100]; 
%S_lim=[-5.12 -5.12 -5.12 -5.12 -5.12 -5.12 -5.12 -5.12 -5.12 -5.12; 5.12 5.12 5.12 5.12 5.12 5.12 5.12 5.12 5.12 5.12];

V_lim(1,:)=-1*ones(1,nVar);
V_lim(2,:)=ones(1,nVar);

%[-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1; 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

C=[1.3 0.5];

W=[0.1 1.1];

n_part=9;

iter_max=3;



