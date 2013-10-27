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
		Integer n_part = 3;
		Integer iter_max = 1;
		// end parameters
		// FIXME deprecated if (iter_max < 2) {
		// System.out.println("iter_max: " + iter_max);
		// throw new RuntimeException();
		// }
		// initialization
		Double S_k[][] = new Double[n_part][test.dim];
		Double V_k[][] = new Double[n_part][test.dim];
		double VR1[][] = {
				{ 0.847084366966282, 0.389113140783706, 0.586607715830247 },
				{ 0.928803347351522, 0.292886106139751, 0.549861799431640 } };
		double VR2[][] = {
				{ 0.011139686075392, 0.370669493110883, 0.361062809692108 },
				{ 0.103179601014598, 0.991786395145330, 0.300272511043330 } };
		for (int i = 0; i < test.dim; i++) {
			for (int j = 0; j < n_part; j++) {
				double r1 = VR1[i][j];// Const.random.nextDouble();
				S_k[j][i] = lim2.get(i) - (lim2.get(i) - lim1.get(i)) * r1;
				double r2 = VR2[i][j];// Const.random.nextDouble();
				V_k[j][i] = 1. - (1. - (-1.)) * r2; // |initial speed| = 1 //
													// variation of 2
			}
		}

		Double F[] = test.F(S_k);
		Double pbest[] = F.clone();
		Double s_pbest[][] = S_k.clone();
		Double gbest[] = new Double[iter_max + 1]; // One more Value (max + 1)
													// for final iteration
													// (using next iteration)
		int indice = minIndex(pbest);
		gbest[0] = pbest[indice];
		Double s_gbest[][] = new Double[iter_max + 1][test.dim]; // for final
																	// iteration
																	// (using
																	// next
																	// iteration)
		s_gbest[0] = S_k[indice].clone();
		// end initialization

		// algorithm s -1.9479
		double w;
		for (int j = 0; j < iter_max; j++) {
			w = W2 - ((W2 - W1) * (j + 1)) / iter_max;
			Double vra[][] = {{ 0.473205694648916,   0.803342027807617}, {0.384497413710694,   0.101079769801802}, {0.773270991800537,   0.044092697604867}};
			Double vrb[][] = {{ 0.643322499508951,   0.815628945430946}, {0.292036009560372,   0.657575072099665}, {0.409592333453349,   0.919424620465677}};
			for (int t = 0; t < n_part; t++) {
				for (int i = 0; i < test.dim; i++) {
					V_k[t][i] = w * V_k[t][i];
					V_k[t][i] += c1 * vra[t][i]
							* (s_pbest[t][i] - S_k[t][i]);
					V_k[t][i] += c2 * vrb[t][i]
							* (s_gbest[j][i] - S_k[t][i]);
					S_k[t][i] = S_k[t][i] + V_k[t][i];
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
			int index = minIndex(pbest);
			Double min = pbest[index];

			// System.out.print("pbest vlalues: ");
			// for (int p = 0; p < pbest.length; p++) {
			// System.out.print(pbest[p] + " | ");
			// }
			// System.out.println();
			// System.out.println(j + " J-ésimo MIN pbest: " + index + " | "
			// + pbest[index]);

			if (gbest[j] > min) {
				gbest[j + 1] = min;
				s_gbest[j + 1] = S_k[index].clone();
			} else {
				gbest[j + 1] = gbest[j];
				s_gbest[j + 1] = s_gbest[j].clone();
			}
		}
		// end alghoritm
		System.out.print("sgbest: | ");
		for (int i = 0; i < test.dim; i++) {
			System.out.print(s_gbest[iter_max][i]);
			System.out.print(" | ");
		}
	}

	private static int minIndex(Double[] forMin) {
		int minIndex = 0;
		for (int i = 1; i < forMin.length; i++) {
			Double d = forMin[i];
			if ((d < forMin[minIndex])) {
				minIndex = i;
			}
		}
		return minIndex;
	}
}
