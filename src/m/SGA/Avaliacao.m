function [f]=Avaliacao(pop,n_var,n_bits,l_inf,l_sup)

[l,~]=size(pop);

for i=1:l
    k=1;
    for j=1:n_var
        chain(i,:)=pop(i,k:j*n_bits);
        x=Interpolacao(n_bits,l_inf,l_sup,chain(i,:));
        k=j*n_bits+1;
    end
    f(i)=Funcoes(x);
    plot(x,f(i),'*');
end