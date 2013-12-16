package com.google.code.optimization.functions;

import com.google.code.optimization.Tests;


public class Rosenbrock  implements TestFunction {
	private static final double modInit = 5.12;

	private double[] dnValue = new double[Tests.dims];
	private double[] upValue = new double[Tests.dims];
	private double[] optimum = new double[Tests.dims];
	private long counter;

	Rosenbrock() {
		if (Tests.dims < 2) {
			throw new RuntimeException("The Rosenbrock function requires more than one input variable.");
		}
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
		this.init(this.optimum, 1.);
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
		double target = 0;
		for (Integer i = 0; i < Tests.dims-1; i++) {
			double xi = x[i];
			double xxi = xi*xi;
			double xxii = x[i+1]*x[+1];
			target += 100*(xxi-xxii)*(xxi-xxii) + (1-xi)*(1-xi);
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
