package com.google.code.optimization.pso;

import com.google.code.optimization.Const;
import com.google.code.optimization.functions.Function;
import com.google.code.optimization.functions.TestFunction;

public class PSO {

	private static TestFunction function;
	// parameters
	private static final double c1 = 0.8; // gbest
	private static final double c2 = 0.6; // pbest
	private static final double W1 = 0.1;
	private static final double W2 = 1.1;
	// end parameters

	public static double[] pso() {
		function = Function.factoryMethod(Const.sFun);
		// initialization
		long initialTime = System.currentTimeMillis();
		double shifts[][] = new double[Const.dots][Const.dims];
		double velocities[][] = new double[Const.dots][Const.dims];
		
		for (int i = 0; i < Const.dims; i++) {
			// FIXME: pensar, deve ser Const.dims X Const.dots ?
			for (int j = 0; j < Const.dots; j++) {
				double r1 = Const.random.nextDouble();
				shifts[j][i] = function.getUpValue()[i]
						- (function.getUpValue()[i] - function.getDnValue()[i]) * r1;
				double r2 = Const.random.nextDouble();
				velocities[j][i] = 1. - (1. - (-1.)) * r2;
			}
		}

		double ff[] = PSO.ff(shifts);
		double pbest[] = ff.clone();
		double sPBest[][] = shifts.clone();
		// for final iteration (USING IEAT next iteration!!!)
		double gbest[] = new double[Const.loop + 1]; // OneMoreValue
		double sGBest[][] = new double[Const.loop + 1][Const.dims]; // OneMoreValue
		int indice = finMinIndex(pbest);
		gbest[0] = pbest[indice];
		sGBest[0] = shifts[indice].clone();
		// end initialization

		// algorithm
		double w;
		for (int j = 0; j < Const.loop; j++) {
			w = W2 - ((W2 - W1) * (j + 1)) / Const.loop;
			for (int t = 0; t < Const.dots; t++) {
				for (int i = 0; i < Const.dims; i++) {
					velocities[t][i] = w * velocities[t][i];
					velocities[t][i] += c1 * Const.random.nextDouble()
							* (sPBest[t][i] - shifts[t][i]);
					velocities[t][i] += c2 * Const.random.nextDouble()
							* (sGBest[j][i] - shifts[t][i]);
					shifts[t][i] = shifts[t][i] + velocities[t][i];
				}
			}

			ff = PSO.ff(shifts);

			for (int i = 0; i < Const.dots; i++) {
				if (pbest[i] > ff[i]) {
					pbest[i] = ff[i];
					for (int d = 0; d < Const.dims; d++) {
						sPBest[i][d] = shifts[i][d];
					}
				}
			}
			int index = finMinIndex(pbest);
			Double min = pbest[index];

			if (gbest[j] > min) {
				gbest[j + 1] = min;
				sGBest[j + 1] = shifts[index].clone();
			} else {
				gbest[j + 1] = gbest[j];
				sGBest[j + 1] = sGBest[j].clone();
			}
		}
		long finalTime = System.currentTimeMillis();
		// end alghoritm
		
		// mean squared error
		double mse = 0.;
		for (int i = 0; i < Const.dims; i++) {
			mse += Math.pow((sGBest[Const.loop][i] - function.getOptimum()[i]), 2);
		}
		mse = Math.sqrt(mse);
//		 System.out.println("-------");
//		 for (int i = 0; i < Const.dims; i++) {
//		 System.out.print(Const.decimalFormat.format(sGBest[Const.loop][i]));
//		 System.out.print(" | ");
//		 }
//		 System.out.println("-------");
		double[] result = { (double) (finalTime - initialTime), function.getCounter(), mse };
		return result;
	}

	private static double[] ff(double[][] shifts) {
		double[] target = new double[shifts.length];
		for (int i = 0; i < shifts.length; i++) {
			target[i] = function.get(shifts[i]);
		}
		return target;
	}

	private static int finMinIndex(double[] forMin) {
		int minIndex = 0;
		for (int i = 1; i < forMin.length; i++) {
			double d = forMin[i];
			if ((d < forMin[minIndex])) {
				minIndex = i;
			}
		}
		return minIndex;
	}
}