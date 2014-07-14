function [s_gbest,gbest,d]=PSO_gbests(rna,n_var,x_trein,y_trein,S_k)

% carregamento de parametros da PSO
[pso]=PSO_parametros();

% adaptacao parametros PSO populacao g_bests
[pso.n_part,n_var]=size(S_k);

% calculo do numero de mutacoes
n_mut=round(pso.p_mut*pso.n_part*n_var);

% limites iniciais de velocidade p/ as particulas
V_lim(1,:)=-1*ones(1,n_var);
V_lim(2,:)=ones(1,n_var);

for i=1:length(V_lim(1,:))
    V_k(:,i)=V_lim(2,i)-(V_lim(2,i)-V_lim(1,i)).*rand(pso.n_part,1);
end

F=Funcao_Objetivo(S_k,rna,x_trein,y_trein);

pbest=F;
s_pbest=S_k;

[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(indice,:);

s_k_medio=mean(s_pbest);
d(1)=sqrt(sum((s_gbest(1,:)-s_k_medio).^2));
contador=0;
for j=1:pso.iter_max
    %j/iter_max*100
    w=pso.W(2)-((pso.W(2)-pso.W(1))*j)/pso.iter_max;
    %%% display('estudar variação de tetete')
    for t=1:pso.n_part
        %%% t
        V_k(t,:)=w*V_k(t,:)+pso.C(1)*rand(1,length(s_pbest(t,:))).*(s_pbest(t,:)-S_k(t,:))+pso.C(2)*rand(1,length(s_pbest(t,:))).*(s_gbest(j,:)-S_k(t,:));
        S_k(t,:)=S_k(t,:)+V_k(t,:);
    end
    for i=1:n_mut
        part_sorteada=round((pso.n_part-1)*rand)+1;
        var_sorteada=round((n_var-1)*rand)+1;
        S_k(part_sorteada,var_sorteada)=S_k(part_sorteada,var_sorteada)*(1-2*rand);
        %V_k(part_sorteada,var_sorteada)=V_k(part_sorteada,var_sorteada)*rand;
    end
    F=Funcao_Objetivo(S_k,rna,x_trein,y_trein);
    
    for i=1:pso.n_part
        if pbest(i)>F(i)
            pbest(i)=F(i);
            s_pbest(i,:)=S_k(i,:);
        end
    end
    if(gbest(j)>min(pbest))
        [gbest(j+1),indice]=min(pbest);
        s_gbest(j+1,:)=S_k(indice,:);
        contador=0;
    else
        gbest(j+1)=gbest(j);
        s_gbest(j+1,:)=s_gbest(j,:);
        contador=contador+1;
    end
    s_k_medio=mean(s_pbest);
    d(j)=sqrt(sum((s_gbest(j+1,:)-s_k_medio).^2));
end

