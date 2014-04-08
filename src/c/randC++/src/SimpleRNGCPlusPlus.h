/*
 * simpleRNGCPlusPlus.h
 *
 *  Created on: 08/04/2014
 *      Author: Luiz
 */

#ifndef SIMPLERNGCPLUSPLUS_H_
#define SIMPLERNGCPLUSPLUS_H_

class SimpleRNG_CPlusPlus {
private:
	long int m_w;
	long int m_z;
public:
	SimpleRNG_CPlusPlus();
	long int testando();
	double GetUniform();
	long int GetUint();

	virtual ~SimpleRNG_CPlusPlus();
};

#endif /* SIMPLERNGCPLUSPLUS_H_ */
