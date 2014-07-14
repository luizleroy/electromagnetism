function [ x ] = desNormIO( y_full, mins, maxs )

[l,c] = size(y_full);
x=zeros(l,c);
for k=1:l
    x(k,:) = maxs(k)*y_full(k,:);
    x(k,:) = x(k,:) + mins(k);
end

end