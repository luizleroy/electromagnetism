// FIXME interpret sigma alpha etc. vide Engineering Optimization Using a Simple Evolutionary Algorithm...
package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

import com.google.code.optimization.Const;
import com.google.code.optimization.MyArrayList;

public class DesignWeldedBeam extends EngFunction {
	public DesignWeldedBeam(int dim) {
		super(dim);
	}

	public DesignWeldedBeam() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		double x1 = x.get(0);
		double xx1 = x1*x1;
		double x4 = x.get(3);
		double x3 = x.get(2);
		double x2 = x.get(1);
		return 1.10471*xx1*x2 + 0.04811*x3*x4*(14.0 + x2);
	}

	@Override
	public List<Double> getRestricN(List<Double> x) {
		List<Double> target = new ArrayList<Double>(7);
		double x1 = x.get(0);
		double xx1 = x1 * x1;
		double x2 = x.get(1);
		double x3 = x.get(2);
		double x4 = x.get(3);
		
		target.add(0.);
		target.add(0.);
		Double g3 = x1 - x4;
		target.add(g3);
		Double g4 = 0.10471*xx1+0.04811*x3*x4*(14.+x2) - 5.;
		target.add(g4);
		Double g5 = 0.125 - x1;
		target.add(g5);
		target.add(0.);
		target.add(0.);

		return target;
	}

	public void write() {
		List<Double> x = new MyArrayList<Double>();
		for (int i = 0; i < SAMPLES; i++) {
			x.add(0.1 + (0.1 - 2.0) * Const.random.nextDouble());
			x.add(0.1 + (0.1 - 10.0) * Const.random.nextDouble());
			x.add(0.1 + (0.1 - 10.0) * Const.random.nextDouble());
			x.add(0.1 + (0.1 - 2.) * Const.random.nextDouble());
			this.setX(x);
			Double result = this.get((ArrayList<Double>) this.getX());
			System.out.println(x);
			System.out.print(Const.decimalFormat.format(result) + " ");
			printRestricN(x);
			System.out.println();
			System.out.println();
			x.clear();
		}
	}

	private void printRestricN(List<Double> x) {
		List<Double> print = getRestricN(x);
		for (int i = 0; i < print.size(); i++) {
			System.out.print(Const.decimalFormat.format(print.get(i)) + " ");
		}
	}
}
