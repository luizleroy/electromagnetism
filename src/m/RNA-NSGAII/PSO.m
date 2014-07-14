function [s_gbest]=PSO(rna,n_var,x_trein,y_trein)

[S_lim,V_lim,C,W,n_part,iter_max, p_mut]=parametros_PSO(n_var);
n_mut=round(p_mut*n_part*n_var);
for i=1:length(S_lim(1,:))
    S_k(:,i)=S_lim(2,i)-(S_lim(2,i)-S_lim(1,i)).*rand(n_part,1);
    V_k(:,i)=V_lim(2,i)-(V_lim(2,i)-V_lim(1,i)).*rand(n_part,1);
end

F=Funcao_Objetivo(S_k,rna,x_trein,y_trein);

pbest=F;
s_pbest=S_k;
[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(indice,:);

for j=1:iter_max
    w=W(2)-((W(2)-W(1))*j)/iter_max;
    for t=1:n_part
        V_k(t,:)=w*V_k(t,:)+C(1)*rand(1,length(s_pbest(t,:))).*(s_pbest(t,:)-S_k(t,:))+C(2)*rand(1,length(s_pbest(t,:))).*(s_gbest(j,:)-S_k(t,:));
        S_k(t,:)=S_k(t,:)+V_k(t,:);
    end
    for i=1:n_mut % mutação na posição das partículas...
        part_sorteada=round((n_part-1)*rand)+1;
        var_sorteada=round((n_var-1)*rand)+1;
        S_k(part_sorteada,var_sorteada)=S_k(part_sorteada,var_sorteada)*(1-2*rand);
    end
    F=Funcao_Objetivo(S_k,rna,x_trein,y_trein);
    for i=1:n_part
        if pbest(i)>F(i)
            pbest(i)=F(i);
            s_pbest(i,:)=S_k(i,:);
        end
    end
    if(gbest(j)>min(pbest))
        [gbest(j+1),indice]=min(pbest);
        s_gbest(j+1,:)=S_k(indice,:);
    else
        gbest(j+1)=gbest(j);
        s_gbest(j+1,:)=s_gbest(j,:);
    end
end
    s_gbest(end,:)
end

