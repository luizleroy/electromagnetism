%clear; %clc; clf;

% dx = 0.1;
% [x,y] = meshgrid(-5.12:dx:5.12);
% z=(10*2)+x.^2+y.^2-10*cos(2*pi.*x)-10*cos(2*pi.*y);
% contour(x,y,z)
% hold on
[S_lim,V_lim,C,W,n_part,iter_max,funcao,offset]=parametros_PSO;

for i=1:length(S_lim(1,:))
    r1(:,i) = rand(n_part,1);
    S_k(:,i)=S_lim(2,i)-(S_lim(2,i)-S_lim(1,i)).*r1(:,i);
    r2(:,i) = rand(n_part,1);
    V_k(:,i)=V_lim(2,i)-(V_lim(2,i)-V_lim(1,i)).*r2(:,i);
end

F=teste(S_k,funcao,offset);
pbest=F;
s_pbest=S_k;
[gbest(1),indice]=min(pbest);
s_gbest(1,:)=S_k(indice,:);

% cálculo do centro de massa
s_k_medio=mean(s_pbest);
% distância de gbest ao centro de massa
d(1)=sqrt(sum((s_gbest(1,:)-s_k_medio).^2));

for j=1:iter_max
    w=W(2)-((W(2)-W(1))*j)/iter_max;
    for t=1:n_part
       vra(t,:) = rand(1,length(s_pbest(t,:)))
       vrb(t,:) = rand(1,length(s_pbest(t,:)))
       V_k(t,:)=w*V_k(t,:)+C(1)*vra(t,:).*(s_pbest(t,:)-S_k(t,:))+C(2)*vrb(t,:).*(s_gbest(j,:)-S_k(t,:));   
    %V_k=w*(V_k+C(1)*a*(s_pbest-S_k)+C(2)*b*(removerows(wextend('ar','sp1',s_gbest(j,:),0.5*length(S_k(:,1))),'ind',length(S_k(:,1))+1)-S_k));
       S_k(t,:)=S_k(t,:)+V_k(t,:);
    end
    F=teste(S_k,funcao,offset);
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

    
    %     clf;
%     contour(x,y,z);
%     hold on
%     for i=1:n_part
%         plot(S_k(i,1),S_k(i,2),'o');
%     end
% 
%     plot(s_gbest(j+1,1),s_gbest(j+1,2),'*r');
%      pause(0.2);
end
s_gbest(end,:)