function [diffs] = test14( x )
w1 = x(1); w2 = x(2);
u1 = x(3); u2 = x(4); u3 = x(5);
v1 = x(6); v2 = x(7);
l1 = x(8); l2 = x(9);
diffs(1) =  figura14( 0,0,0,0, w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(2) =  figura14(0,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(3) =  figura14(0,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(4) =  figura14(0,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(5) =  figura14(0,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(6) =  figura14(0,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(7) =  figura14(0,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(8) =  figura14(0,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(9) =  figura14(1,0,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(10) = figura14(1,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(11) =  figura14(1,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(12) =  figura14(1,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(13) =  figura14(1,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(14) =  figura14(1,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(15) =  figura14(1,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
diffs(16) =  figura14(1,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
end