function [ y ] = andor_or( x1,x2,x3,x4, w1, w2, u1, u2, v1, v2 )
y = n_or(v1,v2,n_and(w1,w2,x1,x3),n_or(u1,u2,x2,x4));
end

