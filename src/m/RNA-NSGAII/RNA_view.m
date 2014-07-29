function [samples_mse,erroMax,w ,wb] = RNA_view(x_valid,y_valid,mins,maxs,rna)
outt = dlmread('solution.txt');
[minino,ind] = min(outt(:,(rna.dim+2)));
f1 = outt(ind,(rna.dim+1))
f2 = outt(ind,(rna.dim+2))
s = outt(ind,1:rna.dim);
[w,wb]=RNA_codifica_pesos(s,1,rna);
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
%output(:,1) = desNormIO(output(:,1)',mins,maxs)';
%output(:,2) = desNormIO(output(:,2)',mins,maxs)';
abxixa = 1:tam;
figure;
[s2,i] = sort(output(:,2));
s1 = output(i,1);
plot(abxixa,s1,'-or',abxixa,s2,'-xb');
title('Sample em ordem crescente!');
toHist = output(:,2)-output(:,1);
diff = abs(toHist);
samples_mse = [tam sqrt(sum(diff.*diff))];
erroMax = max(diff);
figure;
hist(toHist,5);
title('Utilizando dados de validação para análise');
end