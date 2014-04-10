function pop=Mutacao(pop,pm)

[l,c]=size(pop);

n_mut=round(pm*l*c);

for i=1:n_mut
    r1 = round(1 + (l-1).*rand(1,1));
    r2 = round(1 + (c-1).*rand(1,1));
    pop(r1,r2)=not(pop(r1,r2));
end

