package com.google.code.optimization.functions;

import java.util.ArrayList;

public class G3 extends EngFunction {
	public G3(int dim) {
		super(dim);
	}

	public G3() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (4 != x.size()) {
		throw new RuntimeException();
		}
		double x3 = x.get(2);
		double xx3 = x3*x3;
		double xxx3 = x3*xx3;
		double x4 = x.get(3);
		return -Math.PI*xx3*x4-4/3*Math.PI*xxx3+1296000.0;
	}
}