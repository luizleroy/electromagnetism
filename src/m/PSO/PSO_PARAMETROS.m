function [V_lim,C,W]=PSO_PARAMETROS(ObjFunc)
V_lim(1,:)=-1*ones(1,ObjFunc.dim);
V_lim(2,:)=ones(1,ObjFunc.dim);
C=[1.0 0.6];
W=[0.1 1.1];



