package com.google.code.optimization.functions;

import java.util.Arrays;

import com.google.code.optimization.Tests;


public class Schaffer  implements TestFunction {
	private static final double modInit = 0.1;
	private static final double offSet = 0.;

	private double[] dnValue = new double[Tests.dims];
	private double[] upValue = new double[Tests.dims];
	private double[] optimum = new double[Tests.dims];
	private long counter;

	Schaffer() {
		if (Tests.dims != 3) {
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
		this.optimum[0] = 0.0564745;
		this.optimum[1] = 0.0101062;
		this.optimum[2] = 0.0000358396;
		//this.init(this.optimum, xxx);
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
		for (Integer i = 0; i < Tests.dims; i++) {
			double xi = x[i] - offSet;
			target += xi*xi;
		}
		target = Math.pow(target, 0.25)*(Math.sin(50*Math.pow(target,0.1))*Math.sin(50*Math.pow(target,0.1))+1);
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

	public static void main(String args[]) {
		Schaffer sch = new Schaffer();
		double x[] = sch.getOptimum();
		System.out.println(Arrays.toString(x));
		System.out.println(sch.get(x));
		System.out.println();
		double my[] = {38.9504,51.6199,-13.4715,31.0996,-78.0490};
		System.out.println(Arrays.toString(my));
		System.out.println(sch.get(my));
		System.out.println();
	}
}
