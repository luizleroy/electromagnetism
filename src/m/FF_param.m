function [S_lim,V_lim,C,W,n_part,iter_max]=FF_param(x)

nVar=length(x);

%domínio: muito a estudar, devo considerá-lo tão grande (-180 graus até +180 graus e o dobro da tensão (13.8*2)?)

S_lim(:,1) = -2*x;
S_lim(:,2) =  2*x;

V_lim(:,1)=(-1 - 1i)*ones(1,nVar);
V_lim(:,2)=( 1 + 1i)*ones(1,nVar);

C=[1.0 0.6];
W=[0.1 1.1];

n_part=5;
iter_max=4;