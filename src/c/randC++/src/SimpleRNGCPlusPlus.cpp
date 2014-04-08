/*
 * simpleRNGCPlusPlus.cpp
 *
 *  Created on: 08/04/2014
 *      Author: Luiz
 */

#include "simpleRNGCPlusPlus.h"
//#include <math.h>       /* fabs */
#include <stdlib.h>       /* abs */

long int SimpleRNG_CPlusPlus::testando() {
	return -1;
}

SimpleRNG_CPlusPlus::SimpleRNG_CPlusPlus() {
	// These values are not magical, just the default values Marsaglia used.
	// Any pair of unsigned integers should be fine.
	m_w = 521288629;
	m_z = 362436069;

}

// This is the heart of the generator.
// It uses George Marsaglia's MWC algorithm to produce an unsigned integer.
// See http://www.bobwheeler.com/statistics/Password/MarsagliaPost.txt
// FIXME trabalhar com ou sem sinal?
long int SimpleRNG_CPlusPlus::GetUint()
{
	m_z = 36969 * (m_z & 65535) + (m_z >> 16);
	m_w = 18000 * (m_w & 65535) + (m_w >> 16);
	return (m_z << 16) + m_w;
}

// Produce a uniform random sample from the open interval (0, 1).
// The method will not return either end point.
double SimpleRNG_CPlusPlus::GetUniform()
{
	// 0 <= u < 2^32
	int u = GetUint();
	// The magic number below is 1/(2^32 + 2).
	//1
	return 2*((abs(u) + 1.0) * 2.328306435454494e-10) / 7.393804792359236e+04;
	//FIXME (ver sentença abaixo!) empírico: mairo valor encontrado, para normalização...;The result is strictly between 0 and 1.
	//return (u + 1.0) * 2.328306435454494e-10;
}

SimpleRNG_CPlusPlus::~SimpleRNG_CPlusPlus() {
	// TODO Auto-generated destructor stub
}

