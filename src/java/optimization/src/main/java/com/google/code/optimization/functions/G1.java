package com.google.code.optimization.functions;

import java.util.ArrayList;

public class G1 extends EngFunction {
	public G1(int dim) {
		super(dim);
	}

	public G1() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (4 != x.size()) {
		throw new RuntimeException();
		}
		double x1 = x.get(0);
		double x3 = x.get(2);
		return -x1 + 0.0193*x3;
	}
}