function [resp]=dominioV1(v1,v2)

resp1=sum(v1<=v2)==length(v1);
resp2=sum(v1==v2)<length(v1);

if resp1 && resp2
    resp=1;
else
    resp=0;
end