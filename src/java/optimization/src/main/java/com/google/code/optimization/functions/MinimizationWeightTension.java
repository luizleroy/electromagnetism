package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

import com.google.code.optimization.Const;
import com.google.code.optimization.MyArrayList;

public class MinimizationWeightTension extends EngFunction {
	public MinimizationWeightTension(int dim) {
		super(dim);
	}

	public MinimizationWeightTension() {
		this(3);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		double x1 = x.get(0);
		double x2 = x.get(1);
		double x3 = x.get(2);
		return (x3+2)*x2*x1;
	}

	@Override
	public List<Double> getRestricN(List<Double> x) {
		List<Double> target = new ArrayList<Double>(4);
		double x1 = x.get(0);
		double x2 = x.get(1);
		double xx2 = x2 * x2;
		double xxx2 = xx2 * x2;
		double x3 = x.get(2);
		double xx3 = x3 * x3;
		double xxx3 = xx3 * x3;
		double xxxx3 = xxx3 * x3;

		Double g1 = 1 - xxx2*x3/71785/x2;
		target.add(g1);
		Double g2 = 4*xx2-x1*x2/12566/(x2*xxx3-xxxx3);
		target.add(g2);
		Double g3 = 1 - 140.45*x1/xx2/x3;
		target.add(g3);
		Double g4 = (x1 + x2)/1.5 - 1;
		target.add(g4);

		return target;
	}

	public void write() {
		List<Double> x = new MyArrayList<Double>();
		for (int i = 0; i < SAMPLES; i++) {
			x.add(0.05 + (2. - 0.05) * Const.random.nextDouble());
			x.add(0.25 + (1.3 - 0.25) * Const.random.nextDouble());
			x.add(2. + (15. - 2.) * Const.random.nextDouble());
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
