function [ output_args ] = pso( isTeste, x )
[S_lim,V_lim,C,W,n_part,iter_max]=FF_param(x);

[V_k, S_k] = pso_inicializacao(n_part, x, S_lim, V_lim);

pbest=matrixFF(S_k);
s_pbest=S_k;
[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(indice,:);

for j=1:iter_max
    w=W(2)-((W(2)-W(1))*j)/iter_max;
    for t=1:n_part
        V_k(t,:)=w*V_k(t,:)+C(1)*rand(1,length(s_pbest(t,:))).*(s_pbest(t,:)-S_k(t,:))+C(2)*rand(1,length(s_pbest(t,:))).*(s_gbest(j,:)-S_k(t,:));
        S_k(t,:)=S_k(t,:)+V_k(t,:);
    end
    F=matrixFF(S_k);
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
    s_k_medio=mean(s_pbest);
    d(j)=sqrt(sum((s_gbest(j+1,:)-s_k_medio).^2));
    
    
    %O CARA!
    output_args = s_gbest(end,:)
end

