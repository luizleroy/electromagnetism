package com.google.code.optimization.functions;

import com.google.code.optimization.Const;

/**
 * Rastrigin - default limits -5.12 to 5.12
 * @author luizleroy
 *
 */
public class Rastrigin implements TestFunction{
	private static final double modInit = 5.12;
	
	Rastrigin() {
		Rastrigin.initDn(TestFunction.dn);
		Rastrigin.initUp(TestFunction.up);
	}
	
	@Override
	public Double get(Double x[]) {
		Double target = (double) (10 * Const.dim);
		//IF(x.length != Const.dim) THROW NEW RuntimeException();
		for (int i = 0; i < Const.dim; i++) {
			double xi = x[i];
			double xx = xi * xi;
			target = target + xx - 10 * Math.cos(2 * Math.PI * xi);
		}
		return target;
	}
	
	@Override
	public Double[] getG(Double x[]) {
		return null;
	}

	private static void initDn(Double[] dn) {
		Rastrigin.init(dn, -1*Math.abs(modInit));
	}

	private static void init(Double t[], double val) {
		for(int i = 0; i < Const.dim; i++) {
			t[i] = val;
		}
	}

	private static void initUp(Double[] up) {
		Rastrigin.init(up, -Math.abs(modInit));
	}
}
