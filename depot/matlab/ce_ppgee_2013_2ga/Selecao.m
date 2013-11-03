function [pop_]=Selecao(f,pop,ss)
s = sum(f);
f = sort(f, 2, 'descend');
accum = 0;
r = s*rand;
pop_ = zeros(size(pop));
for j = 1:length(pop)
    for i = 1:length(pop)
        accum = accum + f(i);
        if (r <= accum)
            pop_(j,:) = pop(i,:);
            break;
        end
    end
end
%pop_