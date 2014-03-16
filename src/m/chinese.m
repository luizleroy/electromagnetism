%PERFECT RESULT: DSSE


%%%miniRede -> chinês -> estado

% z é o estado simplificado: v real/imag
clear;
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
x = z; %zeros(length(z),1);

display('Valor considerado REAL das variáveis de estado x:');
display(x);

x_p_Real = 13.8*ones(length(x), 1);
x_p_Imag = x_p_Real*1i;
x_perfect = x_p_Real + x_p_Imag;

pso('ann',x_perfect);
