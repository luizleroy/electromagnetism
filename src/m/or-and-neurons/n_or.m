function [ z ] = n_or( m, n, a, b )
z = min(max(0, m+a - 1) + max(0, n+b - 1), 1);
end
