function [ z ] = n_and3( m, n, p, a, b, c )
z = max(0, max(0, min(m+a,1) + min(n+b,1) - 1) + min(p+c,1) - 1);
end
