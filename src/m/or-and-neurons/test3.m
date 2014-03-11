function [] = test3( x )
w1 = x(1); w2 = x(2); w3 = x(3);
u1 = x(4); u2 = x(5); u3 = x(6);
v1 = x(7); v2 = x(8);
k1 = x(9); k2 = x(10);
l1 = x(11); l2 = x(12);
diffs(1) = tres_camadas(0,0,0,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 1 - 
diffs(2) = tres_camadas(0,0,0,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 1 - 
diffs(3) = tres_camadas(0,0,1,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 0 - 
diffs(4) = tres_camadas(0,0,1,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 0 - 
diffs(5) = tres_camadas(0,1,0,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 1 - 
diffs(6) = tres_camadas(0,1,0,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 1 - 
diffs(7) = tres_camadas(0,1,1,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 0 - 
diffs(8) = tres_camadas(0,1,1,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 0 - 
diffs(9) = tres_camadas(1,0,0,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2); % 0 - 
diffs(10)= tres_camadas(1,0,0,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 0 -
diffs(11)= tres_camadas(1,0,1,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 1 -
diffs(12)= tres_camadas(1,0,1,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 1 -
diffs(13)= tres_camadas(1,1,0,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 0 -
diffs(14)= tres_camadas(1,1,0,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 0 -
diffs(15)= tres_camadas(1,1,1,0,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 1 -
diffs(16)= tres_camadas(1,1,1,1,w1, w2, w3, u1, u2, u3, v1, v2, k1, k2, l1, l2);%= 0 -
end