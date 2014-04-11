function [ output_args ] = pso( isTeste, x )
[S_lim,V_lim,C,W,n_part,iter_max]=FF_param(x);

[V_k, S_k] = pso_inicializacao(n_part, x, S_lim, V_lim);


dim = length(x);

pbest=matrixFF(S_k);
s_pbest=S_k;
[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(:,indice);

for j=1:iter_max
    w=W(2)-((W(2)-W(1))*j)/iter_max;
    %for t=1:n_part
    matrixP = rand(dim,n_part).*s_pbest;
    matrixG = zeros(dim,n_part);
    for t=1:n_part
        matrixG(:,t) = rand(dim,1).*s_gbest(end,:)';
    end
    V_k=w*V_k+C(1)*(matrixP-S_k)+C(2)*(matrixG-S_k);
    S_k=S_k+V_k;
    %end
    F=matrixFF(S_k);
    for c=1:n_part
        if pbest(c)>F(c)
            pbest(c)=F(c);
            s_pbest(:,c)=S_k(:,c);
        end
    end
    if(gbest(j)>min(pbest))
        [gbest(j+1),indice]=min(pbest);
        s_gbest(j+1,:)=S_k(:,indice);
    else
        gbest(j+1)=gbest(j);
        s_gbest(j+1,:)=s_gbest(j,:);
    end
    s_k_medio=mean(s_pbest);
end

%O CARA!
output_args = s_gbest(end,:)'
end