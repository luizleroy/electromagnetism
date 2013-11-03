clear;
pc = 0.6;
pm = 0.1;
nBits = 4;
nPop = 10;
dn = 0;
up = 1000;
nVar = 2;
nGe = 20;
s = rng('default');
%s = rng('shuffle')
pop=round(rand(nPop,nVar*nBits));
fmax = zeros(nGe,1);
for i=1:nGe                   %no java:
	f=Avaliacao(pop, f, dn, up); %dn up
	pop=Selecao(f,pop,s);     %s
	pop=Cruzamento(pop,pc,s);
	pop=Mutacao(pop,pm,s);
	fmax(i)=max(f);
end
max(fmax)

