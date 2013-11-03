function [x] = Interpolacao(l_inf,l_sup,chain)
n_bits_chain = length(chain);
%n_bits
chain_inteiro = 0;
b = 1;
for i=1:n_bits_chain
	chain_inteiro = chain_inteiro + chain(i)*b;
	b = b*2;
end
%warning
x=l_inf+chain_inteiro*(l_sup-l_inf)/(2^n_bits_chain-1);