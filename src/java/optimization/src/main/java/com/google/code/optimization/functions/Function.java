package com.google.code.optimization.functions;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class Function {
	File f;
	public /*static final*/ Integer dim;
	protected static final int SAMPLES = 10;
	protected List<Double> up;
	protected List<Double> dn;

	public Function(int dim) {
		this.dim = dim;
	}

	public abstract List<Double> getUp();
	public abstract List<Double> getDn();

	public abstract void setUp(List<Double> up);
	public abstract void setDn(List<Double> dn);

	protected ArrayList<Double> x;

	public abstract Double get(ArrayList<Double> x);

	public ArrayList<Double> getX() {
		return x;
	}

	public void setX(List<Double> x) {
		this.x = (ArrayList<Double>) x;
	}

	public Double[] F(Double[][] s) {
		Double f[] = new Double[s.length];
		for(int i = 0; i < s.length; i++) {
			f[i] = this.get(new ArrayList<Double>(Arrays.asList(s[i])));
		}
		return f;
	}
}
