package com.google.code.optimization.functions;

import com.google.code.optimization.Const;

public class Identity0 implements TestFunction {
	private static final double modInit = 5.0;

	private double[] dnValue = new double[Const.dims];
	private double[] upValue = new double[Const.dims];
	private double[] optimum = new double[Const.dims];
	private long counter;

	Identity0() {
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
		this.init(this.optimum, -5.);
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	private void init(double t[], double val) {
		for (int i = 0; i < Const.dims; i++) {
			t[i] = val;
		}
	}

	@Override
	public double get(double[] x) {
		//
		this.counter++;
		return x[0] > this.upValue[0] || x[0] < this.dnValue[0] ? 0 : x[0];
	}

	@Override
	public long getCounter() {
		return counter;
	}
}
