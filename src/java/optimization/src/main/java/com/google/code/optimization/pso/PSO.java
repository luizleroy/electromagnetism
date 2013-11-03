// FIXME código COMPLETAMENTE funcional e validado
// CORRIGIR ERROS DE ADAPTAÇÃO !!!


//package com.google.code.optimization.pso;
//
//import java.util.ArrayList;
//
//import com.google.code.optimization.Const;
//import com.google.code.optimization.functions.DesignWeldedBeam;
//import com.google.code.optimization.functions.Function;
//import com.google.code.optimization.functions.Rastrigin;
//
//public class PSO {
//	public static void pso() {
//		// parameters
//		// FIXME: como validar as funçoes de engenharia? Existe um ótimo mais próximo?
//		Function test = new DesignWeldedBeam();
//		ArrayList<Double> lim1 = (ArrayList<Double>) test.getDn();
//		ArrayList<Double> lim2 = (ArrayList<Double>) test.getUp();
//		double c1 = 1.0;
//		double c2 = 0.6;
//		double W1 = 0.1;
//		double W2 = 1.1;
//		Integer n_part = 5400; // time is biasness: 420
//		Integer iter_max = 1800; // time is biasness: 120
//		// end parameters
//
//		// initialization
//		Double S_k[][] = new Double[n_part][test.dim];
//		Double V_k[][] = new Double[n_part][test.dim];
//		for (int i = 0; i < test.dim; i++) {
//			for (int j = 0; j < n_part; j++) {
//				double r1 = Const.random.nextDouble();
//				S_k[j][i] = lim2.get(i) - (lim2.get(i) - lim1.get(i)) * r1;
//				double r2 = Const.random.nextDouble();
//				V_k[j][i] = 1. - (1. - (-1.)) * r2; // |initial speed| = 1 //
//													// variation of 2
//			}
//		}
//
//		Double F[] = test.F(S_k);
//		Double pbest[] = F.clone();
//		Double s_pbest[][] = S_k.clone();
//		Double gbest[] = new Double[iter_max + 1]; // One more Value (max + 1)
//													// for final iteration
//													// (using next iteration)
//		int indice = minIndex(pbest);
//		gbest[0] = pbest[indice];
//		Double s_gbest[][] = new Double[iter_max + 1][test.dim]; // for final
//																	// iteration
//																	// (using
//																	// next
//																	// iteration)
//		s_gbest[0] = S_k[indice].clone();
//		// end initialization
//
//		// algorithm
//		double w;
//		for (int j = 0; j < iter_max; j++) {
//			w = W2 - ((W2 - W1) * (j + 1)) / iter_max;
//			for (int t = 0; t < n_part; t++) {
//				for (int i = 0; i < test.dim; i++) {
//					V_k[t][i] = w * V_k[t][i];
//					V_k[t][i] += c1 * Const.random.nextDouble()
//							* (s_pbest[t][i] - S_k[t][i]);
//					V_k[t][i] += c2 * Const.random.nextDouble()
//							* (s_gbest[j][i] - S_k[t][i]);
//					S_k[t][i] = S_k[t][i] + V_k[t][i];
//				}
//			}
//
//			F = test.F(S_k);
//
//			for (int i = 0; i < n_part; i++) {
//				if (pbest[i] > F[i]) {
//					pbest[i] = F[i];
//					for (int d = 0; d < test.dim; d++) {
//						s_pbest[i][d] = S_k[i][d];
//					}
//				}
//			}
//			int index = minIndex(pbest);
//			Double min = pbest[index];
//
//			// System.out.print("pbest vlalues: ");
//			// for (int p = 0; p < pbest.length; p++) {
//			// System.out.print(pbest[p] + " | ");
//			// }
//			// System.out.println();
//			// System.out.println(j + " J-ésimo MIN pbest: " + index + " | "
//			// + pbest[index]);
//
//			if (gbest[j] > min) {
//				gbest[j + 1] = min;
//				s_gbest[j + 1] = S_k[index].clone();
//			} else {
//				gbest[j + 1] = gbest[j];
//				s_gbest[j + 1] = s_gbest[j].clone();
//			}
//		}
//		// end alghoritm
//		System.out.print("sgbest: | ");
//		for (int i = 0; i < test.dim; i++) {
//			System.out.print(Const.decimalFormat.format(s_gbest[iter_max][i]));
//			System.out.print(" | ");
//		}
//		System.out.println("acsess: " + test.getFlag());
//	}
//
//	private static int minIndex(Double[] forMin) {
//		int minIndex = 0;
//		for (int i = 1; i < forMin.length; i++) {
//			Double d = forMin[i];
//			if ((d < forMin[minIndex])) {
//				minIndex = i;
//			}
//		}
//		return minIndex;
//	}
//}