package com.google.code.optimization.ga;

import java.util.Arrays;
import java.util.BitSet;

import com.google.code.optimization.Tests;

public class GA {

	public static double[] ga() {
		BitSet list[] = new BitSet[Tests.dots];
		randomBitSet(list);
		BitSet best = new BitSet(Tests.bits);
		randomBitSet(best);
		for (int i = 0; i < Tests.loop; i++) {
			BitSet bitSetA = list[i%Tests.dots];
			int selector = Tests.random.nextInt(Tests.dots);
			BitSet bitSetB = list[selector];
			double a = inv(Tests.func.get(interpolation(bitSetA)));
			double b = inv(Tests.func.get(interpolation(bitSetB)));
			if (a > b) {
				list[selector] = bitSetA;
			}
			
			if (Tests.random.nextFloat() < Tests.pc) {
				int cross = Tests.random.nextInt(Tests.dots);
				bitSetB = list[cross];
				int ptoCrossover = Tests.random.nextInt(Tests.bits); // fenótipo X cromossomo
				for (int j = 0; j < ptoCrossover; j++) {
					bitSetB.set(j, bitSetA.get(j));
				}
			}
			
			if (Tests.random.nextFloat() < Tests.pm) {
				bitSetA.flip(Tests.random.nextInt(Tests.bits));
			}
			//Arrays.sort(T[] arg0, Comparator <? super T> arg1)
			int index = findMaxIndexByValue(list);
			if (inv(Tests.func.get(interpolation(list[index]))) > inv(Tests.func.get(interpolation(best)))) {
				best =  list[index];
			}
		}
		double interpolation[] = interpolation(best);
		System.out.println(Arrays.toString(interpolation));
		return interpolation;
	}
	
	private static int findMaxIndexByValue(BitSet[] list) {
		int maxIndex = 0;
		double maxValue = inv(Tests.func.get(interpolation(list[maxIndex])));
		for (int i = 1; i < list.length; i++) {
			double d = inv(Tests.func.get(interpolation(list[i])));
			if (d > maxValue) {
				maxIndex = i;
				maxValue = d;
			}
		}
		return maxIndex;
	}

	private static Double inv(Double phi) {
		return (1. / (phi + 1e-16));
	}

	private static void randomBitSet(BitSet list[]) {
		for (int i = 0; i < Tests.dots; i++) {
			list[i] = new BitSet(Tests.bits);
			randomBitSet(list[i]);
		}
	}

	private static void randomBitSet(BitSet chain) {
		for (int i = 0; i < Tests.bits; i++) {
			chain.set(i, Tests.random.nextBoolean());
		}
	}

	// TODO for learn (pensar): big string bits (more than short) ??? And, bits that go to trash?
	private static double[] interpolation(BitSet chain) {
		short bitsXi = Tests.bits/Tests.dims;
		double x[] = new double[Tests.dims];
		double pow = Math.pow(2.,bitsXi);
		BitSet bitSet;
		for (int i = 0; i < Tests.dims; i++) {
			bitSet = chain.get(bitsXi * i, bitsXi * (i + 1));
			double bitSet2Long = bitSet.length() == 0 ? 0 : bitSet.toLongArray()[0];
			x[i] = Tests.func.getDnValue()[i] + (bitSet2Long)/(pow)*(Tests.func.getUpValue()[i] - Tests.func.getDnValue()[i]);
		}
		return x;
	}
}