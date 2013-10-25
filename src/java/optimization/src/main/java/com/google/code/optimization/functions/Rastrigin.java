package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

public class Rastrigin extends Function {
	public Rastrigin(int dim) {
		super(dim);
	}
	
	public Rastrigin(int dim, Double u) {
		super(dim);
		List<Double> pgDn = new ArrayList<Double>();
		List<Double> pgUp = new ArrayList<Double>();
		for(int i = 0; i < dim; i++) {
			pgDn.add(-1*Math.abs(u));
			pgUp.add(Math.abs(u));
		}
		this.setDn(pgDn);
		this.setUp(pgUp);
	}

	@Override
	public Double get(ArrayList<Double> x) {
		Integer n = x.size();
		Double target = (double) (10 * n);
		for (int i = 0; i < n; i++) {
			double xi = x.get(i);
			double xx = xi * xi;
			target = target + xx - 10 * Math.cos(2 * Math.PI * xi);
		}
		return target;
	}
}
