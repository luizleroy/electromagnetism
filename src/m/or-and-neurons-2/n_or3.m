function [ z ] = n_or3( m, n, p, a, b, c )
z = min(min(max(0, m+a - 1) + max(0, n+b - 1), 1) + max(0, p+c -1), 1);
end


