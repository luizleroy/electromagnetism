% Produce a uniform random sample from the open interval (0, 1).
% The method will not return either end point.
function  [output, m_w, m_z] = randUniform(m_w, m_z)
% 0 <= u < 2^32
[u, m_w, m_z] = GetUint(m_w, m_z);
% The magic number below is 1/(2^32 + 2).
% The result is strictly between 0 and 1.
output = 2*((double(abs(u)) + 1.0) * 2.328306435454494e-10);
end

%This is the heart of the generator.
%It uses George Marsaglia's MWC algorithm to produce an unsigned integer.
% See http://www.bobwheeler.com/statistics/Password/MarsagliaPost.txt
function [u, m_w, m_z] =  GetUint(m_w, m_z)
m_z = plus( int64(36969) * (bitand(m_z,int64(65535))) , (bitshift(m_z,-16)) );
m_w = plus( int64(18000) * (bitand(m_w,int64(65535))) , (bitshift(m_w,-16)) );
u = plus ( bitshift(m_z,16) , m_w );
end

