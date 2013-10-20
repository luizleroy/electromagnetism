package com.google.code.optimization.functions;

import java.util.ArrayList;

public class Bohachevsky extends Function {
	public Bohachevsky(int dim) {
		super(dim);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Double get(ArrayList<Double> x) {
		Integer n = x.size(); // 5 or 10
		double target = 0;
		for (Integer i = 0; i < n - 1; i++) {
			double xi = x.get(i);
			double xii = x.get(i + 1);
			double xxi = xi * xi; // x�
			double xxii = xii * xii; // (xi+1)�
			target += xxi + 2 * xxii - 0.3 * Math.cos(3 * Math.PI * xi) - 0.4
					* Math.cos(4 * Math.PI * xii) + 0.7;
		}
		return target;
	}
}
