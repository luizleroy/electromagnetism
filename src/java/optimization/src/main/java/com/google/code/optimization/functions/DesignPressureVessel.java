package com.google.code.optimization.functions;

import java.util.Arrays;

import com.google.code.optimization.Tests;

public class DesignPressureVessel implements TestFunction {

	private double[] dnValue = new double[4];
	private double[] upValue = new double[4];
	private double[] optimum = new double[4];
	private long counter;

	public DesignPressureVessel() {
		this.setDnValue();
		this.setUpValue();
		this.setOptimum();
		this.counter = 0L;
	}

	private void setDnValue() {
		dnValue[0] = 0.6;
		dnValue[1] = 0.3;
		dnValue[2] = 40.;
		dnValue[3] = 170.;
	}

	@Override
	public double[] getDnValue() {
		return this.dnValue;
	}

	private void setUpValue() {
		upValue[0] = 0.9;
		upValue[1] = 0.5;
		upValue[2] = 50.;
		upValue[3] = 180.;
	}

	@Override
	public double[] getUpValue() {
		return this.optimum;
	}

	private void setOptimum() {
		// best solution by: Solving Engineering Optimization Problem /
		// lcagnina@unsl.edu.ar / Carlos A. Coello Coello
		optimum[0] = 0.8125;
		optimum[1] = 0.4375;
		optimum[2] = 42.098446;
		optimum[3] = 176.636596;
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	private double[] getRestriction(double[] x) {
		double[] target = new double[4];
		double x1 = x[0];
		double x2 = x[1];
		double x3 = x[2];
		double xx3 = x3 * x3;
		double xxx3 = x3 * xx3;
		double x4 = x[3];
		double xx4 = x4*x4;

		double g1 = -x1 + 0.0193 * x3;
		target[0] = g1;
		double g2 = -x2 + 0.00954 * x3;
		target[1] = g2;
		double g3 = -Math.PI * xx3 * xx4 - 1.3333333333333333333333333333333 * Math.PI * xxx3 + 1_296_000.0;
		target[2] = g3;
		double g4 = x4 - 240.;
		target[3] = g4;

		return target;
	}

	@Override
	public double get(double[] x) {
		double x1 = x[0];
		double xx1 = x1 * x1;
		double x4 = x[3];
		double x3 = x[2];
		double xx3 = x3 * x3;
		double x2 = x[1];

		double ff = 0.6224 * x1 * x3 * x4 + 1.7781 * x2 * xx3 + 3.1661 * xx1
				* x4 + 19.84 * xx1 * x3;

		double p = 0;
		double g[] = this.getRestriction(x);
		for (int i = 0; i < g.length; i++) {
			double sum = Math.max(g[i], 0.);
			p += sum*sum;
		}
		double r = 1.6437e+12;
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
		System.out.println(Arrays.toString(dpv.getRestriction(x)));
		System.out.println();
		double my[] = {0.6389221390241124, 0.3359477585646171, 29.941413265087274, 172.27627637623542};
		System.out.println(Arrays.toString(my));
		System.out.println(dpv.get(my));
		System.out.println(Arrays.toString(dpv.getRestriction(my)));
		System.out.println();
		for(int i = 0; i < 10; i++) {
			double x1 = Tests.random.nextDouble();
			double x2 = Tests.random.nextDouble();
			double x3 = Tests.random.nextDouble();
			double x4 = Tests.random.nextDouble();
			
			double test[] = {1*x1, 1*x2, -1*x3, -1*x4};
			System.out.println(Arrays.toString(test));
			System.out.println(dpv.get(test));
		}
		
	}
	
	@Override
	public void resetCounter() {
		counter = 0L;
	}
}