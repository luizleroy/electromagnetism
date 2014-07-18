function [w,wb]=RNA_codifica_pesos(S_k,j,rna)

for k=1:rna.n_camadas-1
   w{k}=zeros(rna.n_neur(k),rna.n_neur(k+1));
   wb{k}=zeros(1,rna.n_neur(k+1));
end

cont=0;
for k=1:rna.n_camadas-1
    for m=1:rna.n_neur(k)
        for n=1:rna.n_neur(k+1)
            cont=cont+1;
            w{k}(m,n)=S_k(j,cont);
        end
    end
end

for k=1:rna.n_camadas-1
    for m=1:rna.n_neur(k+1)
        cont=cont+1;
        wb{k}(m)=S_k(j,cont);
    end
end