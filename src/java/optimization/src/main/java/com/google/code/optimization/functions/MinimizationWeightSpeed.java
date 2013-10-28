package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

import com.google.code.optimization.Const;
import com.google.code.optimization.MyArrayList;

public class MinimizationWeightSpeed extends EngFunction {
	public MinimizationWeightSpeed(int dim) {
		super(dim);
		this.setEngUpDn();
	}

	public MinimizationWeightSpeed() {
		this(7);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		double x1 = x.get(0);
		double x2 = x.get(1);
		double xx2 = x2 * x2;
		double x3 = x.get(2);
		double xx3 = x3 * x3;
		double x4 = x.get(3);
		double x5 = x.get(4);
		double x6 = x.get(5);
		double xx6 = x6 * x6;
		double x7 = x.get(6);
		double xx7 = x7 * x7;
		// cubic
		double xxx6 = xx6 * x6;
		double xxx7 = xx7 * x7;

		return 0.7854 * x1 * xx2 * (3.3333 * xx3 + 14.9334 * x3 - 43.0934)
				- 1.508 * x1 * (xx6 + xx7) + 7.4777 * (xxx6 + xxx7) + 0.7854
				* (x4 * xx6 + x5 * xx7);
	}

	@Override
	public List<Double> getRestricN(List<Double> x) {
		List<Double> target = new ArrayList<Double>(11);
		double x1 = x.get(0);
		double x2 = x.get(1);
		double xx2 = x2 * x2;
		double x3 = x.get(2);
		double xx3 = x3 * x3;
		double x4 = x.get(3);
		double xx4 = x1 * x1;
		double x5 = x.get(4);
		double xx5 = x5 * x5;
		double x6 = x.get(5);
		double xx6 = x6 * x6;
		double x7 = x.get(6);
		double xx7 = x7 * x7;
		double xxx4 = xx4 * x4;
		double xxx5 = xx5 * x5;
		double xxx6 = xx6 * x6;
		double xxx7 = xx7 * x7;
		double xxxx7 = xxx7 * x7;

		Double g1 = 27 / (x1 * xx2 * x3) - 1;
		target.add(g1);
		Double g2 = 397.5000 / (x1 * xx2 * xx3);
		target.add(g2);
		Double g3 = 1.9300 * xxx4 / (x1 * xx2 * xx3) - 1;
		target.add(g3);
		Double g4 = 1.9300 * xxx5 / (x2 * x3 * xxxx7) - 1;
		target.add(g4);
		Double g5 = Math
				.sqrt(((745 * x4 / x2 / x3) * (745 * x4 / x2 / x3) + 16.9 * 1000000))
				/ (110.0 * xxx6) - 1;
		target.add(g5);
		Double g6 = Math
				.sqrt(((745 * x5 / x2 / x3) * (745 * x5 / x2 / x3) + 157.5 * 1000000))
				/ (85.0 * xxx7) - 1;
		target.add(g6);
		Double g7 = x2 * x3 / 40. - 1;
		target.add(g7);
		Double g8 = 5 * x2 / x1 - 1;
		target.add(g8);
		Double g9 = x1 / 12 / x2 - 1;
		target.add(g9);
		Double g10 = (1.5 * x6 + 1.9) / x4 - 1;
		target.add(g10);
		Double g11 = (1.1 * x7 + 1.9) / x5 - 1;
		target.add(g11);

		return target;
	}
	
	@Override
	protected void setEngUpDn() {
		List<Double> pgDn = new ArrayList<Double>();
		List<Double> pgUp = new ArrayList<Double>();
		
		pgDn.add(2.6);
		pgDn.add(0.7);
		pgDn.add(17.);
		pgDn.add(7.3);
		pgDn.add(7.8);
		pgDn.add(2.9);
		pgDn.add(5.);
		
		pgUp.add(3.6);
		pgUp.add(0.8);
		pgUp.add(28.);
		pgUp.add(8.3);
		pgUp.add(8.3);
		pgUp.add(3.9);
		pgUp.add(5.5);
		
		this.setDn(pgDn);
		this.setUp(pgUp);
	}

	public void write() {
		List<Double> x = new MyArrayList<Double>();
		for (int i = 0; i < SAMPLES; i++) {
			x.add(this.getDn().get(0) + (this.getUp().get(0) - this.getDn().get(0)) * Const.random.nextDouble());
			x.add(this.getDn().get(1) + (this.getUp().get(1) - this.getDn().get(1)) * Const.random.nextDouble());
			x.add(this.getDn().get(2) + (this.getUp().get(2) - this.getDn().get(2)) * Const.random.nextDouble());
			x.add(this.getDn().get(3) + (this.getUp().get(3) - this.getDn().get(3)) * Const.random.nextDouble());
			x.add(this.getDn().get(4) + (this.getUp().get(4) - this.getDn().get(4)) * Const.random.nextDouble());
			x.add(this.getDn().get(5) + (this.getUp().get(5) - this.getDn().get(5)) * Const.random.nextDouble());
			x.add(this.getDn().get(6) + (this.getUp().get(6) - this.getDn().get(6)) * Const.random.nextDouble());
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
