package com.google.code.optimization.functions;

import java.util.Arrays;

import com.google.code.optimization.Const;

public class Bohachevsky implements TestFunction {
	private static final double modInit = 5.12;
	private static final double offSet = 0.;

	private double[] dnValue = new double[Const.dims];
	private double[] upValue = new double[Const.dims];
	private double[] optimum = new double[Const.dims];
	private long counter;

	Bohachevsky() {
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
		for (int i = 0; i < Const.dims; i++) {
			t[i] = val;
		}
	}

	@Override
	public double get(double[] x) {
		Integer n = Const.dims;
		double target = 0;
		for (Integer i = 0; i < n - 1; i++) {
			double xi = x[i] - offSet;
			double xii = x[i + 1] - offSet;
			double xxi = xi * xi;
			double xxii = xii * xii;
			target += xxi + 2 * xxii - 0.3 * Math.cos(3 * Math.PI * xi) - 0.4
					* Math.cos(4 * Math.PI * xii) + 0.7;
		}
		this.counter++;
		return target;
	}

	@Override
	public long getCounter() {
		return counter;
	}
	
	public static void main(String args[]) {
		Const.dims = 4;
		Bohachevsky bohachevsky = new Bohachevsky();
		double x[] = bohachevsky.getOptimum();
		System.out.println(Arrays.toString(x));
		System.out.println(bohachevsky.get(x));
	}
}