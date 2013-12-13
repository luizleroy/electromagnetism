package com.google.code.optimization.pso;

import java.util.Arrays;

import com.google.code.optimization.ArrayUtils;
import com.google.code.optimization.Tests;

public class PSO {
	
	private static double[] ff(double[][] shifts) {
		double[] target = new double[shifts.length];
		for (int i = 0; i < shifts.length; i++) {
			target[i] = Tests.func.get(shifts[i]);
		}
		return target;
	}

	public static double[] pso() {
		// initialization
		double shifts[][] = new double[Tests.dots][Tests.dims];
		double velocities[][] = new double[Tests.dots][Tests.dims];
		for (int i = 0; i < Tests.dims; i++) {
			for (int j = 0; j < Tests.dots; j++) {
				double r1 = Tests.random.nextDouble();
				shifts[j][i] = Tests.func.getUpValue()[i]
						- (Tests.func.getUpValue()[i] - Tests.func.getDnValue()[i])
						* r1;
				double r2 = Tests.random.nextDouble();
				velocities[j][i] = 1. - (1. - (-1.)) * r2;
			}
		}

		double gBest[] = new double[Tests.loop + 1]; // OneMoreValue
		double s_gBest[][] = new double[Tests.loop + 1][Tests.dims]; // OneMoreValue
		double ff[] = new double[Tests.dots];
		double s_pBest[][] = shifts.clone();
		double pBest[] = PSO.ff(shifts);

		int indice = ArrayUtils.findMinIndex(pBest);
		gBest[0] = pBest[indice];
		s_gBest[0] = shifts[indice].clone();
		// end initialization

		// algorithm
		double w = 1.;
		for (int j = 0; j < Tests.loop; j++) {
			w = Tests.W2 - ((Tests.W2 - Tests.W1) * (j + 1)) / Tests.loop;
			for (int t = 0; t < Tests.dots; t++) {
				for (int i = 0; i < Tests.dims; i++) {
					velocities[t][i] = w * velocities[t][i];
					velocities[t][i] += Tests.c1 * Tests.random.nextDouble()
							* (s_pBest[t][i] - shifts[t][i]);
					velocities[t][i] += Tests.c2 * Tests.random.nextDouble()
							* (s_gBest[j][i] - shifts[t][i]);
					shifts[t][i] = shifts[t][i] + velocities[t][i];
				}
			}
			
			// mutation
			for(int i = 0; i < Tests.nMut; i++) {
				int s_dots = Tests.random.nextInt(Tests.dots);
				int s_dim = Tests.random.nextInt(Tests.dims);
				shifts[s_dots][s_dim] = shifts[s_dots][s_dim] + shifts[s_dots][s_dim]*(2*Tests.random.nextDouble()-1);
			}

			ff = PSO.ff(shifts);

			for (int i = 0; i < Tests.dots; i++) {
				if (pBest[i] > ff[i]) {
					pBest[i] = ff[i];
					for (int d = 0; d < Tests.dims; d++) {
						s_pBest[i][d] = shifts[i][d];
					}
				}
			}

			int index = ArrayUtils.findMinIndex(pBest);
			Double min = pBest[index];

			if (gBest[j] > min) {
				gBest[j + 1] = min;
				s_gBest[j + 1] = shifts[index].clone();
			} else {
				gBest[j + 1] = gBest[j];
				s_gBest[j + 1] = s_gBest[j].clone();
			}
		}
		// end alghoritm
//		System.out.println(Arrays.toString(gBest));
		System.out.println(gBest[Tests.loop]);
		System.out.println(Arrays.toString(s_gBest[Tests.loop]));
		return s_gBest[Tests.loop];
	}
}