function [ error ] = fitness( x )
w1 = x(1); w2 = x(2); u1 = x(3); u2 = x(4); v1 = x(5); v2 = x(6);
diffs(1) = 1 - andor_or(0,0,0,0,w1, w2, u1, u2, v1, v2);
diffs(2) = 1 - andor_or(0,0,0,1,w1, w2, u1, u2, v1, v2);
diffs(3) = 0 - andor_or(0,0,1,0,w1, w2, u1, u2, v1, v2);
diffs(4) = 0 - andor_or(0,0,1,1,w1, w2, u1, u2, v1, v2);
diffs(5) = 1 - andor_or(0,1,0,0,w1, w2, u1, u2, v1, v2);
diffs(6) = 1 - andor_or(0,1,0,1,w1, w2, u1, u2, v1, v2);
diffs(7) = 0 - andor_or(0,1,1,0,w1, w2, u1, u2, v1, v2);
diffs(8) = 0 - andor_or(0,1,1,1,w1, w2, u1, u2, v1, v2);
diffs(9) = 0 - andor_or(1,0,0,0,w1, w2, u1, u2, v1, v2);
diffs(10) = 0 - andor_or(1,0,0,1,w1, w2, u1, u2, v1, v2);
diffs(11) = 1 - andor_or(1,0,1,0,w1, w2, u1, u2, v1, v2);
diffs(12) = 1 - andor_or(1,0,1,1,w1, w2, u1, u2, v1, v2);
diffs(13) = 0 - andor_or(1,1,0,0,w1, w2, u1, u2, v1, v2);
diffs(14) = 0 - andor_or(1,1,0,1,w1, w2, u1, u2, v1, v2);
diffs(15) = 1 - andor_or(1,1,1,0,w1, w2, u1, u2, v1, v2);
diffs(16) = 0 - andor_or(1,1,1,1,w1, w2, u1, u2, v1, v2);
error = sum(diffs.^2);
end

