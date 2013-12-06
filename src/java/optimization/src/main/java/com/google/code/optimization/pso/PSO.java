package com.google.code.optimization.pso;

import com.google.code.optimization.ArrayUtils;
import com.google.code.optimization.Tests;

public class PSO {

	public static double[] pso() {
		// initialization
		double shifts[][] = new double[Tests.dots][Tests.dims];
		double velocities[][] = new double[Tests.dots][Tests.dims];
		
		for (int i = 0; i < Tests.dims; i++) {
			for (int j = 0; j < Tests.dots; j++) {
				double r1 = Tests.random.nextDouble();
				shifts[j][i] = Tests.func.getUpValue()[i]
						- (Tests.func.getUpValue()[i] - Tests.func.getDnValue()[i]) * r1;
				double r2 = Tests.random.nextDouble();
				velocities[j][i] = 1. - (1. - (-1.)) * r2;
			}
		}

		double ff[] = new double[Tests.dots];
		double pbest[] = PSO.ff(shifts);
		double sPBest[][] = shifts.clone();
		
		// for final iteration (USING IEAT next iteration!!!)
		double gbest[] = new double[Tests.loop + 1]; // OneMoreValue
		double sGBest[][] = new double[Tests.loop + 1][Tests.dims]; // OneMoreValue
		int indice = ArrayUtils.findMinIndex(pbest);
		gbest[0] = pbest[indice];
		sGBest[0] = shifts[indice].clone();
		// end initialization

		// algorithm
		double w;
		for (int j = 0; j < Tests.loop; j++) {
			w = Tests.W2 - ((Tests.W2 - Tests.W1) * (j + 1)) / Tests.loop;
			for (int t = 0; t < Tests.dots; t++) {
				for (int i = 0; i < Tests.dims; i++) {
					velocities[t][i] = w * velocities[t][i];
					velocities[t][i] += Tests.c1 * Tests.random.nextDouble()
							* (sPBest[t][i] - shifts[t][i]);
					velocities[t][i] += Tests.c2 * Tests.random.nextDouble()
							* (sGBest[j][i] - shifts[t][i]);
					shifts[t][i] = shifts[t][i] + velocities[t][i];
				}
			}

			ff = PSO.ff(shifts);

			for (int i = 0; i < Tests.dots; i++) {
				if (pbest[i] > ff[i]) {
					pbest[i] = ff[i];
					for (int d = 0; d < Tests.dims; d++) {
						sPBest[i][d] = shifts[i][d];
					}
				}
			}
			
			int index = ArrayUtils.findMinIndex(pbest);
			Double min = pbest[index];

			if (gbest[j] > min) {
				gbest[j + 1] = min;
				sGBest[j + 1] = shifts[index].clone();
			} else {
				gbest[j + 1] = gbest[j];
				sGBest[j + 1] = sGBest[j].clone();
			}
		}
		// end alghoritm
		return sGBest[Tests.loop];
	}

	private static double[] ff(double[][] shifts) {
		double[] target = new double[shifts.length];
		for (int i = 0; i < shifts.length; i++) {
			target[i] = Tests.func.get(shifts[i]);
		}
		return target;
	}
}