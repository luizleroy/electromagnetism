package com.google.code.optimization.functions;

import java.util.Arrays;

import com.google.code.optimization.Tests;

public class MinimizationWeightSpeed implements TestFunction {
	private double[] dnValue = new double[7];
	private double[] upValue = new double[7];
	private double[] optimum = new double[7];
	private long counter;

	public MinimizationWeightSpeed() {
		this.setDnValue();
		this.setUpValue();
		this.setOptimum();
		this.counter = 0L;
	}

	private void setDnValue() {
		dnValue[0] = (2.6);
		dnValue[1] = (0.7);
		dnValue[2] = (17.);
		dnValue[3] = (7.3);
		dnValue[4] = (7.8);
		dnValue[5] = (2.9);
		dnValue[6] = (5.);

	}

	@Override
	public double[] getDnValue() {
		return this.dnValue;
	}

	private void setUpValue() {
		upValue[0] = (3.6);
		upValue[1] = (0.8);
		upValue[2] = (28.);
		upValue[3] = (8.3);
		upValue[4] = (8.3);
		upValue[5] = (3.9);
		upValue[6] = (5.5);
	}

	@Override
	public double[] getUpValue() {
		return this.optimum;
	}

	private void setOptimum() {
		// best solution by: Solving Engineering Optimization Problem /
		// lcagnina@unsl.edu.ar / Carlos A. Coello Coello
		// f(x) = 1.724852
		optimum[0] = 3.5;
		optimum[1] = 0.7;
		optimum[2] = 17.;
		optimum[3] = 7.3;
		optimum[4] = 7.8;
		optimum[5] = 3.350214;
		optimum[6] = 5.286683;
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	public double[] getRestriction(double[] x) {
		double[] target = new double[11];
		double x1 = x[0];
		double x2 = x[1];
		double xx2 = x2 * x2;
		double x3 = x[2];
		double xx3 = x3 * x3;
		double x4 = x[3];
		double xx4 = x1 * x1;
		double x5 = x[4];
		double xx5 = x5 * x5;
		double x6 = x[5];
		double xx6 = x6 * x6;
		double x7 = x[6];
		double xx7 = x7 * x7;
		double xxx4 = xx4 * x4;
		double xxx5 = xx5 * x5;
		double xxx6 = xx6 * x6;
		double xxx7 = xx7 * x7;
		double xxxx7 = xxx7 * x7;

		Double g1 = 27 / (x1 * xx2 * x3) - 1;
		target[0] = g1;
		Double g2 = 397.5000 / (x1 * xx2 * xx3);
		target[1] = g2;
		Double g3 = 1.9300 * xxx4 / (x1 * xx2 * xx3) - 1;
		target[2] = g3;
		Double g4 = 1.9300 * xxx5 / (x2 * x3 * xxxx7) - 1;
		target[3] = g4;
		Double g5 = Math
				.sqrt(((745 * x4 / x2 / x3) * (745 * x4 / x2 / x3) + 16.9 * 1000000))
				/ (110.0 * xxx6) - 1;
		target[4] = g5;
		Double g6 = Math
				.sqrt(((745 * x5 / x2 / x3) * (745 * x5 / x2 / x3) + 157.5 * 1000000))
				/ (85.0 * xxx7) - 1;
		target[5] = g6;
		Double g7 = x2 * x3 / 40. - 1;
		target[6] = g7;
		Double g8 = 5 * x2 / x1 - 1;
		target[7] = g8;
		Double g9 = x1 / 12 / x2 - 1;
		target[8] = g9;
		Double g10 = (1.5 * x6 + 1.9) / x4 - 1;
		target[9] = g10;
		Double g11 = (1.1 * x7 + 1.9) / x5 - 1;
		target[10] = g11;

		return target;
	}

	@Override
	public double get(double[] x) {
		double x1 = x[0];
		double x2 = x[1];
		double x3 = x[2];
		double x4 = x[3];
		double x5 = x[4];
		double x6 = x[5];
		double x7 = x[6];
		double xx2 = x2 * x2;
		double xx3 = x3 * x3;
		double xx6 = x6 * x6;
		double xx7 = x7 * x7;
		double xxx6 = xx6 * x6;
		double xxx7 = xx7 * x7;

		return 0.7854 * x1 * xx2 * (3.3333 * xx3 + 14.9334 * x3 - 43.0934)
				- 1.508 * x1 * (xx6 + xx7) + 7.4777 * (xxx6 + xxx7) + 0.7854
				* (x4 * xx6 + x5 * xx7);
	}

	@Override
	public void resetCounter() {
		counter = 0L;
	}

	@Override
	public long getCounter() {
		return this.counter;
	}

	public static void main(String args[]) {
		
		MinimizationWeightSpeed mws = new MinimizationWeightSpeed();
		double x[] = mws.getOptimum();
		System.out.println(Arrays.toString(x));
		System.out.println(mws.get(x));
		System.out.println(Arrays.toString(mws.getRestriction(x)));
		System.out.println();
		System.out.println();
		for (int i = 0; i < 10; i++) {
			double x1 = Tests.random.nextDouble();
			double x2 = Tests.random.nextDouble();
			double x3 = Tests.random.nextDouble();
			double x4 = Tests.random.nextDouble();
			double x5 = Tests.random.nextDouble();
			double x6 = Tests.random.nextDouble();
			double x7 = Tests.random.nextDouble();

			double test[] = { 1 * x1, 1 * x2, -1 * x3, -1 * x4, -1 * x5, -1 * x6, -1 * x7 };
			System.out.println(Arrays.toString(test));
			System.out.println(mws.get(test));
		}

	}
}
