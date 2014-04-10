function [x]=Interpolacao(n_bits,l_inf,l_sup,chain)

chain_inteiro=bin2dec(num2str(chain));

x=l_inf+chain_inteiro*(l_sup-l_inf)/(2^n_bits-1);