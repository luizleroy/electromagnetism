package com.google.code.optimization.functions;

import com.google.code.optimization.Tests;

public class Schwefel_3 implements TestFunction {
	private static final double modInit = 5.;

	private double[] dnValue = new double[Tests.dims];
	private double[] upValue = new double[Tests.dims];
	private double[] optimum = new double[Tests.dims];
	private long counter;

	Schwefel_3() {
		this.setDnValue();
		this.setUpValue();
		this.setOptimum();
		this.counter = 0L;
	}

	private void setDnValue() {
		this.init(this.dnValue, -modInit);
	}

	@Override
	public double[] getDnValue() {
		return this.dnValue;
	}

	private void setUpValue() {
		this.init(this.upValue, modInit);
	}

	@Override
	public double[] getUpValue() {
		return this.upValue;
	}

	private void setOptimum() {
		this.init(this.optimum, -modInit);
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	private void init(double t[], double val) {
		for (int i = 0; i < Tests.dims; i++) {
			t[i] = val;
		}
	}

	@Override
	public double get(double[] x) {
		Integer n = Tests.dims;
		double target = 0;
		double cum = 0;
		for (Integer i = 0; i < n - 1; i++) {
			cum += x[i];
			target += cum*cum;
		}
		this.counter++;
		return target;
	}
	
	@Override
	public void resetCounter() {
		counter = 0L;
	}

	@Override
	public long getCounter() {
		return counter;
	}
}