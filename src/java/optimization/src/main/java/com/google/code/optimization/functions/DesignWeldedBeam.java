package com.google.code.optimization.functions;

import java.util.Arrays;

public class DesignWeldedBeam implements TestFunction {

	private double[] dnValue = new double[4];
	private double[] upValue = new double[4];
	private double[] optimum = new double[4];
	private long counter;

	public DesignWeldedBeam() {
		this.setDnValue();
		this.setUpValue();
		this.setOptimum();
		this.counter = 0L;
	}

	private void setDnValue() {
		dnValue[0] = 0.1;
		dnValue[1] = 0.1;
		dnValue[2] = 0.1;
		dnValue[3] = 0.1;
	}

	@Override
	public double[] getDnValue() {
		return this.dnValue;
	}

	private void setUpValue() {
		upValue[0] = 2.;
		upValue[1] = 10.;
		upValue[2] = 10.;
		upValue[3] = 2.;
	}

	@Override
	public double[] getUpValue() {
		return this.optimum;
	}

	private void setOptimum() {
		// best solution by: Solving Engineering Optimization Problem /
		// lcagnina@unsl.edu.ar / Carlos A. Coello Coello
		optimum[0] = 0.;
		optimum[1] = 0.;
		optimum[2] = 0.;
		optimum[3] = 0.;
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	private double[] getRestriction(double[] x) {
		double[] target = new double[100];
		double x1 = x[0];
		double xx1 = x1 * x1;
		double x2 = x[1];
		double x3 = x[2];
		double x4 = x[3];
		
		target[0] = 0.;
		target[1] = 0;
		Double g3 = x1 - x4;
		target[2] = g3;
		Double g4 = 0.10471*xx1+0.04811*x3*x4*(14.+x2) - 5.;
		target[3] = g4;
		Double g5 = 0.125 - x1;
		target[4] = g5;
		target[5] = 0.;
		target[6] = 0.;

		return target;
	}

	@Override
	public double get(double[] x) {
		double x1 = x[0];
		double xx1 = x1*x1;
		double x2 = x[1];
		double x3 = x[2];
		double x4 = x[3];
		double ff = 1.10471*xx1*x2 + 0.04811*x3*x4*(14.0 + x2);

		double p = 0;
		double g[] = this.getRestriction(x);
		for (int i = 0; i < g.length; i++) {
			double sum = Math.max(g[i], 0.);
			p += sum*sum;
		}
		double r = 1000_000_000.;
		counter++;
		return ff + r*p;
	}

	@Override
	public long getCounter() {
		return this.counter;
	}

	public static void main(String args[]) {
		DesignPressureVessel dpv = new DesignPressureVessel();
		double x[] = dpv.getOptimum();
		System.out.println(Arrays.toString(x));
		System.out.println(dpv.get(x));
	}
	
	@Override
	public void resetCounter() {
		counter = 0L;
	}
}