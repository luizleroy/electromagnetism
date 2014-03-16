function [ z ] = h_ann( x )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% inserir pesos do programa criado a parte
% TODO: é possível centralizar tudo?
w = ones(length(x),1);

z = w.*x;

end

