package com.google.code.optimization.functions;

import java.util.ArrayList;

//1.10471xx1x2 + 0.04811x3x4(14.0 + x2)
public class Function02 extends EngFunction {
	public Function02(int dim) {
		super(dim);
		// TODO Auto-generated constructor stub
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
		double x2 = x.get(1);
		return 1.10471*xx1*x2 + 0.04811*x3*x4*(14.0 + x2);
	}
}