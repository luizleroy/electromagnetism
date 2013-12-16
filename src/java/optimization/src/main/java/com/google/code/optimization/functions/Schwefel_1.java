package com.google.code.optimization.functions;

import com.google.code.optimization.Tests;

public class Schwefel_1 implements TestFunction {
	private static final double modInit = 5.12;

	private double[] dnValue = new double[Tests.dims];
	private double[] upValue = new double[Tests.dims];
	private double[] optimum = new double[Tests.dims];
	private long counter;

	Schwefel_1() {
		if (Tests.dims < 2) {
			throw new RuntimeException("The Rosenbrock function requires more than one input variable.");
		}
		this.setDnValue();
		this.setUpValue();
		this.setOptimum();
		this.counter = 0L;
	}

	private void setDnValue() {
		this.init(this.dnValue, 0.);
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
		this.init(this.optimum, 0.);
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
		for (Integer i = 0; i < n - 1; i++) {
			target += Math.sqrt(x[i] + 0.5);
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