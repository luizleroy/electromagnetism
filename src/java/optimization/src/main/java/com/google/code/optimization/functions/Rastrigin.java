package com.google.code.optimization.functions;

import com.google.code.optimization.Tests;

/**
 * @author luizleroy
 * 
 */
public class Rastrigin implements TestFunction {
	private static final double modInit = 5.12;
	private static final double offSet = -3.1;

	private double[] dnValue = new double[Tests.dims];
	private double[] upValue = new double[Tests.dims];
	private double[] optimum = new double[Tests.dims];
	private long counter;

	Rastrigin() {
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
		this.init(this.optimum, offSet);
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
		Double target = (double) (10 * Tests.dims);
		for (int i = 0; i < Tests.dims; i++) {
			double xi = x[i] - offSet;
			double xxi = xi * xi;
			target = target + xxi - 10 * Math.cos(2 * Math.PI * xi);
		}
		this.counter++;
		return target;
	}

	@Override
	public long getCounter() {
		return counter;
	}

	@Override
	public void resetCounter() {
		counter = 0L;
	}
}
