#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double pix2 = 2. * M_PI;

size_t _loop = 29;
size_t _dots = 10000;
size_t _dims = 10;

double _pMut = .01;

double _dc1 = 0.5;
double _dc2 = 2.0;
double _dW1 = 50.0;
double _dW2 = 0.5;

void getFF( double shifts[], double aff[] )
{
	size_t s;
//#pragma omp parallel num_threads(8)
{
#pragma omp parallel for
	for ( s = 0; s < _dots; s++ ) {
		double target = 10. * _dims;
		size_t i;
		for ( i = 0; i < _dims; i++ ) {
			double xi = shifts[s * _dims + i];
			double xxi = xi * xi;
			target += xxi - 10. * cos( pix2 * xi );
		}
		aff[s] = target;
	}
}
}

size_t findMinIndex( double * forMin, size_t lenght )
{
	size_t i, minIndex = 0;
	for ( i = 1; i < lenght; i++ ) {
		if ( forMin[i] < forMin[minIndex] ) {
			minIndex = i;
		}
	}
	return minIndex;
}

double pso()
{
	size_t nMut = (size_t) round( _pMut * _dots * _dims );
	// initialization
	size_t k, t, d;
	size_t num_birds = _dots * _dims;
	double * shifts = (double *) malloc( num_birds * sizeof(double) );
	double * velocities = (double *) malloc( num_birds * sizeof(double) );

	for ( k = 0; k < num_birds; k++ ) {
		double r1, r2;
		r1 = rand() / ( RAND_MAX + 0.01 );
		shifts[k] = 1. - ( 1. - ( -1. ) ) * r1;
		r2 = rand() / ( RAND_MAX + 0.01 );
		velocities[k] = 1. - ( 1. - ( -1. ) ) * r2;
	}

	double * gBest = (double *) malloc( ( _loop + 1 ) * sizeof(double) );
	double * s_gBest = (double *) malloc( ( _loop * _dims + _dims ) * sizeof(double) );
	double * aff = (double *) malloc( _dots * sizeof(double) );

	double * s_pBest = (double *) malloc( num_birds * sizeof(double) );
	for ( k = 0; k < num_birds; k++ ) {
		s_pBest[k] = shifts[k];
	}
	double * pBest = (double *) malloc( _dots * sizeof(double) );
	getFF( shifts, pBest );
	size_t indice = findMinIndex( pBest, _dots );
	gBest[0] = pBest[indice];
//	printf( "Result (%d): %f\n", 0, gBest[0] );
	for ( k = 0; k < _dims; k++ ) {
		s_gBest[k] = shifts[indice * _dims + k];
//		printf( "%f\n", s_gBest[k] );
	}
	//end initialization

	// algorithm
	double w = 0.0;
	for ( k = 0; k < _loop; k++ ) {
//		w =_dW2 - ( ( _dW2 - _dW1 ) * k ) / _loop;
		w = _dW2*exp(-_dW1*k/_loop);
		for ( t = 0; t < _dots; t++ ) {
			for ( d = 0; d < _dims; d++ ) {
				velocities[t * _dims + d] = w * velocities[t * _dims + d];
				velocities[t * _dims + d] += _dc1 * ( rand() / ( RAND_MAX + 1.0 ) ) * ( s_pBest[t * _dims + d] - shifts[t * _dims + d] );
				velocities[t * _dims + d] += _dc2 * ( rand() / ( RAND_MAX + 1.0 ) ) * ( s_gBest[k * _dims + d] - shifts[t * _dims + d] );
				shifts[t * _dims + d] = shifts[t * _dims + d] + velocities[t * _dims + d];
			}
		}

		for ( t = 0; t < nMut; t++ ) {
			size_t rnd = rand() % num_birds;
			shifts[rnd] = shifts[rnd] + shifts[rnd] * ( 2 * ( rand() / ( RAND_MAX + 1.0 ) ) - 1 );
		}

		getFF( shifts, aff );

		for ( t = 0; t < _dots; t++ ) {
			if ( pBest[t] > aff[t] ) {
				pBest[t] = aff[t];
//#pragma omp parallel num_threads(8)
{
#pragma omp parallel for
				for ( d = 0; d < _dims; d++ ) {
					s_pBest[t * _dims + d] = shifts[t * _dims + d];
				}
}
			}
		}

		size_t index = findMinIndex( pBest, _dots );

		if ( gBest[k] > pBest[index] ) {
			gBest[k + 1] = pBest[index];
//			printf( "Result (%d): %f\n", k + 1, gBest[k + 1] );
//#pragma omp parallel num_threads(8)
{
#pragma omp parallel for
			for ( d = 0; d < _dims; d++ ) {
				s_gBest[( k + 1 ) * _dims + d] = s_pBest[index * _dims + d];
//				printf( "%f\n", s_gBest[( k + 1 ) * _dims + d] );
			}
}
		}
		else {
			gBest[k + 1] = gBest[k];
//			printf( "Result (%d): %f\n", k + 1, gBest[k + 1] );
//#pragma omp parallel num_threads(8)
{
#pragma omp parallel for
			for ( d = 0; d < _dims; d++ ) {
				s_gBest[( k + 1 ) * _dims + d] = s_gBest[k * _dims + d];
//				printf( "%f\n", s_gBest[( k + 1 ) * _dims + d] );
			}
}
		}
	}

	double result = gBest[_loop];
// free, now is TRASH!
	free( pBest );
	free( s_pBest );
	free( aff );
	free( s_gBest );
	free( gBest );
	free( velocities );
	free( shifts );
	return result;
}

int main()
{
	short tests = 100;
	srand( 0L );
//	srand( time( NULL ) );
	double results = 0.;
	double result;
	short i;
	for ( i = 0; i < tests; i++ ) {
		result = pso();
		results += result;
//		printf("PSO (%d): %f\n", i, result);
	}
	printf( "Mean: %5.5f\n", results / tests );
	return 0;
}

/*#include "ccalcengine.h"

 int main( int argc, char **argv )
 {
 return ccalcengineByLLR(argc, argv);
 }*/
