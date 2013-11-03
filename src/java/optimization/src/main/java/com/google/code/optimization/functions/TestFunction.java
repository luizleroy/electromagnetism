package com.google.code.optimization.functions;

import com.google.code.optimization.Const;

public interface TestFunction {
	
	/**
	 * Maximus limits
	 */
	public static Double up[] = new Double[Const.dim];
	/**
	 * Minimus limits
	 */
	public static Double dn[] = new Double[Const.dim];
	
	/**
	 * This is f(X)
	 * @param x is a input vector
	 * @return image of X (Double x[] is a domain) - f(X)
	 */
	Double get(Double[] x);

	/**
	 * This is ALL g(X)
	 * @param x is a input vector
	 * @return gi(X) index by (for ieR | 0 <= i <= n )
	 */
	Double[] getG(Double[] x);
}
