function [ z ] = n_and( m, n, a, b )
z = max(0, min(m+a,1) + min(n+b,1) - 1);
end

