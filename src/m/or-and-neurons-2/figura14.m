function [ y ] = figura14( x1,x2,x3,x4, w1, w2, u1, u2, u3, v1, v2, l1, l2 )
w = n_or(w1,w2, not(x4), not(x2));
u = n_and3(u1,u2,u3, x1, x3, w);
v = n_and(v1, v2, not(x1), not(x3));
y = n_or(l1,l2, v, u);
end

