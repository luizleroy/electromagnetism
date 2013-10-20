package com.google.code.optimization.functions;

import java.util.ArrayList;

public class G2 extends EngFunction {
	public G2(int dim) {
		super(dim);
	}

	public G2() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (4 != x.size()) {
		throw new RuntimeException();
		}
		double x2 = x.get(1);
		double x3 = x.get(2);
		return -x2 + 0.00954*x3;
	}
}