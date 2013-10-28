package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

import com.google.code.optimization.Const;
import com.google.code.optimization.MyArrayList;

public class DesignPressureVessel extends EngFunction {
	public DesignPressureVessel(int dim) {
		super(dim);
		this.setEngUpDn();
	}

	public DesignPressureVessel() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		double x1 = x.get(0);
		double xx1 = x1 * x1;
		double x4 = x.get(3);
		double x3 = x.get(2);
		double xx3 = x3 * x3;
		double x2 = x.get(1);
		
		return 0.6224 * x1 * x3 * x4 + 1.7781 * x2 * xx3 + 3.1661 * xx1 * x4
				+ 19.84 * xx1 * x3;
	}

	@Override
	public List<Double> getRestricN(List<Double> x) {
		List<Double> target = new ArrayList<Double>(4);
		double x1 = x.get(0);
		double x2 = x.get(1);
		double x3 = x.get(2);
		double xx3 = x3 * x3;
		double xxx3 = x3 * xx3;
		double x4 = x.get(3);
		
		Double g1 = -x1 + 0.0193 * x3;
		target.add(g1);
		double g2 = -x2 + 0.00954 * x3;
		target.add(g2);
		double g3 = -Math.PI * xx3 * x4 - 4 / 3 * Math.PI * xxx3 + 1296000.0;
		target.add(g3);
		double g4 = x4 - 240;
		target.add(g4);

		return target;
	}

	@Override
	protected void setEngUpDn() {
		// FIXME validar com o artigo / Reutilizar Dn e Up em public void write()
		List<Double> pgDn = new ArrayList<Double>();
		List<Double> pgUp = new ArrayList<Double>();
		
		pgDn.add(1.);
		pgDn.add(1.);
		pgDn.add(10.);
		pgDn.add(10.);
		
		pgUp.add(99.);
		pgUp.add(99.);
		pgUp.add(200.);
		pgUp.add(200.);
		
		this.setDn(pgDn);
		this.setUp(pgUp);
	}

	public void write() {
		// FIXME validar com o artigo / Reutilizar Dn e Up em public void write()
		List<Double> x = new MyArrayList<Double>();
		for (int i = 0; i < SAMPLES; i++) {
			x.add(1 + 98 * Const.random.nextDouble());
			x.add(1 + 98 * Const.random.nextDouble());
			x.add(10 + 190 * Const.random.nextDouble());
			x.add(10 + 190 * Const.random.nextDouble());
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
