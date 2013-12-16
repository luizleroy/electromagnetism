#include <stdio.h>
#include <stdlib.h>

size_t _numExec = 1;
size_t _loop = 3*2;
size_t _dots = 2*2;
size_t _dims = 2;//10; // FIXME é fixo...

double _dc1 = 0.8;
double _dc2 = 0.6;
double _dW1 = 0.1;
double _dW2 = 1.1;

void   getFF(double shifts[], double aff[]) {
    // IF size-shifts <> size-ff = ERROR
    size_t s, d = 0;
    double x1,x2;
    for (s = 0; s < _dots; s++) {
        x1 = shifts[d];
        d++;
        x2 = shifts[d];
        d++;
        aff[s] = x1*x2;
    }
}

void   clone(double src[], double dst[], size_t size) {
    size_t k;
    for (k = 0; k < size; k++) {
        dst[k] = src[k];
    }
}



int main() {
    // initialization
    size_t k;

    size_t num_birds = _dots*_dims;
    double * shifts = (double *) malloc(num_birds*sizeof(double));
    double * velocities = (double *) malloc(num_birds*sizeof(double));

    double r1,r2;
    for (k = 0; k < num_birds; k++) {
		{
			r1 = -1.;
			shifts[k] = -0.001 - (10 - (-0.001))*r1;
            r2 = 1000.;
			velocities[k] = 1. - (1. - (-1.)) * r2;
		}
	}

    double * gBest = (double *) malloc((_loop + 1)*sizeof(double));
    double * s_gBest = (double *) malloc((num_birds + _dims)*sizeof(double));
    double * aff = (double *) malloc(_dots*sizeof(double));

    double * s_pBest = (double *) malloc(num_birds*sizeof(double));
        clone(shifts,s_pBest,num_birds);
    double * pBest = (double *) malloc(_dots*sizeof(double));
        getFF(shifts,pBest);


    //end initialization

    // free, now is TRASH!
    free(s_pBest);
    free(pBest);
    free(aff);
    free (s_gBest);
    free (gBest);
    free(velocities);
    free(shifts);
    return 0;
}
