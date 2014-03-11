function [ y ] = tres_camadas( x1,x2,x3,x4, w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2 )
w = n_and3(w1,w2, w3, x3, x1, not(x2));
u = n_and3(u1,u2, u3, x1, x3, not(x4));
k = n_and(k1,k2, not(x1), not(x2));
v = n_or(v1,v2, u, w);
y = n_or(l1,l2,k, v);
end

