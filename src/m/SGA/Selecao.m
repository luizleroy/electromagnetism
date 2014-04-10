function [pop_aux]=Selecao(f,pop)

[l,~]=size(pop);
a=1;
b=l;
for i=1:l
    r1 = round(a + (b-a).*rand(1,1));
    r2 = round(a + (b-a).*rand(1,1));
   if f(r1)>=f(r2)
      pop_aux(i,:)=pop(r1,:); 
   else
       pop_aux(i,:)=pop(r2,:);
   end
end