package com.google.code.optimization.functions;

import java.io.File;
import java.util.ArrayList;

public class Rastrigin extends Function {
	public Rastrigin(int dim) {
		super(dim);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Double get(ArrayList<Double> x) {
		Integer n = x.size(); // 5 or 10
		Double target = (double) (10 * n);
		for (int i = 0; i < n; i++) {
			double xi = x.get(i);
			double xx = xi * xi;
			target = target + xx - 10 * Math.cos(2 * Math.PI * xi);
		}
		return target;
	}

	public File createFile() {
		return null;
	}
}
