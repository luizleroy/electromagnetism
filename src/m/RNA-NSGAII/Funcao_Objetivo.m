function [erro_part]=Funcao_Objetivo(S_k,rna)
x_trein = rna.x;
y_trein = rna.y;
[n_saidas,samples]=size(y_trein);
[n_part,~]=size(S_k);
erro_part = zeros(1,n_part);
for j=1:n_part
    erros=zeros(n_saidas,samples);
    [w,wb]=RNA_codifica_pesos(S_k,j,rna);
    for k=1:samples
        r=x_trein(:,k)';
        for m=1:rna.n_camadas-1
            r=r*w{m}+wb{m};
            r=1./(exp(-r)+1);
        end
        erros(:,k)=r-y_trein(:,k);
    end
    erro_part(j,1)=sqrt(sum(erros.^2));
%    matrix = w{1};
%    [L,C] = size(matrix);
%     estW = 0;
%     for help = 1:(L*C)
%         estW = estW + matrix(help)*matrix(help);
%     end
    %%%erro_part(j,2) = erro_part(j,1);
    
    % erro_part(j,2)= sqrt(estW);
    % erro_part(j,2) = estW;
    % erro_part(j,2) = abs(sum(sum(matrix)));
    
    erro_part(j,2) = max(abs(erros));
end
