package com.google.code.optimization.functions;

import java.util.Arrays;

import com.google.code.optimization.Const;
import com.google.code.optimization.Tests;

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
		upValue[0] = 2.0;
		upValue[1] = 0.1;
		upValue[2] = 10.;
		upValue[3] = 2.0;
	}

	@Override
	public double[] getUpValue() {
		return this.optimum;
	}

	private void setOptimum() {
		// best solution by: Solving Engineering Optimization Problem /
		// lcagnina@unsl.edu.ar / Carlos A. Coello Coello
		// f(x) = 1.724852
		optimum[0] = 0.205730;
		optimum[1] = 3.470489;
		optimum[2] = 9.036624;
		optimum[3] = 0.205729;
	}

	@Override
	public double[] getOptimum() {
		return this.optimum;
	}

	private double[] getRestriction(double[] x) {
		double[] target = new double[7];
		double x1 = x[0];
		double xx1 = x1 * x1;
		double x2 = x[1];
		double x3 = x[2];
		double x4 = x[3];
		
		target[0] = tau(x)-13_600.;
		target[1] = omicron(x)-30_000.;
		target[2] = x1 - x4;
		target[3] = 0.10471*xx1+0.04811*x3*x4*(14. + x2) - 5.;
		target[4] = 0.125 - x1;
		target[5] = delta(x)-0.25;
		target[6] = 6_000. - pc(x);

		return target;
	}

	private double pc(double[] x) {
		return 0.033_044_210*x[2]*x[3]*x[3]*x[3]*(1-(  x[2]*0.028_234_622  ));
	}

	private double delta(double[] x) {
		return 65_856_000./30e6/x[3]/x[2]/x[2]/x[2];
	}
	
	

	private double omicron(double[] x) {
		return 504_000./x[3]/x[2]/x[2];
	}

	private double tau(double[] x) {
		double target = 0;
		double t1 = 6_000 / (Const.SQRT_2*x[0]*x[1]);
		double m = 6_000*(14+x[1]/2);
		double r = Math.sqrt(x[1]*x[1]/4 + ((x[0]+x[2])/2)*((x[0]+x[2])/2));
		double j = 2*(x[0]*x[1]*Const.SQRT_2*(x[1]*x[1]/12.)+(x[0]+x[2])*(x[0]+x[2])/4.);
		double t2 = m*r/j;
		target = t1*t1 + 2*t1*t2*x[1]/2./r + t2*t2;
		return Math.sqrt(target);
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
		double r = 1e6;
		counter++;
		return ff + r*p;
	}

	@Override
	public long getCounter() {
		return this.counter;
	}

	public static void main(String args[]) {
		DesignWeldedBeam dwb = new DesignWeldedBeam();
		double x[] = dwb.getOptimum();
		System.out.println(Arrays.toString(x));
		System.out.println(dwb.get(x));
		System.out.println(Arrays.toString(dwb.getRestriction(x)));
		System.out.println();
		double my[] = {0.6389221390241124, 0.3359477585646171, 29.941413265087274, 172.27627637623542};
		System.out.println(Arrays.toString(my));
		System.out.println(dwb.get(my));
		System.out.println(Arrays.toString(dwb.getRestriction(my)));
		System.out.println();
		for(int i = 0; i < 10; i++) {
			double x1 = Tests.random.nextDouble();
			double x2 = Tests.random.nextDouble();
			double x3 = Tests.random.nextDouble();
			double x4 = Tests.random.nextDouble();
			
			double test[] = {1*x1, 1*x2, -1*x3, -1*x4};
			System.out.println(Arrays.toString(test));
			System.out.println(dwb.get(test));
		}
		
	}
	
	@Override
	public void resetCounter() {
		counter = 0L;
	}
}