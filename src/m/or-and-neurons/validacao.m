function [tb] = validacao(x)
% nove pesos da topologia final
w1 = x(1); w2 = x(2);
u1 = x(3); u2 = x(4); u3 = x(5);
v1 = x(6); v2 = x(7);
l1 = x(8); l2 = x(9);
tb(1) = figura14( 0,0,0,0, w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(2) = figura14(0,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(3) = figura14(0,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(4) = figura14(0,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(5) = figura14(0,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(6) = figura14(0,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(7) = figura14(0,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(8) = figura14(0,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(9) = figura14(1,0,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(10) =figura14(1,0,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(11) =figura14(1,0,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(12) =figura14(1,0,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(13) =figura14(1,1,0,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(14) = figura14(1,1,0,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(15) = figura14(1,1,1,0,w1, w2, u1, u2, u3, v1, v2, l1, l2 );
tb(16) = figura14(1,1,1,1,w1, w2, u1, u2, u3, v1, v2, l1, l2 );