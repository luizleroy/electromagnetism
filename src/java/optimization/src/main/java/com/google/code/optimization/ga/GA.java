package com.google.code.optimization.ga;

import java.util.ArrayList;
import java.util.BitSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import com.google.code.optimization.Const;
import com.google.code.optimization.functions.Function;
import com.google.code.optimization.functions.TestFunction;

public class GA {

	public static void ga() {
		int nBits = 4;
		int nPop = 10;
		int nVar = 2; // FIXME
		int nGE = 20; // FIXME
		Map<BitSet, Double> pop;
		Const.dim = 3;
		Const.sFun = "rastrigin";
		TestFunction f = Function.factoryMethod(Const.sFun);

		 pop = randomMap(f, nPop, nVar, nBits); // prefere dim, bits...
		 SortedSet<Double> fmax = new TreeSet<Double>();
		 for (int i = 0; i < nGE; i++) {
		
		 }
	}

	private static Map<BitSet, Double> randomMap(TestFunction f, int nPop,
			int dim, int bits) {
		Map<BitSet, Double> pop = new HashMap<BitSet, Double>(nPop, 1.0f);
		Double y;
		BitSet bitSet;
		int allBits = dim * bits;
		for (int i = 0; i < nPop; i++) {
			bitSet = new BitSet(allBits);
			for (int j = 0; j < allBits; j++) {
				bitSet.set(j, Const.random.nextBoolean());
			}

			y = f.get(GA.interpolation(f, bitSet, dim, bits));

			pop.put(bitSet, y);
		}
		System.out.println(pop);
		return pop;
	}

	// FIXME comparar com método implementado abaixo...
	private static Double[] interpolation(TestFunction f,
			BitSet bitSet, int dim, int bits) {
		ArrayList<Double> x = new ArrayList<Double>(dim);
		List<Double> dn = new ArrayList<Double>();/* f.getDn(); */
		dn.add(-5.12);
		dn.add(-5.12);// dn.add(-5.12);
		List<Double> up = new ArrayList<Double>();/* f.getUp(); */
		up.add(5.12);
		up.add(5.12);// up.add(5.12);
		for (int i = 0; i < dim; i++) {
			x.add(dn.get(i) + (7.) * (up.get(i) - dn.get(i))
					/ (Math.pow(2, bitSet.size()) - 1));
		}
		System.out.println("FIXME - moc getDn getUp vide x: " + x);
		return null;
	}

	public static void main(String args[]) {
		GA.ga();
	}

}

// /**
// *
// * @param b
// * @return the
// */
// public double get(BitSet chain) {
// Double target = null; // TODO null or zero?
// for (int i = 0; i < Const.dim; i++) {
// double xi = Rastrigin.getXi(chain,i);
// double xx = xi * xi;
// target = target + xx - 10 * Math.cos(2 * Math.PI * xi);
// }
// return target;
// }
//
// private static double getXi(BitSet chain, int i) {
// Double d = getDouble(chain, i);
// return 0;
// }
//
// private static double getDouble(BitSet b, int i) {
// long l[] = b.toLongArray();
// double xi = 0;
// long pot = 1;
// for (int d = 0; d < l.length; d++) {
// xi+= l[d]*pot;
// pot*=64;
// }
// return xi;
// }

// double loadFactor = 1.1; // map loadFactor default: 0.75
// int expectedKeys = (int) (10*loadFactor);
// int expectedValuesPerKey = (int) (1*loadFactor);
// ArrayListMultimap<String, Integer> multiMap =
// ArrayListMultimap.create(expectedKeys,expectedValuesPerKey);
// multiMap.put("A", 1);
// multiMap.put("B", 2);
// multiMap.put("C", 3);
// multiMap.put("D", 4);
// multiMap.put("C", 5);
// Collection<Entry<String, Integer>> c = multiMap.entries();
// Iterator<Entry<String,Integer>> it = c.iterator();
// for (int i = 0; i < multiMap.size(); i++) {
// }
// System.out.println("size " + multiMap.size());

// package com.google.code.optimization.functions;
//
// import java.io.File;
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.List;
//
// public abstract class Function {
// File f;
// public /*static final*/ Integer dim;
// protected static final int SAMPLES = 10;
// protected List<Double> up;
// protected List<Double> dn;
//
// public Function(int dim) {
// this.dim = dim;
// }
//
// public abstract List<Double> getUp();
// public abstract List<Double> getDn();
//
// public abstract void setUp(List<Double> up);
// public abstract void setDn(List<Double> dn);
//
// protected ArrayList<Double> x;
// private int flag;
//
// public abstract Double get(ArrayList<Double> x);
//
// public ArrayList<Double> getX() {
// return x;
// }
//
// public void setX(List<Double> x) {
// this.x = (ArrayList<Double>) x;
// }
//
// /**
// *
// * @param s
// * @return
// */
// public Double[] F(Double[][] s) {
// Double f[] = new Double[s.length];
// for(int i = 0; i < s.length; i++) {
// f[i] = this.get(new ArrayList<Double>(Arrays.asList(s[i])));
// setFlag(getFlag() + 1);
// }
// return f;
// }
//
// /**
// * Count function acsess
// * @return the flag
// */
// public int getFlag() {
// return flag;
// }
//
// /**
// * @param flag the flag to set
// */
// /*public*/ private void setFlag(int flag) {
// this.flag = flag;
// }
// }
