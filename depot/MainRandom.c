#include <iostream>
#include "boost/random.hpp"
#include "boost/generator_iterator.hpp"
using namespace std;

int main() {
      typedef boost::mt19937 RNGType;
      RNGType rng;
      boost::uniform_int<> one_to_six( 1, 4096 );
      boost::variate_generator< RNGType, boost::uniform_int<> > dice(rng, one_to_six);
      /*for ( int i = 0; i < 6; i++ ) {
          int n  = dice();
          cout << n << endl;
     }*/
}
