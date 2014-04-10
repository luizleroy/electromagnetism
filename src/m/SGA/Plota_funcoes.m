function Plota_funcoes(l_inf,l_sup,Dx)

x=l_inf:Dx:l_sup;

l=length(x);

for i=1:l
    f(i)=Funcoes(x(i));
end

plot(x,f)