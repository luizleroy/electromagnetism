function [ best ] = PSO( ObjFunc, n_part, iter_max )

[V_lim,C,W]=PSO_PARAMETROS(ObjFunc);

%valor absoluto da quantidade de mutações nas partículas
mut = round(0.05*n_part);

[~, min_range, max_range] = INITIALIZE(ObjFunc.func);

S_k = rand(n_part,ObjFunc.dim);
V_k = rand(n_part,ObjFunc.dim);
%OBS: considerando mínimo e máximo igual em todas as variáveis de projeto
S_k = (max_range(1)-min_range(1)).*S_k + min_range(1);
V_k = (V_lim(2,1)-V_lim(1,1))*V_k + V_lim(1,1);

FF=TestFunction_MONO(S_k,ObjFunc.func);
pbest=FF;
s_pbest=S_k;
gbest = zeros(iter_max+1,1);
[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(indice,:);

for j=1:iter_max
    w=W(2)-((W(2)-W(1))*j)/iter_max;
    for t=1:n_part
        V_k(t,:)=w*V_k(t,:)...
            + C(1)*rand(1,length(s_pbest(t,:))).*(s_pbest(t,:)-S_k(t,:))...
            +C(2)*rand(1,length(s_pbest(t,:))).*(s_gbest(j,:)-S_k(t,:));
        S_k(t,:)=S_k(t,:)+V_k(t,:);
    end
    %mutation
    for m=1:mut
        a_par = randi(n_part,1,1);
        a_dim = randi(ObjFunc.dim,1,1);
        S_k(a_par,a_dim) = S_k(a_par,a_dim) + S_k(a_par,a_dim)*(2*rand -1);
    end
    
    FF=TestFunction_MONO(S_k,ObjFunc.func);
    for i=1:n_part
        if pbest(i)>FF(i)
            pbest(i)=FF(i);
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
best = s_gbest(end,:);
end