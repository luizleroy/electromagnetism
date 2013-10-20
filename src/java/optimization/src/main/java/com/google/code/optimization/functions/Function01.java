package com.google.code.optimization.functions;

import java.util.ArrayList;

public class Function01 extends EngFunction {
	public Function01(int dim) {
		super(dim);
	}

	public Function01() {
		this(4);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		if (4 != x.size()) {
		throw new RuntimeException();
		}
		double x1 = x.get(0);
		double xx1 = x1*x1;
		double x4 = x.get(3);
		double x3 = x.get(2);
		double xx3 = x3*x3;
		double x2 = x.get(1);
		return 0.6224*x1 *x3*x4  + 1.7781*x2 *xx3 + 3.1661*xx1 *x4 + 19.84*xx1*x3;
	}
}