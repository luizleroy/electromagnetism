package com.google.code.optimization.functions;

import java.util.ArrayList;
import java.util.List;

public class Bohachevsky extends Function {
	public Bohachevsky(int dim) {
		super(dim);
		this.setUpDn();
	}

	@Override
	public Double get(ArrayList<Double> x) {
		Integer n = x.size();
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
	

	@Override
	public List<Double> getUp() {
		return up;
	}

	@Override
	public List<Double> getDn() {
		return dn;
	}

	@Override
	public void setUp(List<Double> up) {
		this.up = up;
	}

	@Override
	public void setDn(List<Double> dn) {
		this.dn = dn;
	}
	
	private void setUpDn() {
		double u = 1.;
		List<Double> pgDn = new ArrayList<Double>();
		List<Double> pgUp = new ArrayList<Double>();
		for(int i = 0; i < dim; i++) {
			pgDn.add(-1*Math.abs(u));
			pgUp.add(Math.abs(u));
		}
		this.setDn(pgDn);
		this.setUp(pgUp);
	}
}
