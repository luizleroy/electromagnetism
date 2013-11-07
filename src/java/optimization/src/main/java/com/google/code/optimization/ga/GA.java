package com.google.code.optimization.ga;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.code.optimization.Const;
import com.google.code.optimization.functions.Function;
import com.google.code.optimization.functions.TestFunction;


public class GA {

	private static final int sBits = 16;
	private static final float pc = 0.6f;
	private static final float pm = 0.5f;
	private static final int nPop = Const.dots;
	private static final int nGE = Const.loop;
	private static final TestFunction func = Function.factoryMethod(Const.sFun);
	private static final int sChain = sBits * Const.dims;

	private static Map<BitSet, Double> map;
	private static List<BitSet> list;

	public static double[] ga() {
		map = new HashMap<BitSet, Double>();
		list = new ArrayList<BitSet>();
		// initialization
		long initialTime = System.currentTimeMillis();
		GA.random();
		for (int i = 0; i < GA.nGE; i++) {
			GA.selection();
			GA.crosover();
			GA.mutation();
		}
		// end alghoritm
		long finalTime = System.currentTimeMillis();
		double mse = 0.;
		Double max = Collections.max(map.values());
		// FIXME FIXME FIXME estudar como trabalhar com a estrutura: deve-se
		// consumi-la da memória? Teste seu tamanho!
		BitSet chain = getFirstKeyByValue(max);
		double[] best = interpolation(chain);
		for (int i = 0; i < Const.dims; i++) {
			mse += Math.pow((best[i] - func.getOptimum()[i]), 2);
		}
		mse = Math.sqrt(mse);
		double[] result = { (double) (finalTime - initialTime), func.getCounter(), mse };
		map.clear();
		list.clear();
		return result;
	}

	private static BitSet getFirstKeyByValue(Double max) {
		BitSet bs = null;
		for (Entry<BitSet, Double> entry : map.entrySet()) {
			if (max.equals(entry.getValue())) {
				bs = entry.getKey();
				break;
			}
		}
		return bs;
	}

	private static void mutation() {
		int numMutation = (int) (GA.nPop * GA.pm);
		for (int i = 0; i < numMutation; i++) {
			int index = Const.random.nextInt(GA.nPop);
			BitSet bitSet = list.get(index);
			bitSet.flip(Const.random.nextInt(GA.sChain));
			Double d = GA.map.get(bitSet);
			if (d == null) {
				d = GA.inv(GA.func.get(GA.interpolation(bitSet)));
				GA.map.put(bitSet, d);
			}
			list.set(index, bitSet);
		}
	}

	private static void crosover() {
		int numCrossover = (int) (GA.nPop * GA.pc);
		for (int i = 0; i < numCrossover; i++) {
			BitSet bitSetI = (BitSet) (list.get(Const.random.nextInt(GA.nPop)))
					.clone();
			BitSet bitSetII = (BitSet) list.get(Const.random.nextInt(GA.nPop))
					.clone();
			int ptoCrossover = Const.random.nextInt(GA.sChain);
			for (int j = 0; j < ptoCrossover; j++) {
				bitSetI.set(j, bitSetII.get(j));
			}
			for (int j = ptoCrossover + 1; j < GA.sChain; j++) {
				bitSetII.set(j, bitSetI.get(j));
			}
			Double II = GA.map.get(bitSetII);
			if (II == null) {
				II = GA.inv(GA.func.get(GA.interpolation(bitSetII)));
				GA.map.put(bitSetII, II);
			}
			Double I = GA.map.get(bitSetI);
			if (I == null) {
				I = GA.inv(GA.func.get(GA.interpolation(bitSetI)));
				GA.map.put(bitSetI, I);
			}
			list.add(bitSetI);
			list.add(bitSetII);
		}
	}

	private static Double inv(Double phi) {
		return (1. / (phi + 1e-16));
	}

	private static void selection() {
		int qtdCross = GA.nPop / 2;
		for (int i = 0; i < qtdCross; i++) {
			int iI = Const.random.nextInt(GA.nPop);
			BitSet bitSetI = list.get(iI);
			Double I = GA.map.get(bitSetI);
			if (I == null) {
				I = GA.inv(GA.func.get(GA.interpolation(bitSetI)));
				GA.map.put(bitSetI, I);
			}
			int iII = Const.random.nextInt(GA.nPop);
			BitSet bitSetII = list.get(iII);
			Double II = GA.map.get(bitSetII);
			if (II == null) {
				II = GA.inv(GA.func.get(GA.interpolation(bitSetII)));
				GA.map.put(bitSetII, II);
			}
			if (I > II) {
				list.add(iII, bitSetI);
				if (!list.contains(iII)) {
					map.remove(bitSetII);
				}
			} else {
				list.add(iI, bitSetII);
				if (!list.contains(iI)) {
					map.remove(bitSetI);
				}
			}
		}
	}

	private static void random() {
		for (int i = 0; i < GA.nPop; i++) {
			BitSet chain = randomBitSet(GA.sChain);
			GA.map.put(chain, GA.inv(GA.func.get(GA.interpolation(chain))));
			GA.list.add(chain);
		}
	}

	private static List<BitSet> randomList() {
		for (int i = 0; i < GA.nPop; i++) {
			BitSet chain = randomBitSet(GA.sChain);
			GA.list.add(chain);
		}
		return GA.list;
	}

	private static BitSet randomBitSet(int allBits) {
		BitSet chain = new BitSet(allBits);
		for (int j = 0; j < allBits; j++) {
			chain.set(j, Const.random.nextBoolean());
		}
		return chain;
	}

	private static double[] interpolation(BitSet chain) {
		double x[] = new double[Const.dims];
		BitSet bitSet;
		double tBitsMinus1 = Math.pow(2, GA.sBits) - 1;
		for (int i = 0; i < Const.dims; i++) {
			bitSet = chain.get(GA.sBits * i, GA.sBits * (i + 1));
			x[i] = func.getDnValue()[i] + GA.bitSet2Double(bitSet)
					* (func.getUpValue()[i] - func.getDnValue()[i]) / tBitsMinus1;
		}
		return x;
	}

	private static double bitSet2Double(BitSet bitSet) {
		// TODO 4 optimization: convert to long array (base 64)
		double target = 0;
		double pow = 1;
		for (int i = 0; i < bitSet.length(); i++) {
			if (bitSet.get(i)) {
				target += pow;
			}
			pow *= 2;
		}
		return target;
	}
}