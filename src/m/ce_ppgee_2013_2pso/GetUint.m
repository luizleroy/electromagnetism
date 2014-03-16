function [ output_args ] = GetUint(  )
m_z = 36969 * (m_z & 65535) + (m_z >> 16);
m_w = 18000 * (m_w & 65535) + (m_w >> 16);
output_args = (m_z << 16) + m_w;
end

