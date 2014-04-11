%função mono-objetivo: mapear todo o estado para 1 valor correlacionado
%com as medidas através da rede neural

function [ff]=FF(x)
%valor randômico dos pesos!
%w = rand(length(x),1);
w = [0.4211;
    0.0568;
    0.5857;
    0.1742;
    0.7286;
    0.5343];
w = ones(length(w),1);
%%%display('valor randômico dos pesos!');
%%%display(w);
% z = h_ann(x);
% ff = z;
%display(x);


zReal = [13.8;
    13.78066701;
    13.76956855;
    13.76933613;
    13.76874687;
    13.76841826];
zImag = [0;
    -0.617814862;
    -0.753505563;
    -0.754238617;
    -0.7629346;
    -0.766686768];
zImag = zImag*1i;
z = zReal + zImag;
Rminus1 = eye(length(z)); %covariância invertida unitária: se a covariância é zero, as medidas são não correlacionadas, corroborando o resultado perfect!

ff = x.*w;
ff = (ff - z)'*Rminus1*(ff - z);
%%%%%%%%%%%%%J = (z - h)'*Rminus1*(z-h);
end
