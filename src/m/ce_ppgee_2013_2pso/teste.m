function [F]=teste(X,funcao,offset)

%F=(10*length(X(1,:))+sum(((X.^2)-10*cos(2*pi.*X))'))';
[l,c]=size(X);

for i=1:l
   %F(i)=sum(X(i,:).^2);
   F(i)=Funcoes(X(i,:),funcao,offset);
end
   

