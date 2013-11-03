function [f]=Avaliacao(pop, f, l_inf,l_sup)

[l,c]=size(pop);

for i=1:l
    tmp_pop = pop(i,:);
	x = Interpolacao(l_inf,l_sup,tmp_pop);
	f(i)=maxFunction(x);
end

