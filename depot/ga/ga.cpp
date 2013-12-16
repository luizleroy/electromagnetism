#include <cstddef>
#include <iostream>
#include <vector>
#include <math.h>
#include <bitset>
#include <cstdlib>

// utilizar constante encapsulada e tipada
#define PI 3.1415926

using namespace std;

// TODO include the Function here!
#include "function.d/Rastrigin.c"

// TODO inclue parameters here!
size_t G = 5;
void sga() {
	for (size_t g = 0; g < G; g++) {
		bitset<N> b;
		for (size_t i = 0; i < N; i++) { 
			b.set(rand()%N); // FIXME verify rand generation
			cout << b[i];
		}
	cout << endl;
	}
}

int main(int argc, char ** argv)
{	
	long int l0 = time(0);
	srand(0);
	// BIG LOOP set some content in the algorithm. EXECUTE: 1K (meausre time)
	for (size_t l = 0; l < 10; l++) {
		sga();		
	}// fim BIG LOOP
	cout << "that's all folks\n\tthe end!" << endl;
	return 0;
}
//b.capacity()
//b.max_size()
// SEMPRE guardando ohCara
// output:
// ohCara (doubles) / diversidade (graph)
	
