function [ target ] = matrixFF(s_pso)
[~, c] = size(s_pso);
target = zeros(1,c);
for i = 1:c
    target(i) = FF(s_pso(:,i));
end
end

