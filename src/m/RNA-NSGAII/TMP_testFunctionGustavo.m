function [ y ] = TMP_testFunctionGustavo( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

y(1,:)=(x(1,:)-1).*(x(2,:)+10)./(x(3,:)+1+x(4,:)+x(5,:))+x(6,:);

end

