package com.google.code.optimization.functions;

import java.util.ArrayList;

public class Sphere extends Function {
	public Sphere(int dim) {
		super(dim);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Double get(ArrayList<Double> x) {
		Integer n = x.size();
		double target = 0;
		for (Integer i = 0; i < n; i++) {
			double xi = x.get(i);
			target += xi*xi;
		}
		return target;
	}
}
