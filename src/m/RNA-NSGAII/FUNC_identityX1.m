function [ y ] = FUNC_identityX1( x )
[L,~] = size(x);
y = x(1,:);
for k = 2:L
    y(1,:) = y(1,:)+x(k,:);
end
end
