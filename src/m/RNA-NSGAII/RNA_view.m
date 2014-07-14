function [samples_mse,erroMax] = RNA_view(x_valid,y_valid,w,wb,mins,maxs,rna)
[~,tam] = size(x_valid);
output = zeros(tam,2);
for k=1:tam
        r=x_valid(:,k)';
        for m=1:rna.n_camadas-1
           r=r*w{m}+wb{m};
           r=1./(exp(-r)+1);
        end
         output(k,:) = [r y_valid(:,k)];
end
%trabalhando com a saída com valores reais ("desnormalizada")
output(:,1) = desNormIO(output(:,1)',mins,maxs)';
output(:,2) = desNormIO(output(:,2)',mins,maxs)';
abxixa = 1:tam;
figure;
[s2,i] = sort(output(:,2));
s1 = output(i,1);
plot(abxixa,s1,'-or',abxixa,s2,'-xb');
title('Sample em ordem crescente!');
toHist = output(:,2)-output(:,1);
diff = abs(toHist);
samples_mse = [tam sqrt(sum(diff.*diff))];
erroMax = max(diff/max(max(abs(output))));
figure;
hist(toHist,10);
title('Utilizando dados de validação para análise');
end