function pop=Cruzamento(pop,pc,s)

[l,c]=size(pop);

a=1;
b=c-1;

for i=1:2:l-1
% pode-se: cruzar 0, 1 ou duas vezes
    if rand(1,1)<=pc
       r = round(a + (b-a).*rand(1,1));
       chain=pop(i,1:r);
       pop(i,1:r)=pop(i+1,1:r);
       pop(i+1,1:r)=chain; 
    end
    if rand(1,1)<=pc
       r = round(a + (b-a).*rand(1,1));
       chain=pop(i,1:r);
       pop(i,1:r)=pop(i+1,1:r);
       pop(i+1,1:r)=chain; 
    end
end
