clc;
clear;

[pc,pm,n_pop,n_bits,l_inf,l_sup,n_var,n_ger]=Parametros;

pop=round(rand(n_pop,n_var*n_bits));

Plota_funcoes(l_inf,l_sup,0.1);

hold on;

pause;

[f]=Avaliacao(pop,n_var,n_bits,l_inf,l_sup);
[fmax(1),indice]=max(f);
Oh_cara=pop(indice,:);
fmed(1)=mean(f);

for i=1:n_ger
    pause(0.4);
    clf;
    Plota_funcoes(l_inf,l_sup,0.1);
    hold on
    [pop_aux]=Selecao(f,pop);
    pop_aux=Cruzamento(pop_aux,pc);
    pop_aux=Mutacao(pop_aux,pm);
    [f_aux]=Avaliacao(pop_aux,n_var,n_bits,l_inf,l_sup);
    [menor,indice]=min(f_aux);
    pop_aux(indice,:)=Oh_cara;
    f_aux(indice)=fmax(i);
    pop=pop_aux;
    f=f_aux;
    [fmax(i+1),indice]=max(f);
    Oh_cara=pop(indice,:);
    fmed(i+1)=mean(f);
end
pause;

clf;

plot(fmax);
hold
plot(fmed,':')