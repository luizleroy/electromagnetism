function [erro_part]=Funcao_Objetivo(S_k,rna,x_trein,y_trein)

[n_entradas,samples]=size(x_trein);
[n_saidas,~]=size(y_trein);
[n_part,~]=size(S_k);
erro_part = zeros(1,n_part);
for j=1:n_part
    erros=zeros(n_saidas,samples);
    [w,wb]=RNA_codifica_pesos(S_k,j,n_entradas,rna);
    for k=1:samples
        r=x_trein(:,k)';
        for m=1:rna.n_camadas-1
           r=r*w{m}+wb{m};
           r=1./(exp(-r)+1);
        end
        erros(:,k)=r-y_trein(:,k);
    end
    switch rna.f_erro
        case 'MSE'
            erro_part(j)=sqrt(sum(erros.^2));
        case 'MAPE'
            for m=1:n_saidas
                erros(m,:)=erros(m,:)./y_trein(m,:);
            end
            erro_part(j)=sum(sum(abs(erros)))/(n_saidas*samples)*100;
        case 'TAKA'
            lenghtW = 0;
            for k=1:rna.n_camadas-1
                lenghtW = lenghtW +  rna.n_neur(k)*rna.n_neur(k+1);
            end
            erro_part(j)=0.5*(sum(erros.^2) + ...
                (S_k(j,1:lenghtW)*S_k(j,1:lenghtW)')/(sum(S_k(j,1:lenghtW).*S_k(j,1:lenghtW))));
        otherwise
            error('defina funcao erro!');
    end
end
