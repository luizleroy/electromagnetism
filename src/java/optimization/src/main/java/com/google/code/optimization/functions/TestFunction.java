package com.google.code.optimization.functions;

public interface TestFunction {

	double[] getOptimum();

	double[] getUpValue();

	double[] getDnValue();

	/**
	 * This is ff(X)
	 * 
	 * @param x
	 *            is a input vector
	 */
	double get(double[] x);

	long getCounter();
}
