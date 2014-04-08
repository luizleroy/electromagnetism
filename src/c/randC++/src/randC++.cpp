//============================================================================
// Name        : randC++.cpp
// Author      : Luiz Le Roy
// Version     :
// Copyright   : @GPL3
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include "SimpleRNGCPlusPlus.h"
using namespace std;

int main() {
	SimpleRNG_CPlusPlus* rng = new SimpleRNG_CPlusPlus();
	cout << rng->GetUniform() << endl;
	cout << rng->GetUniform() << endl;
	cout << rng->GetUniform() << endl;
	cout << rng->GetUniform() << endl;
	cout << rng->GetUniform() << endl;
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
	return 0;
}
