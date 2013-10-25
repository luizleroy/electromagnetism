package com.google.code.optimization.pso;

import java.util.ArrayList;

import com.google.code.optimization.Const;
import com.google.code.optimization.functions.Function;
import com.google.code.optimization.functions.Rastrigin;

public class PSO {
	public static void psoEXE() {
		// parameters
		Function test = new Rastrigin(2, -5.12);
		ArrayList<Double> lim1 = (ArrayList<Double>) test.getDn();
		ArrayList<Double> lim2 = (ArrayList<Double>) test.getUp();
		double c1 = 1.3;
		double c2 = 0.5;
		double W1 = 0.1;
		double W2 = 1.1;
		Integer n_part = 5000;
		Integer iter_max = 1000;
		// end parameters

		// initialization
		Double S_k[][] = new Double[n_part][test.dim];
		Double V_k[][] = new Double[n_part][test.dim];
		for (int i = 0; i < test.dim; i++) {
			for (int j = 0; j < n_part; j++) {
				S_k[j][i] = lim2.get(i) - (lim2.get(i) - lim1.get(i))
						* Const.random.nextDouble();
				V_k[j][i] = lim2.get(i) - (lim2.get(i) - lim1.get(i))
						* Const.random.nextDouble();
			}
		}

		Double F[] = test.F(S_k);
		Double pbest[] = F.clone();
		Double s_pbest[][] = S_k.clone();
		int rand = Const.random.nextInt(n_part);
		Double gbest[] = new Double[iter_max];
		gbest[0] = pbest[rand];
		Double s_gbest[][] = new Double[iter_max][test.dim];
		s_gbest[0] = S_k[rand];
		// end initialization

		// algorithm
		double w;
		Double s[][] = new Double[n_part][test.dim];
		for (int j = 0; j < iter_max - 1; j++) {
			w = W2 - ((W2 - W1) * j) / iter_max;

			for (int t = 0; t < n_part; t++) {
				for (int i = 0; i < test.dim; i++) {
					V_k[t][i] = w * V_k[t][i] + c1 * Const.random.nextDouble()
							* (s_pbest[t][i] - S_k[t][i]) + c2
							* Const.random.nextDouble()
							* (s_gbest[j][i] - S_k[t][i]);
					s[t][i] = S_k[t][i] + V_k[t][i];
				}
			}

			F = test.F(S_k);

			for (int i = 0; i < n_part; i++) {
				if (pbest[i] > F[i]) {
					pbest[i] = F[i];
					for (int d = 0; d < test.dim; d++) {
						s_pbest[i][d] = S_k[i][d];
					}
				}
			}
			int minIndex = 0;
			for (int i = 1; i < pbest.length; i++) {
				Double d = pbest[i];
				if ((d < pbest[minIndex])) {
					minIndex = i;
				}
			}
			int index = 0;
			Double min = pbest[index];
			System.out.println(j + " J-ésimo PBEST: " + index + " | " + pbest[index]);
			if (gbest[j] > min) {
				gbest[j + 1] = min;
				s_gbest[j + 1] = S_k[index].clone();
			} else {
				gbest[j + 1] = gbest[j];
				s_gbest[j + 1] = s_gbest[j].clone();
			}
		}
		// end alghoritm
		for(int i = 0; i < test.dim; i++) {
			System.out.print(s_gbest[iter_max][i]);
			System.out.print(" | ");
		}
		System.out.println();
	}
}
