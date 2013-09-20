#include <cstddef>
#include <iostream>
#include <vector>
#include <math.h>

#define PI 3.1415926

using namespace std;

// TODO include the Function
#include "function.d/Bohachevsky.c"

int main(int argc, char ** argv)
{
	vector<double> myvector;
// set some content in the vector:
	for (size_t i = 0; i < 5; i++) myvector.push_back(10.10);
	cout << "size: " << (size_t) myvector.size() << '\n';
//cout << "capacity: " << (size_t) myvector.capacity() << '\n';
//cout << "max_size: " << (size_t) myvector.max_size() << '\n';
	cout << "My Y is mono: " << function(myvector) << endl;
	cout << "that's all folks\n\tthe end!" << endl;
	return 0;
}

	// input:
		// function
		// code (configuration file?)
			// minimal set of initial parameters // what?
	// genético:
		// cria várias gerações de populações
			// a cada geração, criar condições para a evolução:
				// selection (torneio)
				// crosover (one posize_t)
				// mutation
				// ?
		// SEMPRE guardando ohCara
		// adotar um critério de parada 	
	// output:
		// ohCara (doubles)
	//cout << Power2.size_terpollation(2) << endl;
	
	// FIXME orientação a objetos... include Power2
	//Power2 <size_t> myobject (100, 75);
	//cout << myobject.getmax() << endl;

